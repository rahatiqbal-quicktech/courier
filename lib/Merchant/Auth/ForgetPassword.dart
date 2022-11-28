// ignore_for_file: file_names, use_key_in_widget_constructors

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_MerchantForgetPassword extends StatefulWidget {
  @override
  QuickTechIT_MerchantForgetPasswordState createState() =>
      QuickTechIT_MerchantForgetPasswordState();
}

// ignore: camel_case_types
class QuickTechIT_MerchantForgetPasswordState
    extends State<QuickTechIT_MerchantForgetPassword> {
  TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FractionallySizedBox(
                  widthFactor: .7,
                  child: Image.network(
                      "https://image.freepik.com/free-vector/forgot-password-concept-illustration_114360-1010.jpg")),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                      color: UIColors.blackColor,
                      fontSize: ResponsiveFlutter.of(context).fontSize(4),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: Get.width,
                      child: Text(
                        "Phone",
                        style: TextStyle(
                          color: UIColors.blackColor,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: CustomDecoration().textFieldDecoration(),
                      child: TextFormField(
                        controller: phoneController,
                        validator: (phone) {
                          if (phone.isEmpty) {
                            return "Please enter your phone number";
                          } else if (phone.length != 11) {
                            return "Phone Number must be 11 digit";
                          } else {
                            return null;
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          prefixIcon: Icon(
                            Icons.phone_iphone,
                            color: UIColors.primaryColor,
                          ),
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Phone",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                            MerchantNetwork()
                                .passwordReset(phoneController.text);
                          }
                        },
                        child: Text(
                          "Submit",
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
            ],
          ),
        ),
      ),
    );
  }
}
