// ignore_for_file: file_names

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/ParcelModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:courier/track/track_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: camel_case_types
class QuickTechIT_Parcels extends StatefulWidget {
  const QuickTechIT_Parcels({Key key}) : super(key: key);

  @override
  _QuickTechIT_ParcelsState createState() => _QuickTechIT_ParcelsState();
}

// ignore: camel_case_types
class _QuickTechIT_ParcelsState extends State<QuickTechIT_Parcels> {
  String type = Get.parameters['type'];

  List<ParcelModel> parcels = [];

  String searchData;

  int startFrom = 0;

  bool isData = true;
  bool isLoading = false;

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<bool> getData() async {
    if (!isLoading) {
      if (isData) {
        setState(() {
          isLoading = true;
        });
        await MerchantNetwork().getParcels(startFrom, type).then((value) {
          if (value.length < 20) {
            isData = false;
          }
          setState(() {
            parcels = value;
            isLoading = false;
          });
        });
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            elevation: 0,
            backgroundColor: UIColors.primaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            title: const Text(
              "Parcels",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: UIColors.pageBackground,
        endDrawer: const NavigationDrawer(),
        bottomNavigationBar: const MerchantBottomBar(),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.maxScrollExtent ==
                scrollInfo.metrics.pixels) {
              getData();
            }
            return true;
          },
          child: parcels.isEmpty && isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : parcels.isEmpty
                  ? const Center(
                      child: Text("No Parcel Available"),
                    )
                  : RefreshIndicator(
                      onRefresh: () {
                        setState(() {
                          parcels.clear();
                          startFrom = 0;
                          isData = true;
                        });
                        return getData();
                      },
                      child: SingleChildScrollView(
                          padding: const EdgeInsets.all(5),
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                width: Get.width,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextFormField(
                                  onChanged: (val) {
                                    setState(() {
                                      searchData = val.toLowerCase();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(.8)),
                                    hintText: "Search Parcel",
                                  ),
                                ),
                              ),
                              ListView.builder(
                                // separatorBuilder: (context, index) {
                                //   return Divider(
                                //     height: 1,
                                //   );
                                // },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: parcels.length,
                                itemBuilder: (BuildContext context, int index) {
                                  startFrom = parcels.length;
                                  if (searchData != null) {
                                    if (parcels[index]
                                            .recipientName
                                            .toLowerCase()
                                            .contains(searchData) ||
                                        parcels[index]
                                            .recipientAddress
                                            .toLowerCase()
                                            .contains(searchData) ||
                                        parcels[index]
                                            .recipientPhone
                                            .toLowerCase()
                                            .contains(searchData) ||
                                        parcels[index]
                                            .firstName
                                            .toLowerCase()
                                            .contains(searchData) ||
                                        parcels[index]
                                            .phoneNumber
                                            .toLowerCase()
                                            .contains(searchData) ||
                                        parcels[index]
                                            .companyName
                                            .toLowerCase()
                                            .contains(searchData)) {
                                      return parcelItem(parcels[index]);
                                    } else {
                                      return Container();
                                    }
                                  } else {
                                    return parcelItem(parcels[index]);
                                  }
                                },
                              ),
                              if (isLoading)
                                const Center(
                                  child: CircularProgressIndicator(),
                                )
                            ],
                          )),
                    ),
        ));
  }

  Widget parcelItem(ParcelModel item) {
    return InkWell(
        onTap: () {
          Get.toNamed('/merchant/parcel/details/${item.id}');
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 4,
                offset: const Offset(4, 4), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    // width: Get.width,
                    child: Text(
                      item.recipientName,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(() => TrackScreen(
                            parcelId: item.id.toString(),
                          ));
                    },
                    child: Text("Live Track"),
                  ),
                ],
              ),
              SizedBox(
                width: Get.width,
                child: Text(
                  item.recipientPhone.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "COD=${item.cod} Charge=${item.deliveryCharge}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                      item.merchantpayStatus == null
                          ? "Unpaid"
                          : item.merchantpayStatus == "0"
                              ? "Processing"
                              : "Paid",
                      style: TextStyle(
                        fontSize: 15,
                        color: UIColors.primaryColor,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    GetStorage().read(item.status.toString()),
                    style:
                        TextStyle(fontSize: 16, color: UIColors.primaryColor),
                  ),
                  Text(
                    item.updatedAt,
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
