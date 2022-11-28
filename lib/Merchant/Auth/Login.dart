// ignore_for_file: file_names

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_MerchantLogin extends StatefulWidget {
  const QuickTechIT_MerchantLogin({Key key}) : super(key: key);

  @override
  _QuickTechIT_MerchantLoginState createState() =>
      _QuickTechIT_MerchantLoginState();
}

// ignore: camel_case_types
class _QuickTechIT_MerchantLoginState extends State<QuickTechIT_MerchantLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController phoneController = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPhoneLogin = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                // FractionallySizedBox(
                //   widthFactor: .7,
                //   child: Container(
                //     width: Get.width,
                //     child: Image(
                //         image: AssetImage('assets/images/logo.png'),
                //         fit: BoxFit.fill),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Merchant Login",
                    style: TextStyle(
                        color: UIColors.blackColor,
                        fontSize: ResponsiveFlutter.of(context).fontSize(4),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Row(
                      //   children: [
                      // Expanded(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //   border: Border(
                      //     top: !isPhoneLogin
                      //         ? BorderSide.none
                      //         : BorderSide(
                      //             color: UIColors.primaryColor,
                      //           ),
                      //     bottom: isPhoneLogin
                      //         ? BorderSide.none
                      //         : BorderSide(
                      //             color: UIColors.primaryColor,
                      //           ),
                      //     left: !isPhoneLogin
                      //         ? BorderSide.none
                      //         : BorderSide(
                      //             color: UIColors.primaryColor,
                      //           ),
                      //     right: !isPhoneLogin
                      //         ? BorderSide.none
                      //         : BorderSide(
                      //             color: UIColors.primaryColor,
                      //           ),
                      //   ),
                      // ),
                      //     child: TextButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           isPhoneLogin = true;
                      //         });
                      //       },
                      //       child: Text(
                      //         "Mobile Login",
                      //         style: TextStyle(
                      //           color: isPhoneLogin
                      //               ? UIColors.primaryColor
                      //               : UIColors.primaryColor2,
                      //           fontSize: 17,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       border: Border(
                      //         top: isPhoneLogin
                      //             ? BorderSide.none
                      //             : BorderSide(
                      //                 color: UIColors.primaryColor,
                      //               ),
                      //         bottom: !isPhoneLogin
                      //             ? BorderSide.none
                      //             : BorderSide(
                      //                 color: UIColors.primaryColor,
                      //               ),
                      //             left: isPhoneLogin
                      //                 ? BorderSide.none
                      //                 : BorderSide(
                      //                     color: UIColors.primaryColor,
                      //                   ),
                      //             right: isPhoneLogin
                      //                 ? BorderSide.none
                      //                 : BorderSide(
                      //                     color: UIColors.primaryColor,
                      //                   ),
                      //           ),
                      //         ),
                      //         child: TextButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               isPhoneLogin = false;
                      //             });
                      //           },
                      //           child: Text(
                      //             "Email Login",
                      //             style: TextStyle(
                      //               color: !isPhoneLogin
                      //                   ? UIColors.primaryColor
                      //                   : UIColors.primaryColor2,
                      //               fontSize: 17,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          // isPhoneLogin ? "Phone" :
                          "Email",
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
                        child:
                            // isPhoneLogin
                            // ? TextFormField(
                            //     controller: usernameController,
                            //     validator: (phone) {
                            //       if (phone.isEmpty) {
                            //         return "Please enter your phone number";
                            //       } else if (phone.length != 11) {
                            //         return "Phone Number must be 11 digit";
                            //       } else {
                            //         return null;
                            //       }
                            //     },
                            //     inputFormatters: [
                            //       FilteringTextInputFormatter.digitsOnly
                            //     ],
                            //     keyboardType: TextInputType.phone,
                            //     decoration: InputDecoration(
                            //       contentPadding:
                            //           const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            //       prefixIcon: Icon(
                            //         Icons.phone_iphone,
                            //         color: UIColors.primaryColor,
                            //       ),
                            //       border: InputBorder.none,
                            //       hintStyle: TextStyle(
                            //           color: Colors.grey.withOpacity(.8)),
                            //       hintText: "Phone",
                            //     ),
                            //   )
                            // :
                            TextFormField(
                          controller: usernameController,
                          validator: (email) {
                            if (email.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                              return "Please enter an valid email";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(
                              Icons.email,
                              color: UIColors.primaryColor,
                            ),
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.8)),
                            hintText: "Email",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          "Password",
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
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your password";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.vpn_key_rounded,
                                color: UIColors.primaryColor,
                              ),
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Password"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/merchant/password/reset');
                        },
                        child: SizedBox(
                          width: Get.width,
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.8),
                              color: UIColors.primaryColor,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
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
                              MerchantNetwork().login(usernameController.text,
                                  passwordController.text);
                              // Get.toNamed(
                              //     '/merchant/otp/${phoneController.text}');
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account",
                            style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.2),
                              color: UIColors.blackColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('/merchant/reg');
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2),
                                  color: UIColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
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
                              Get.toNamed('/merchant/parcel/track');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timeline,
                                  color: UIColors.primaryColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "TRACK YOUR PARCEL",
                                  style: TextStyle(
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(2.2),
                                      color: UIColors.primaryColor),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
