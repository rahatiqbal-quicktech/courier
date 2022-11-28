// ignore_for_file: file_names

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_MerchantPasswordVerify extends StatefulWidget {
  const QuickTechIT_MerchantPasswordVerify({Key key}) : super(key: key);

  @override
  QuickTechIT_MerchantPasswordVerifyState createState() =>
      QuickTechIT_MerchantPasswordVerifyState();
}

// ignore: camel_case_types
class QuickTechIT_MerchantPasswordVerifyState
    extends State<QuickTechIT_MerchantPasswordVerify> {
  String id = Get.parameters['id'];

  TextEditingController pinController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Verify",
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
                          'Verify Pin',
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 4,
                              offset: const Offset(
                                  4, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: pinController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter verify pin";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Verify Pin"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          'New Password',
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 4,
                              offset: const Offset(
                                  4, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your new password";
                            } else if (value.length < 8) {
                              return "Password must be 8 digit";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "New Password"),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: UIColors.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 4,
                              offset: const Offset(
                                  4, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(8.0))),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              MerchantNetwork().passwordVerify(id,
                                  pinController.text, passwordController.text);
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
      ),
    );
  }
}
