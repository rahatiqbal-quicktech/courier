// ignore_for_file: file_names, unused_element

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Payments/payments_screen.dart';
import 'package:courier/Merchant/topup/topup_screen.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  NavigationDrawerState createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<NavigationDrawer> {
  final pref = GetStorage();

  List<String> parcelTypes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    parcelTypes.clear();
    int i = 1;
    do {
      parcelTypes.add(i.toString());
      i++;
    } while (pref.read(i.toString()) != null);
    super.didChangeDependencies();
  }

  _launchURL() async {
    const url = 'https://quicktech-ltd.com/';
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Container(
        color: UIColors.pageBackground,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: UIColors.primaryColor,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      width: Get.width,
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                      child: Column(
                        children: [
                          Text(
                            pref.read('userName'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(3.2)),
                          ),
                          Text(
                            pref.read('userPhone').toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(2.5)),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Dashboard',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.home,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/home');
                      },
                    ),
                    ExpansionTile(
                      title: Text(
                        'My All Parcels',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.shopping_bag,
                        color: UIColors.blackColor,
                      ),
                      children: parcelTypes.map((String i) {
                        return ListTile(
                          dense: true,
                          title: Text(
                            pref.read(i),
                            style: TextStyle(
                                color: UIColors.blackColor,
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2)),
                          ),
                          onTap: () {
                            Get.offAndToNamed('/merchant/parcel/list/$i');
                          },
                        );
                      }).toList(),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Create Parcel',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.add_box,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/parcel/new');
                      },
                    ),
                    // ListTile(
                    //   dense: true,
                    //   title: Text(
                    //     'Topup',
                    //     style: TextStyle(
                    //         color: UIColors.blackColor,
                    //         fontSize:
                    //             ResponsiveFlutter.of(context).fontSize(2)),
                    //   ),
                    //   leading: Icon(
                    //     Icons.newspaper,
                    //     color: UIColors.blackColor,
                    //   ),
                    //   onTap: () {
                    //     // Get.offAndToNamed('/merchant/topup_history');
                    //     Get.to(() => TopupScreen());
                    //   },
                    // ),
                    // ListTile(
                    //   dense: true,
                    //   title: Text(
                    //     'Topup History',
                    //     style: TextStyle(
                    //         color: UIColors.blackColor,
                    //         fontSize:
                    //             ResponsiveFlutter.of(context).fontSize(2)),
                    //   ),
                    //   leading: Icon(
                    //     Icons.newspaper,
                    //     color: UIColors.blackColor,
                    //   ),
                    //   onTap: () {
                    //     Get.offAndToNamed('/merchant/topup_history');
                    //   },
                    // ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Pickup',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.directions_bike,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/pickup/list');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Pickup Request',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.pedal_bike_outlined,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.back();
                        Get.defaultDialog(
                            title: "Pickup Request Type",
                            content: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.offAndToNamed(
                                            '/merchant/pickup/request/1');
                                      },
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Stack(
                                            alignment: Alignment.topCenter,
                                            children: <Widget>[
                                              Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color:
                                                        UIColors.primaryColor2),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const SizedBox(
                                                      height: 50,
                                                    ),
                                                    Text(
                                                      "Next Day",
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(3),
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Delivery",
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      2.5),
                                                          color: Colors.white),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FractionalTranslation(
                                                translation:
                                                    const Offset(0.0, -0.5),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: UIColors
                                                                .primaryColor,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(
                                                                          15.0,
                                                                          15.0))
                                                            ]),
                                                        height: 80,
                                                        width: 80,
                                                        child: Center(
                                                            child: Text(
                                                          "24h",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2),
                                                              color:
                                                                  Colors.white),
                                                        )))),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Get.offAndToNamed(
                                            '/merchant/pickup/request/2');
                                      },
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Stack(
                                            alignment: Alignment.topCenter,
                                            children: <Widget>[
                                              Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color:
                                                        UIColors.primaryColor2),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const SizedBox(
                                                      height: 50,
                                                    ),
                                                    Text(
                                                      "Same Day",
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(3),
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Delivery",
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      2.5),
                                                          color: Colors.white),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FractionalTranslation(
                                                translation:
                                                    const Offset(0.0, -0.5),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: UIColors
                                                                .primaryColor,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(
                                                                          15.0,
                                                                          15.0))
                                                            ]),
                                                        height: 80,
                                                        width: 80,
                                                        child: Center(
                                                            child: Text(
                                                          "12h",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2),
                                                              color:
                                                                  Colors.white),
                                                        )))),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ));
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Payments',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.payment,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        // Get.offAndToNamed('/merchant/payments');
                        Get.to(() => PaymentsScreen());
                      },
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/profile');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Setting',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.settings,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/settings');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Support',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.contact_support,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/support');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Track Parcel',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.location_on,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/parcel/track');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.logout,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        MerchantNetwork().logout();
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   width: Get.width,
            //   padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Design & Developed By',
            //         style: TextStyle(
            //           fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
            //           color: Colors.grey,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {
            //           _launchURL();
            //         },
            //         child: Text(
            //           'QuickTech IT',
            //           style: TextStyle(
            //             fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
            //             color: UIColors.blackColor,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
