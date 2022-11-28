// ignore_for_file: file_names, prefer_if_null_operators

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:async';

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Merchant/notic_service.dart';
import 'package:courier/Models/dashboard_model.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:courier/track/track_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marquee/marquee.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_Dashboard extends StatefulWidget {
  const QuickTechIT_Dashboard({Key key}) : super(key: key);

  @override
  _QuickTechIT_DashboardState createState() => _QuickTechIT_DashboardState();
}

// ignore: camel_case_types
class _QuickTechIT_DashboardState extends State<QuickTechIT_Dashboard> {
  // MerchantDashboardModel dashboardModel;
  DashboardModel dashboardModel;

  // var publicKey = 'pk_test_d762fac7bdd8d0d03f9575dd6e579b45ff8b1c49';
  // final plugin = PaystackPlugin();
  // String ref = "";

  Timer _timer;

  @override
  void initState() {
    getData();

    _timer = Timer.periodic(const Duration(seconds: 30), (_) => getData());

    super.initState();
    // plugin.initialize(publicKey: publicKey);
  }

  getData() {
    MerchantNetwork().getMerchantDashboardData().then((value) {
      if (mounted) {
        setState(() {
          dashboardModel = value;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
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
        title: Text(GetStorage().read('companyName')),
      ),
      backgroundColor: UIColors.pageBackground,
      endDrawer: const NavigationDrawer(),
      bottomNavigationBar: const MerchantBottomBar(),
      body: Container(
        // decoration: BoxDecoration(image: CustomDecoration().watermark()),
        child: dashboardModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                child: Column(
                  children: [
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       Charge charge = Charge()
                    //         ..amount = 10000
                    //         ..reference = "54321"
                    //         ..accessCode = publicKey
                    //         ..email = 'customer@email.com';
                    //       CheckoutResponse response = await plugin.checkout(
                    //         context,
                    //         method: CheckoutMethod
                    //             .selectable, // Defaults to CheckoutMethod.selectable
                    //         charge: charge,
                    //       );
                    //     },
                    //     child: Text("Paystack")),
                    FutureBuilder(
                        future: NoticeService().getNotice(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return LinearProgressIndicator();
                          }
                          return Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: UIColors.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Marquee(
                              text: snapshot.data["title"],
                              // "Disclaimer : Don't pay into individual account for our services. PAY TO: 1225450780 | ZIDROP LOGISTICS | ZENITH BANK. Call 08076905 for more information.",
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Text(
                        "TRANSACTION COUNT FOR ${DateTime.now().month}, 2022",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      children: <Widget>[
                        singleReports(
                          "Pending",
                          dashboardModel.mPending,
                          const Color(0xFF1d2941),
                          // 0,
                          1,
                        ),
                        singleReports(
                          "Picked Up",
                          dashboardModel.mPick,
                          const Color(0xFF5f45da),
                          2,
                        ),
                        singleReports(
                          "Awaiting",
                          dashboardModel.mAwait,
                          const Color(0xFF670a91),
                          3,
                        ),
                        singleReports(
                          "Delivered",
                          dashboardModel.mDeliver,
                          const Color(0xFF096709),
                          4,
                        ),
                        singleReports(
                          "Partial Delivery",
                          dashboardModel.mPartialDeliver,
                          const Color(0xFF28a745),
                          6,
                        ),
                        singleReports(
                          "Returned ",
                          dashboardModel.mReturn,
                          const Color(0xFF9a8309),
                          8,
                        ),
                        singleReports(
                          "Collected Amount from DA",
                          dashboardModel.mDa,
                          const Color(0xFF1f6e91),
                          10,
                        ),
                        singleReports(
                          "Hold",
                          dashboardModel.mHold,
                          const Color(0xFFde3163),
                          5,
                        ),
                        // singleReports(
                        //   "Wallet Usage",
                        //   int.parse(dashboardModel.mWallet),
                        //   const Color(0xFFf012be),
                        //   1,
                        // ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/merchant/parcel/list/1');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFf012be),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFf012be).withOpacity(.5),
                              blurRadius: 4,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Wallet Usage",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            dashboardModel.mWallet != null
                                ? Text(
                                    "N ${dashboardModel.mWallet}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(3.5)),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Text(
                        "TRANSACTION COUNT FROM INCEPTION",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      children: <Widget>[
                        singleReports(
                          "Pending",
                          dashboardModel.tPending,
                          const Color(0xFF1d2941),
                          // 0,
                          1,
                        ),
                        singleReports(
                          "Picked Up",
                          dashboardModel.tPick,
                          const Color(0xFF5f45da),
                          2,
                        ),
                        singleReports(
                          "Awaiting",
                          dashboardModel.tAwait,
                          const Color(0xFF670a91),
                          3,
                        ),
                        singleReports(
                          "Delivered",
                          dashboardModel.tDeliver,
                          const Color(0xFF096709),
                          4,
                        ),
                        singleReports(
                          "Partial Delivery",
                          dashboardModel.tPartialDeliver,
                          const Color(0xFF28a745),
                          6,
                        ),
                        singleReports(
                          "Returned ",
                          dashboardModel.tReturn,
                          const Color(0xFF9a8309),
                          8,
                        ),
                        singleReports(
                          "Collected Amount from DA",
                          dashboardModel.tDa,
                          const Color(0xFF1f6e91),
                          10,
                        ),
                        singleReports(
                          "Hold",
                          dashboardModel.tHold,
                          const Color(0xFFde3163),
                          5,
                        ),
                        // singleReports(
                        //   "Wallet Usage",
                        //   dashboardModel.t,
                        //   const Color(0xFFf012be),
                        //   1,
                        // ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/merchant/parcel/list/1');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFf012be),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFf012be).withOpacity(.5),
                              blurRadius: 4,
                              offset: const Offset(
                                  4, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Available Wallet",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            dashboardModel.merchant.balance == null
                                ? Text(
                                    "N 0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(3.5)),
                                  )
                                : Text(
                                    "N ${dashboardModel.merchant.balance}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(3.5)),
                                  )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // GridView.count(
                    //   shrinkWrap: true,
                    //   primary: false,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   crossAxisSpacing: 0,
                    //   mainAxisSpacing: 0,
                    //   crossAxisCount: 2,
                    //   childAspectRatio: 1.5,
                    //   children: <Widget>[
                    //     singleReports2(
                    //       "Total Amount",
                    //       dashboardModel.totalAmount,
                    //       UIColors.navyBlueColor,
                    //     ),
                    //     singleReports2(
                    //       "Paid Amount",
                    //       dashboardModel.merchantPaid,
                    //       UIColors.navyBlueColor,
                    //     ),
                    //     singleReports2(
                    //       "Unpaid Amount",
                    //       dashboardModel.merchantUnpaid,
                    //       UIColors.navyBlueColor,
                    //     ),
                    //     Container(
                    //       margin: const EdgeInsets.all(8),
                    //       decoration: BoxDecoration(
                    //         color: Colors.orange,
                    //         borderRadius: BorderRadius.circular(10),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.grey.withOpacity(.5),
                    //             blurRadius: 4,
                    //             offset: const Offset(
                    //                 4, 4), // changes position of shadow
                    //           ),
                    //         ],
                    //       ),
                    //       padding: const EdgeInsets.all(10),
                    //       child: TextButton(
                    //         onPressed: () {
                    //           Get.toNamed('/merchant/support');
                    //         },
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               "Payment Request",
                    //               style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontSize: ResponsiveFlutter.of(context)
                    //                       .fontSize(2.2)),
                    //             ),
                    //             // SizedBox(
                    //             //   height: 5,
                    //             // ),
                    //             // Text(
                    //             //   value == null ? "" : value.toString(),
                    //             //   style: TextStyle(
                    //             //       color: Colors.white,
                    //             //       fontSize: ResponsiveFlutter.of(context).fontSize(3.5)),
                    //             // )
                    //           ],
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
      ),
    );
  }

  singleReports(String title, int value, Color color, int status) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/merchant/parcel/list/$status');
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(.5),
              blurRadius: 4,
              offset: const Offset(4, 4), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title == null ? "" : title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              value == null ? "" : value.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveFlutter.of(context).fontSize(3.5)),
            )
          ],
        ),
      ),
    );
  }

  singleReports2(String title, int value, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.5),
            blurRadius: 4,
            offset: const Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title == null ? "" : title,
            style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveFlutter.of(context).fontSize(2)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            value == null ? "" : value.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveFlutter.of(context).fontSize(3.5)),
          )
        ],
      ),
    );
  }
}
