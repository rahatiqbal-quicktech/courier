// ignore_for_file: file_names

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:async';

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/DeliverymanNetwork.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: camel_case_types
class QuickTechIT_SplashScreen extends StatefulWidget {
  const QuickTechIT_SplashScreen({Key key}) : super(key: key);

  @override
  _QuickTechIT_SplashScreenState createState() =>
      _QuickTechIT_SplashScreenState();
}

// ignore: camel_case_types
class _QuickTechIT_SplashScreenState extends State<QuickTechIT_SplashScreen> {
  Timer timer;
  double opacity = 0.0;

  final pref = GetStorage();

  @override
  void initState() {
    super.initState();

    MerchantNetwork().getParcelType();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (opacity != 1.0) {
        setState(() {
          opacity += 0.5;
        });
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      String userType = pref.read('userType');
      if (userType != null) {
        if (userType == "Merchant") {
          MerchantNetwork()
              .getUserData()
              .then((value) => Get.offAllNamed('/merchant/home'));
        } else if (userType == "Deliveryman") {
          DeliverymanNetwork()
              .login(pref.read('username'), pref.read('userPassword'), true);
        }
      } else {
        Get.offAllNamed('/merchant/login');
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.pageBackground,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: .7,
          child: SizedBox(
            width: Get.width,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 1),
              child: const Image(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
