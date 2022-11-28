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
class QuickTechIT_MerchantRegistration extends StatefulWidget {
  const QuickTechIT_MerchantRegistration({Key key}) : super(key: key);

  @override
  QuickTechIT_MerchantRegistrationState createState() =>
      QuickTechIT_MerchantRegistrationState();
}

// ignore: camel_case_types
class QuickTechIT_MerchantRegistrationState
    extends State<QuickTechIT_MerchantRegistration> {
  TextEditingController nameOfBusinessController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController addressController = new TextEditingController();
  // TextEditingController businessUrlController = new TextEditingController();
  // TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                  "Sign up",
                  style: TextStyle(
                    color: UIColors.blackColor,
                    fontSize: ResponsiveFlutter.of(context).fontSize(3.5),
                  ),
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
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           border: Border(
                    //             top: !isPhoneLogin
                    //                 ? BorderSide.none
                    //                 : BorderSide(
                    //                     color: UIColors.primaryColor,
                    //                   ),
                    //             bottom: isPhoneLogin
                    //                 ? BorderSide.none
                    //                 : BorderSide(
                    //                     color: UIColors.primaryColor,
                    //                   ),
                    //             left: !isPhoneLogin
                    //                 ? BorderSide.none
                    //                 : BorderSide(
                    //                     color: UIColors.primaryColor,
                    //                   ),
                    //     right: !isPhoneLogin
                    //         ? BorderSide.none
                    //         : BorderSide(
                    //             color: UIColors.primaryColor,
                    //           ),
                    //   ),
                    // ),
                    // child: TextButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       isPhoneLogin = true;
                    //     });
                    //   },
                    //   child: Text(
                    //     "Mobile Register",
                    //     style: TextStyle(
                    //       color: isPhoneLogin
                    //           ? UIColors.primaryColor
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
                    //         left: isPhoneLogin
                    //             ? BorderSide.none
                    //             : BorderSide(
                    //                 color: UIColors.primaryColor,
                    //               ),
                    //         right: isPhoneLogin
                    //             ? BorderSide.none
                    //             : BorderSide(
                    //                 color: UIColors.primaryColor,
                    //               ),
                    //       ),
                    //     ),
                    //     child: TextButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               isPhoneLogin = false;
                    //             });
                    //           },
                    //           child: Text(
                    //             "Email Register",
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
                        "Name of Business",
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
                        controller: nameOfBusinessController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter your business name";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          prefixIcon: Icon(
                            Icons.business_center,
                            color: UIColors.primaryColor,
                          ),
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Business Name",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Text(
                        "Your Name",
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
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter your name";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          prefixIcon: Icon(
                            Icons.person,
                            color: UIColors.primaryColor,
                          ),
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Name",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // if (isPhoneLogin)
                    //   SizedBox(
                    //     width: Get.width,
                    //     child: Text(
                    //       "Phone",
                    //       style: TextStyle(
                    //         color: UIColors.blackColor,
                    //         fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    //       ),
                    //       textAlign: TextAlign.left,
                    //     ),
                    //   ),
                    // if (isPhoneLogin)
                    //   const SizedBox(
                    //     height: 5,
                    //   ),
                    // if (isPhoneLogin)
                    //   Container(
                    //     decoration: CustomDecoration().textFieldDecoration(),
                    //     child: TextFormField(
                    //       controller: phoneController,
                    //       validator: (phone) {
                    //         if (phone.isEmpty) {
                    //           return "Please enter your phone number";
                    //         } else if (phone.length != 11) {
                    //           return "Phone Number must be 11 digit";
                    //         } else {
                    //           return null;
                    //         }
                    //       },
                    //       inputFormatters: [
                    //         FilteringTextInputFormatter.digitsOnly
                    //       ],
                    //       keyboardType: TextInputType.phone,
                    //       decoration: InputDecoration(
                    //         contentPadding:
                    //             const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    //         prefixIcon: Icon(
                    //           Icons.phone_iphone,
                    //           color: UIColors.primaryColor,
                    //         ),
                    //         border: InputBorder.none,
                    //         hintStyle:
                    //             TextStyle(color: Colors.grey.withOpacity(.8)),
                    //         hintText: "Phone",
                    //       ),
                    //     ),
                    //   ),
                    // if (isPhoneLogin)
                    //   const SizedBox(
                    //     height: 10,
                    //   ),
                    // if (!isPhoneLogin)
                    SizedBox(
                      width: Get.width,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: UIColors.blackColor,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    // if (!isPhoneLogin)
                    const SizedBox(
                      height: 5,
                    ),
                    // if (!isPhoneLogin)
                    Container(
                      decoration: CustomDecoration().textFieldDecoration(),
                      child: TextFormField(
                        controller: emailController,
                        validator: (email) {
                          if (!isPhoneLogin) {
                            if (email.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                              return "Please enter an valid email";
                            } else {
                              return null;
                            }
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
                    // if (!isPhoneLogin)
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   width: Get.width,
                    //   child: Text(
                    //     "Pickup Address",
                    //     style: TextStyle(
                    //       color: UIColors.blackColor,
                    //       fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    //     ),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Container(
                    //   decoration: CustomDecoration().textFieldDecoration(),
                    //   child: TextFormField(
                    //     controller: addressController,
                    //     validator: (value) {
                    //       if (value.length == 0) {
                    //         return "Please enter your pickup address";
                    //       } else
                    //         return null;
                    //     },
                    //     keyboardType: TextInputType.multiline,
                    //     maxLines: null,
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    //       prefixIcon: Icon(
                    //         Icons.location_on,
                    //         color: UIColors.primaryColor,
                    //       ),
                    //       border: InputBorder.none,
                    //       hintStyle:
                    //           TextStyle(color: Colors.grey.withOpacity(.8)),
                    //       hintText: "Pickup Address",
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   width: Get.width,
                    //   child: Text(
                    //     "Business URL",
                    //     style: TextStyle(
                    //       color: UIColors.blackColor,
                    //       fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    //     ),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Container(
                    //   decoration: CustomDecoration().textFieldDecoration(),
                    //   child: TextFormField(
                    //     controller: businessUrlController,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    //       prefixIcon: Icon(
                    //         Icons.add_link,
                    //         color: UIColors.primaryColor,
                    //       ),
                    //       border: InputBorder.none,
                    //       hintStyle:
                    //           TextStyle(color: Colors.grey.withOpacity(.8)),
                    //       hintText: "Business Url",
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   width: Get.width,
                    //   child: Text(
                    //     "Username",
                    //     style: TextStyle(
                    //       color: UIColors.blackColor,
                    //       fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    //     ),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Container(
                    //   decoration: CustomDecoration().textFieldDecoration(),
                    //   child: TextFormField(
                    //     controller: usernameController,
                    //     validator: (value) {
                    //       if (value.length == 0) {
                    //         return "Please enter your username";
                    //       } else
                    //         return null;
                    //     },
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    //       prefixIcon: Icon(
                    //         Icons.supervised_user_circle,
                    //         color: UIColors.primaryColor,
                    //       ),
                    //       border: InputBorder.none,
                    //       hintStyle:
                    //           TextStyle(color: Colors.grey.withOpacity(.8)),
                    //       hintText: "Username",
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
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
                          if (value.length < 8) {
                            return "Must be 8 character";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: UIColors.primaryColor,
                          ),
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Password",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Text(
                        "Confirm Password",
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
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return "Password doesn't match";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          prefixIcon: Icon(
                            Icons.done,
                            color: UIColors.primaryColor,
                          ),
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Confirm Password",
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
                            FocusScope.of(context).requestFocus(FocusNode());
                            MerchantNetwork().register(
                                nameOfBusinessController.text,
                                nameController.text,
                                phoneController.text,
                                emailController.text,
                                // usernameController.text,
                                // addressController.text,
                                // businessUrlController.text,
                                passwordController.text);
                          }
                        },
                        child: Text(
                          "Sign up",
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
                    Text(
                      "Already have an account",
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        color: UIColors.blackColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/merchant/login');
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.primaryColor,
                            fontWeight: FontWeight.bold),
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
