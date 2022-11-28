// ignore_for_file: file_names

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_TrackParcel extends StatefulWidget {
  const QuickTechIT_TrackParcel({Key key}) : super(key: key);

  @override
  _QuickTechIT_TrackParcelState createState() =>
      _QuickTechIT_TrackParcelState();
}

// ignore: camel_case_types
class _QuickTechIT_TrackParcelState extends State<QuickTechIT_TrackParcel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController idController = TextEditingController();

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
          "Track Parcel",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: UIColors.pageBackground,
      //endDrawer: NavigationDrawer(),
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
                      child: Text('Track Number',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: UIColors.blackColor),
                          textAlign: TextAlign.left)),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: CustomDecoration().textFieldDecoration(),
                    child: TextFormField(
                      controller: idController,
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          value == "" ? 'Please enter Track Number' : null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: 'Track Number',
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
                          String trackId = idController.text.toUpperCase();

                          if (trackId == "0") {
                            Get.snackbar(
                                "Failed", "Please enter correct track number");
                          } else {
                            Get.toNamed('/merchant/parcel/track/$trackId');
                          }
                        }
                      },
                      child: Text(
                        'Search',
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
