// ignore_for_file: file_names

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/DeliverymanModel.dart';
import 'package:courier/Models/PickupModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_Pickups extends StatefulWidget {
  const QuickTechIT_Pickups({Key key}) : super(key: key);

  @override
  _QuickTechIT_PickupsState createState() => _QuickTechIT_PickupsState();
}

// ignore: camel_case_types
class _QuickTechIT_PickupsState extends State<QuickTechIT_Pickups> {
  List<PickupModel> pickups = [];
  List<DeliverymanModel> deliverymens = [];

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
        MerchantNetwork().getPickups(startFrom).then((value) {
          if (value.length < 20) {
            isData = false;
          }
          for (int i = 0; i < value.length; i++) {
            setState(() {
              pickups.add(value[i]);
            });
            if (value[i].deliveryman != null) {
              MerchantNetwork()
                  .getDeliveryMen(int.parse(value[i].deliveryman.toString()))
                  .then((value) {
                setState(() {
                  deliverymens.add(value);
                });
              });
            }
          }
          setState(() {
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
              "Pickups",
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
          child: pickups.isEmpty && isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : pickups.isEmpty
                  ? const Center(
                      child: Text("No Pickups Available"),
                    )
                  : RefreshIndicator(
                      onRefresh: () {
                        setState(() {
                          pickups.clear();
                          deliverymens.clear();
                          startFrom = 0;
                          isData = true;
                        });
                        return getData();
                      },
                      child: SingleChildScrollView(
                          padding: const EdgeInsets.all(10),
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pickups.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return parcelItem(index);
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

  Widget parcelItem(int index) {
    int deliverymenIndex;
    for (int i = 0; i < deliverymens.length; i++) {
      if (deliverymens[i].id == pickups[index].deliveryman) {
        deliverymenIndex = i;
        break;
      }
    }
    return InkWell(
      onTap: () {
        Get.defaultDialog(
            title: "Pickup Details",
            content: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Pickup Address",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                        color: Colors.grey[600]),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    pickups[index].pickupAddress.toString(),
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Pickup Type",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                        color: Colors.grey[600]),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    pickups[index].pickuptype == 1
                        ? "Next Day Delivery"
                        : pickups[index].pickuptype == 2
                            ? "Same Day Delivery"
                            : "Not Assign",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (pickups[index].note != null)
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      "Note",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                          color: Colors.grey[600]),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                if (pickups[index].note != null)
                  const SizedBox(
                    height: 2,
                  ),
                if (pickups[index].note != null)
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      pickups[index].note.toString(),
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                if (pickups[index].note != null)
                  const SizedBox(
                    height: 10,
                  ),
                if (pickups[index].estimedparcel != null)
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      "Estimated Parcel",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                          color: Colors.grey[600]),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                if (pickups[index].estimedparcel != null)
                  const SizedBox(
                    height: 2,
                  ),
                if (pickups[index].estimedparcel != null)
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      pickups[index].estimedparcel.toString(),
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                if (pickups[index].estimedparcel != null)
                  const SizedBox(
                    height: 10,
                  ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Close"))
            ]);
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
            // Container(
            //   width: Get.width,
            //   child: Text(
            //       "Merchant"
            //   ),
            // ),
            // SizedBox(height: 5,),
            // Container(
            //   width: Get.width,
            //   child: Text(
            //       "Merchant Phone"
            //   ),
            // ),
            // SizedBox(height: 5,),
            SizedBox(
              width: Get.width,
              child: Text(
                deliverymenIndex != null
                    ? deliverymens[deliverymenIndex].name
                    : "Not Assign",
                style: const TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: Get.width,
              child: Text(
                pickups[index].pickupAddress,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: Get.width,
              child: Text(
                pickups[index].status == 0
                    ? "Not Assigned"
                    : pickups[index].status == 1
                        ? "Pending"
                        : pickups[index].status == 2
                            ? "Accepted"
                            : pickups[index].status == 3
                                ? "Cancelled"
                                : "",
                style: TextStyle(fontSize: 16, color: UIColors.primaryColor),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //         "Area"
            //     ),
            //     Text(
            //         "Status"
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
