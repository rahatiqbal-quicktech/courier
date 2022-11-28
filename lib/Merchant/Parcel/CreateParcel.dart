// ignore_for_file: file_names, use_key_in_widget_constructors

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:developer';

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/ChargeModel.dart';
import 'package:courier/Models/CodChargeModel.dart';
import 'package:courier/Models/NearestZoneModel.dart';
import 'package:courier/Models/ServicesModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_CreateParcel extends StatefulWidget {
  @override
  _QuickTechIT_CreateParcelState createState() =>
      _QuickTechIT_CreateParcelState();
}

// ignore: camel_case_types
class _QuickTechIT_CreateParcelState extends State<QuickTechIT_CreateParcel> {
  // String slug = Get.parameters['slug'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController invoiceController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController cashCollectionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  TextEditingController productColorController = TextEditingController();

  List<String> parcelType = ['Regular', 'Liquid', 'Fragile'];
  List<String> paymentOptions = ['Prepaid', 'Pay on delivery'];
  int _selectedParcelType;
  int selectedPaymentOption;

  List<NearestZoneModel> deliveryArea = [];
  NearestZoneModel _selectedDeliveryArea;

  List<ServicesModel> services = [];
  List<ChargeModel> charges = [];
  ChargeModel selectedCharge;

  ServicesModel selectedService;
  CodChargeModel codCharge;
  int cashCollection = 0;
  int parcelWeight = 0;

  @override
  void initState() {
    MerchantNetwork().getNearestZones().then((value) {
      setState(() {
        deliveryArea = value;
      });
    });

    MerchantNetwork().getServices().then((value) {
      setState(() {
        services = value;
      });
    });

    MerchantNetwork().getCodCharge().then((value) {
      setState(() {
        codCharge = value;
      });
    });

    MerchantNetwork().getCharges().then((value) {
      setState(() {
        charges = value;
      });
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      primary: true,
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
          "Add New Parcel",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: UIColors.pageBackground,
      endDrawer: const NavigationDrawer(),
      bottomNavigationBar: const MerchantBottomBar(),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                    width: Get.width,
                    child: Text("Customer Name",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    controller: customerNameController,
                    validator: (value) =>
                        value == "" ? "Please enter customer name" : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Customer Name",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Customer Phone Number",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    controller: customerPhoneController,
                    validator: (phone) {
                      if (phone.isEmpty) {
                        return "Please enter phone number";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Customer Phone Number",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Customer Address",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 100,
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: deliveryAddressController,
                    validator: (value) =>
                        value == "" ? "Please enter Customer address" : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Customer Address",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //     width: Get.width,
                //     child: Text("Invoice",
                //         style: TextStyle(
                //             fontSize: ResponsiveFlutter.of(context).fontSize(2),
                //             color: UIColors.blackColor),
                //         textAlign: TextAlign.left)),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.circular(2),
                //   ),
                //   child: TextFormField(
                //     controller: invoiceController,
                //     validator: (value) =>
                //         value == "" ? "Please enter invoice number" : null,
                //     keyboardType: TextInputType.number,
                //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //     decoration: InputDecoration(
                //       contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                //       border: InputBorder.none,
                //       hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                //       hintText: "Invoice Number",
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                SizedBox(
                    width: Get.width,
                    child: Text("Weight",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    controller: weightController,
                    onChanged: (val) {
                      setState(() {
                        parcelWeight = val == "" ? 1 : int.parse(val);
                      });
                      generateParcelCharge();
                    },
                    validator: (value) =>
                        value == "" ? "Please enter parcel weight" : null,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Weight",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Parcel Type",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                      "Select",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: Colors.grey.withOpacity(.8)),
                    ), // Not necessary for Option 1
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    validator: (value) =>
                        value == null ? "Please select your parcel type" : null,
                    isExpanded: true,
                    value: _selectedParcelType,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedParcelType = newValue;
                      });
                      generateParcelCharge();
                    },
                    items: parcelType.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: parcelType.indexOf(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Product Name",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    // keyboardType: TextInputType.,
                    maxLines: null,
                    controller: productNameController,
                    validator: (value) => value == "" ? "Empty Field" : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Product Name",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Product Quantity",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLines: null,
                    controller: productQuantityController,
                    validator: (value) => value == "" ? "Empty Field" : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Product Quantity",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Product Color",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    // keyboardType: TextInputType.number,
                    maxLines: null,
                    controller: productColorController,
                    validator: (value) => value == "" ? "Empty Field" : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Product Color",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Cash Collection Amount",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    controller: cashCollectionController,
                    onChanged: (val) {
                      setState(() {
                        cashCollection = val.isEmpty ? 0 : int.parse(val);
                      });
                      generateParcelCharge();
                    },
                    validator: (value) =>
                        value == "" ? "Please enter Amount" : null,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Cash Collection Amount",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //     width: Get.width,
                //     child: Text("Product Price",
                //         style: TextStyle(
                //             fontSize: ResponsiveFlutter.of(context).fontSize(2),
                //             color: UIColors.blackColor),
                //         textAlign: TextAlign.left)),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.circular(2),
                //   ),
                //   child: TextFormField(
                //     controller: productPriceController,
                //     validator: (value) =>
                //         value == "" ? "Please enter Product price" : null,
                //     keyboardType: TextInputType.number,
                //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //     decoration: InputDecoration(
                //       contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                //       border: InputBorder.none,
                //       hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                //       hintText: "Product Price",
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                SizedBox(
                    width: Get.width,
                    child: Text("Payment Option",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                      "Select",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: Colors.grey.withOpacity(.8)),
                    ), // Not necessary for Option 1
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    validator: (value) => value == null
                        ? "Please select your Payment Option"
                        : null,
                    isExpanded: true,
                    value: selectedPaymentOption,
                    onChanged: (newValue) {
                      setState(() {
                        selectedPaymentOption = newValue;
                      });
                      // generateParcelCharge();
                    },
                    items: paymentOptions.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: paymentOptions.indexOf(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("State",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                      "Select State",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: Colors.grey.withOpacity(.8)),
                    ), // Not necessary for Option 1
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    validator: (value) =>
                        value == null ? "Please select your State" : null,
                    isExpanded: true,
                    value: selectedService,
                    onChanged: (newValue) {
                      setState(() {
                        selectedService = newValue;
                      });
                      selectedCharge = null;
                      for (int i = 0; i < charges.length; i++) {
                        // log(charges[i].packageId.runtimeType.toString());
                        if (charges[i].packageId == selectedService.id) {
                          setState(() {
                            selectedCharge = charges[i];
                          });
                        }
                      }
                      MerchantNetwork()
                          .getNearestZones(
                              stateId: selectedService.id.toString())
                          .then((value) {
                        setState(() {
                          deliveryArea = value;
                        });
                      });
                      generateParcelCharge();
                    },
                    items: services.map((ServicesModel value) {
                      return DropdownMenuItem(
                        child: Text(value.title),
                        value: value,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Delivery Area",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                // Container(
                //   width: Get.width,
                //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   decoration: CustomDecoration().textFieldDecoration(),
                //   child: DropdownButtonFormField(
                //     hint: Text(
                //       "Delivery Area",
                //       style: TextStyle(
                //           fontSize: ResponsiveFlutter.of(context).fontSize(2),
                //           color: Colors.grey.withOpacity(.8)),
                //     ), // Not necessary for Option 1
                //     decoration: InputDecoration(
                //       enabledBorder: InputBorder.none,
                //     ),
                //     validator: (value) =>
                //         value == null ? "Please select delivery area" : null,
                //     isExpanded: true,
                //     value: _selectedDeliveryArea,
                //     onChanged: (newValue) {
                //       setState(() {
                //         _selectedDeliveryArea = newValue;
                //       });
                //     },
                //     items: deliveryArea.map((NearestZoneModel value) {
                //       return DropdownMenuItem(
                //         child: new Text(value.zonename),
                //         value: value.id,
                //       );
                //     }).toList(),
                //   ),
                // ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: DropdownSearch<NearestZoneModel>(
                    mode: Mode.DIALOG,
                    showSelectedItems: false,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Delivery Area",
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    validator: (value) =>
                        value == null ? "Please select delivery area" : null,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDeliveryArea = newValue;
                      });

                      generateParcelCharge();
                    },
                    showSearchBox: true,
                    items: deliveryArea,
                    itemAsString: (NearestZoneModel area) => area.zonename,
                    // items: deliveryArea.map((NearestZoneModel value) {
                    //   return DropdownMenuItem(
                    //     child: new Text(value.zonename),
                    //     value: value.id,
                    //   );
                    // }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: Get.width,
                    child: Text("Note",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 100,
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: noteController,
                    // validator: (value) => value == "" ? "Note" : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Note",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                deliveryChargeDetails(),
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
                        log("submit ");

                        if (selectedCharge == null) {
                          Get.snackbar("Failed", "Failed due to charge");
                        } else {
                          String name = customerNameController.text;
                          String phoneNumber = customerPhoneController.text;
                          String address = deliveryAddressController.text;
                          String invoiceNo = invoiceController.text;
                          String weight = weightController.text;
                          int parcelType = _selectedParcelType + 1;
                          String cod = cashCollectionController.text;
                          String productPrice = productPriceController.text;
                          int receiveZone = _selectedDeliveryArea.id;
                          String note = noteController.text;
                          int deliveryCharge =
                              int.parse(selectedCharge.delivery.toString());
                          int extraDeliveryCharge = int.parse(
                              selectedCharge.extradelivery.toString());
                          int codCharge =
                              int.parse(selectedCharge.cod.toString());
                          int orderType = selectedService.id;
                          int codType = this.codCharge.id;

                          MerchantNetwork().createParcel(
                              name,
                              phoneNumber,
                              address,
                              invoiceNo,
                              weight,
                              parcelType,
                              cod,
                              productPrice,
                              receiveZone,
                              note,
                              deliveryCharge,
                              extraDeliveryCharge,
                              codCharge,
                              orderType,
                              codType,
                              productNameController.text,
                              productQuantityController.text,
                              productColorController.text,
                              "${selectedPaymentOption + 1}");
                        }
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )),
    );
  }

  int deliveryCharge = 0;
  int codFee = 0;
  int total = 0;

  generateParcelCharge() {
    int extraCharge = 0;
    if (parcelWeight > 1) {
      extraCharge = (parcelWeight - 1) *
          int.parse(selectedCharge.extradelivery.toString());
    } else {
      extraCharge = 0;
    }
    log(selectedCharge.cod.toString());
    codFee =
        ((cashCollection * int.parse(selectedCharge.cod.toString())) / 100)
            .round();
    setState(() {
      // codFee = ((cashCollection * selectedCharge.cod) / 100).round();
      deliveryCharge = selectedCharge.delivery +
          extraCharge +
          _selectedDeliveryArea.extradeliverycharge;
      total = cashCollection - (deliveryCharge + codFee);
    });
  }

  deliveryChargeDetails() {
    return Container(
      width: Get.width,
      color: Colors.grey[300],
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
            child: Text(
              "Delivery Charge Details",
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.8)),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 3,
            color: UIColors.primaryColor,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cash Collection",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    ),
                    Text(
                      "$cashCollection N",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Charge",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    ),
                    Text(
                      "$deliveryCharge N",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "COD Charge",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    ),
                    Text(
                      "$codFee N",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: UIColors.blackColor,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payable Amount",
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
                ),
                Text(
                  "$total N",
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: Text(
              "Note : If you pick up a request after 5pm, It will be received the next day",
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
