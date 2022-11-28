// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_if_null_operators

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuicktechIT_MerchantOTPVerification extends StatefulWidget {
  @override
  _QuicktechIT_MerchantOTPVerificationState createState() =>
      _QuicktechIT_MerchantOTPVerificationState();
}

// ignore: camel_case_types
class _QuicktechIT_MerchantOTPVerificationState
    extends State<QuicktechIT_MerchantOTPVerification> {
  String phoneNumber = Get.parameters['phoneNumber'];

  TextEditingController pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: UIColors.primaryColor),
      borderRadius: BorderRadius.circular(12),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int endTime;

  @override
  void initState() {
    // codeSent();

    super.initState();
  }

  codeSent() async {
    // await MerchantNetwork().login(phoneNumber).then((value) {
    //   if (value) {
    //     setState(() {
    //       endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      "OTP Verification",
                      style: TextStyle(
                          color: UIColors.blackColor,
                          fontSize: ResponsiveFlutter.of(context).fontSize(4),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "An code has been sent to\n$phoneNumber",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FractionallySizedBox(
                    widthFactor: .7,
                    child: PinPut(
                      fieldsCount: 6,
                      focusNode: _pinPutFocusNode,
                      controller: pinPutController,
                      validator: (code) {
                        if (code.length != 6) {
                          return 'OTP must be of 6 digit';
                        } else {
                          return null;
                        }
                      },
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(12)),
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "I didn't receive code ",
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2),
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (endTime != null)
                    CountdownTimer(
                      endTime: endTime,
                      widgetBuilder: (_, CurrentRemainingTime time) {
                        if (time == null) {
                          return TextButton(
                            onPressed: () {
                              codeSent();
                            },
                            child: Text(
                              "Resend Code",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  fontWeight: FontWeight.bold,
                                  color: UIColors.primaryColor),
                            ),
                          );
                        }
                        return Text(
                          '${time.min == null ? 0 : time.min}:${time.sec == null ? 0 : time.sec}',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.5),
                              fontWeight: FontWeight.bold,
                              color: UIColors.primaryColor),
                        );
                      },
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    decoration: CustomDecoration().buttonDecoration(),
                    child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(8.0))),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          String code = pinPutController.text.trim();

                          MerchantNetwork().verifyOTP(phoneNumber, code);
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.2),
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
