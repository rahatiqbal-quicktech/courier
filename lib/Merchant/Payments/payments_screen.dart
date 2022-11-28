import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Payments/models/payments_model.dart';
import 'package:courier/Merchant/Payments/pdf_print.dart';
import 'package:courier/Merchant/Payments/service/payments_service.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.pageBackground,
      endDrawer: const NavigationDrawer(),
      bottomNavigationBar: const MerchantBottomBar(),
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
          "Payments",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<PaymentsModel>>(
              future: PaymentsService().getPayments(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: ListTile(
                            onTap: () {
                              reportView(context, data.updatedAt.toString());
                            },
                            title: Text(
                                "${data.updatedAt.day}.${data.updatedAt.month}.${data.updatedAt.year}"),
                            subtitle: Text("Total : ${data.total}"),
                            trailing: Text("Parcels : ${data.totalParcel}"),
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
