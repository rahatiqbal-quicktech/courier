// ignore_for_file: file_names

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_Support extends StatefulWidget {
  const QuickTechIT_Support({Key key}) : super(key: key);

  @override
  _QuickTechIT_SupportState createState() => _QuickTechIT_SupportState();
}

// ignore: camel_case_types
class _QuickTechIT_SupportState extends State<QuickTechIT_Support> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController descriptionController = TextEditingController();

  List<String> subject = [
    'Pickup',
    'Delivery',
    'Payment',
    'Billing & Charge',
    'Service',
    'Other'
  ]; // Option 2
  String _selectedSubject;

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
          "Support",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: UIColors.pageBackground,
      endDrawer: const NavigationDrawer(),
      bottomNavigationBar: const MerchantBottomBar(),
      body: Center(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                      width: Get.width,
                      child: Text("Subject",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: UIColors.blackColor),
                          textAlign: TextAlign.left)),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: CustomDecoration().textFieldDecoration(),
                    child: DropdownButtonFormField(
                      hint: Text(
                        "Select Please",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey.withOpacity(.8)),
                      ), // Not necessary for Option 1
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      validator: (value) =>
                          value == null ? "Select Please" : null,
                      isExpanded: true,
                      value: _selectedSubject,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedSubject = newValue;
                        });
                      },
                      items: subject.map((subject) {
                        return DropdownMenuItem(
                          child: Text(subject),
                          value: subject,
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: Get.width,
                      child: Text('Description',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: UIColors.blackColor),
                          textAlign: TextAlign.left)),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    decoration: CustomDecoration().textFieldDecoration(),
                    child: TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      validator: (value) =>
                          value == "" ? 'Please enter Description' : null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: 'Description',
                      ),
                    ),
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
                          MerchantNetwork().support(
                              _selectedSubject, descriptionController.text);

                          // setState(() {
                          //   _selectedSubject = null;
                          //   descriptionController.clear();
                          // });
                        }
                      },
                      child: Text(
                        'Send Message',
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.2),
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
