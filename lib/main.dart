/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:io';

import 'package:courier/Merchant/Auth/ForgetPassword.dart';
import 'package:courier/Merchant/Auth/Login.dart';
import 'package:courier/Merchant/Auth/OTPVerification.dart';
import 'package:courier/Merchant/Auth/PasswordVerify.dart';
import 'package:courier/Merchant/Auth/Registration.dart';
import 'package:courier/Merchant/Dashboard/Dashboard.dart';
import 'package:courier/Merchant/Parcel/CreateParcel.dart';
import 'package:courier/Merchant/Parcel/EditParcel.dart';
import 'package:courier/Merchant/Parcel/ParcelDetails.dart';
import 'package:courier/Merchant/Parcel/Parcels.dart';
import 'package:courier/Merchant/Parcel/TrackParcel.dart';
import 'package:courier/Merchant/Parcel/TrackParcelDetails.dart';
import 'package:courier/Merchant/Payments/Payments.dart';
import 'package:courier/Merchant/Pickup/PickupRequest.dart';
import 'package:courier/Merchant/Pickup/Pickups.dart';
import 'package:courier/Merchant/Profile/Profile.dart';
import 'package:courier/Merchant/Setting/Setting.dart';
import 'package:courier/Merchant/Support/Support.dart';
import 'package:courier/Merchant/topup/topup_history_screen.dart';
import 'package:courier/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  HttpOverrides.global = MyHttpOverrides();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.fade,
      getPages: [
        GetPage(
          name: '/',
          page: () => const QuickTechIT_SplashScreen(),
        ),
        GetPage(
          name: '/merchant/login',
          page: () => const QuickTechIT_MerchantLogin(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/merchant/otp/:phoneNumber',
          page: () => QuicktechIT_MerchantOTPVerification(),
        ),
        GetPage(
          name: '/merchant/reg',
          page: () => const QuickTechIT_MerchantRegistration(),
        ),
        GetPage(
          name: '/merchant/password/reset',
          page: () => QuickTechIT_MerchantForgetPassword(),
        ),
        GetPage(
          name: '/merchant/password/verify/:id',
          page: () => const QuickTechIT_MerchantPasswordVerify(),
        ),
        GetPage(
          name: '/merchant/home',
          page: () => const QuickTechIT_Dashboard(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/merchant/parcel/new',
          page: () => QuickTechIT_CreateParcel(),
        ),
        GetPage(
          name: '/merchant/parcel/list/:type',
          page: () => const QuickTechIT_Parcels(),
        ),
        GetPage(
          name: '/merchant/parcel/track',
          page: () => const QuickTechIT_TrackParcel(),
        ),
        GetPage(
          name: '/merchant/parcel/track/:trackId',
          page: () => const QuickTechIT_TrackParcelDetails(),
        ),
        GetPage(
          name: '/merchant/parcel/details/:id',
          page: () => QuickTechIT_ParcelDetails(),
        ),
        GetPage(
          name: '/merchant/parcel/edit/:id',
          page: () => const QuickTechIT_EditParcel(),
        ),
        GetPage(
          name: '/merchant/pickup/request/:type',
          page: () => const QuickTechIT_PickupRequest(),
        ),
        GetPage(
          name: '/merchant/pickup/list',
          page: () => const QuickTechIT_Pickups(),
        ),
        GetPage(
          name: '/merchant/payments',
          page: () => const QuickTechIT_Payments(),
        ),
        GetPage(
          name: '/merchant/settings',
          page: () => const QuickTechIT_Setting(),
        ),
        GetPage(
          name: '/merchant/profile',
          page: () => const QuickTechIT_Profile(),
        ),
        GetPage(
          name: '/merchant/support',
          page: () => const QuickTechIT_Support(),
        ),
        // GetPage(
        //   name: '/merchant/topup_history',
        //   page: () => const TopupHistoryScreen(),
        // ),
      ],
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
