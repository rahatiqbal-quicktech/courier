// ignore_for_file: use_key_in_widget_constructors, camel_case_types, file_names

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/ParcelDetailModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class QuickTechIT_ParcelDetails extends StatefulWidget {
  @override
  _QuickTechIT_ParcelDetailsState createState() =>
      _QuickTechIT_ParcelDetailsState();
}

class _QuickTechIT_ParcelDetailsState extends State<QuickTechIT_ParcelDetails> {
  String parcelId = Get.parameters['id'];

  ParcelDetailModel parcel;

  @override
  void initState() {
    getData();

    // Timer.periodic(Duration(seconds: 5), (_) => getData());

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getData() {
    MerchantNetwork().getParcelDetails(parcelId).then((value) {
      if (mounted) {
        setState(() {
          parcel = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
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
              "Parcel Detail",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: UIColors.pageBackground,
        endDrawer: const NavigationDrawer(),
        bottomNavigationBar: const MerchantBottomBar(),
        body: parcel == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (parcel.data.trackingCode != null)
                      Text(
                        "Tracking Id",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.trackingCode != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.trackingCode != null)
                      Text(
                        parcel.data.trackingCode,
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.trackingCode != null)
                      const SizedBox(
                        height: 10,
                      ),
                    if (parcel.data.recipientName != null)
                      Text(
                        "Customer Name",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.recipientName != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.recipientName != null)
                      Text(
                        parcel.data.recipientName,
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.recipientName != null)
                      const SizedBox(
                        height: 10,
                      ),
                    if (parcel.data.recipientAddress != null)
                      Text(
                        "Customer Address",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.recipientAddress != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.recipientAddress != null)
                      Text(
                        parcel.data.recipientAddress,
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.recipientAddress != null)
                      const SizedBox(
                        height: 10,
                      ),
                    if (parcel.data.recipientPhone != null)
                      Text(
                        "Customer Phone",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.recipientPhone != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.recipientPhone != null)
                      Text(
                        parcel.data.recipientPhone.toString(),
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.recipientPhone != null)
                      const SizedBox(
                        height: 10,
                      ),
                    // if (parcel.zonename != null)
                    //   Text(
                    //     "Area ",
                    //     style: TextStyle(
                    //         fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    //         color: Colors.grey[600]),
                    //     textAlign: TextAlign.justify,
                    //   ),
                    // if (parcel.zonename != null)
                    //   SizedBox(
                    //     height: 2,
                    //   ),
                    // if (parcel.zonename != null)
                    //   Text(
                    //     parcel.zonename,
                    //     style: TextStyle(
                    //         fontSize:
                    //             ResponsiveFlutter.of(context).fontSize(2.5)),
                    //     textAlign: TextAlign.justify,
                    //   ),
                    // if (parcel.zonename != null)
                    //   SizedBox(
                    //     height: 10,
                    //   ),
                    if (parcel.data.productWeight != null)
                      Text(
                        "Weight ",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.productWeight != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.productWeight != null)
                      Text(
                        parcel.data.productWeight.toString(),
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.productWeight != null)
                      const SizedBox(
                        height: 10,
                      ),
                    if (parcel.data.productPrice != null)
                      Text(
                        "Price ",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.productPrice != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.productPrice != null)
                      Text(
                        parcel.data.productPrice.toString(),
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.productPrice != null)
                      const SizedBox(
                        height: 10,
                      ),
                    if (parcel.data.deliveryCharge != null)
                      Text(
                        "Delivery Charge",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.deliveryCharge != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.deliveryCharge != null)
                      Text(
                        parcel.data.deliveryCharge.toString(),
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.deliveryCharge != null)
                      const SizedBox(
                        height: 10,
                      ),
                    if (parcel.data.cod != null)
                      Text(
                        "COD",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.cod != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.cod != null)
                      Text(
                        parcel.data.cod.toString(),
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.cod != null)
                      const SizedBox(
                        height: 10,
                      ),

                    Text(
                      "Sub Total ",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: Colors.grey[600]),
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(
                      height: 2,
                    ),

                    Text(
                      "${(parcel.data.cod == null ? 0 : int.parse(parcel.data.cod.toString())) - (parcel.data.deliveryCharge == null ? 0 : int.parse(parcel.data.deliveryCharge.toString()))}",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    if (parcel.data.updatedAt != null)
                      Text(
                        "Last Update and Time",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.updatedAt != null)
                      const SizedBox(
                        height: 2,
                      ),
                    if (parcel.data.updatedAt != null)
                      Text(
                        DateFormat.yMMMd()
                            .add_Hms()
                            .format(DateTime.parse(parcel.data.updatedAt)),
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.data.updatedAt != null)
                      const SizedBox(
                        height: 10,
                      ),

                    if (parcel.parcelNotes.isNotEmpty)
                      Text(
                        "Note",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),

                    if (parcel.parcelNotes.isNotEmpty)
                      const SizedBox(
                        height: 2,
                      ),

                    if (parcel.parcelNotes.isNotEmpty)
                      Text(
                        parcel.parcelNotes[0].noteTitle,
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),

                    if (parcel.parcelNotes.isNotEmpty)
                      const SizedBox(
                        height: 10,
                      ),
                    if (parcel.data.status == 1)
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: UIColors.primaryColor,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            var status = Permission.storage;
                            if (await status.isGranted) {
                              generateParcelInvoice();
                            } else {
                              if (await status.request().isGranted) {
                                generateParcelInvoice();
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                UIColors.primaryColor),
                          ),
                          child: Text(
                            "Invoice",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(2.2)),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    parcel.data.status == "1"
                        ? Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: UIColors.primaryColor,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(
                                    '/merchant/parcel/edit/${parcel.data.id}');
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    UIColors.primaryColor),
                              ),
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2.2)),
                              ),
                            ),
                          )
                        : Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: UIColors.primaryColor,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(
                                    '/merchant/parcel/track/${parcel.data.trackingCode}');
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    UIColors.primaryColor),
                              ),
                              child: Text(
                                "Track Parcel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2.2)),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ));
  }

  void generateParcelInvoice() async {
    final pw.Document pdf = pw.Document();

    const imageProvider = AssetImage('assets/images/logo.png');

    final image = await flutterImageProvider(imageProvider);

    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("Parcel Invoice"),
                        pw.Text("Invoice- ${parcel.data.invoiceNo}"),
                      ]),
                  pw.Divider(color: PdfColors.grey),
                  pw.SizedBox(height: 20),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Image(image, width: 120),
                        pw.BarcodeWidget(
                            barcode: pw.Barcode.qrCode(),
                            data:
                                "${MerchantNetwork().rootUrl}track/parcel/${parcel.data.trackingCode}",
                            width: 70,
                            height: 70),
                      ]),
                  pw.SizedBox(height: 20),
                  pw.Container(
                      width: double.infinity,
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.grey)),
                      child: pw.Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(parcel.data.createdAt)),
                          style: const pw.TextStyle(fontSize: 18),
                          textAlign: pw.TextAlign.center)),
                  pw.SizedBox(height: 20),
                  pw.Text("MERCHANT : ${parcel.data.firstName}",
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.Text("0" + parcel.data.phoneNumber.toString(),
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.SizedBox(height: 20),
                  pw.Text("CUSTOMER : ${parcel.data.recipientName}",
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.Text("0" + parcel.data.recipientPhone.toString(),
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.SizedBox(height: 20),
                  pw.Text("ADDRESS : ${parcel.data.recipientAddress}",
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.SizedBox(height: 20),
                  pw.Text("INSTRUCTION",
                      style: const pw.TextStyle(fontSize: 15)),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: double.infinity,
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.black)),
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text("COD",
                                style: const pw.TextStyle(fontSize: 15),
                                textAlign: pw.TextAlign.center),
                          ),
                          pw.Container(
                            width: 2,
                            height: 30,
                            color: PdfColors.black,
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text("TK ${parcel.data.cod}",
                                style: const pw.TextStyle(fontSize: 15),
                                textAlign: pw.TextAlign.center),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Row(children: [
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            child: pw.Row(children: [
                          pw.Container(
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey)),
                            height: 10,
                            width: 10,
                          ),
                          pw.SizedBox(width: 20),
                          pw.Text("DELIVERY"),
                        ]))),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            child: pw.Row(children: [
                          pw.Container(
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey)),
                            height: 10,
                            width: 10,
                          ),
                          pw.SizedBox(width: 20),
                          pw.Text("CANCELLED"),
                        ]))),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            child: pw.Row(children: [
                          pw.Container(
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey)),
                            height: 10,
                            width: 10,
                          ),
                          pw.SizedBox(width: 20),
                          pw.Text("HOLD"),
                        ])))
                  ]),
                  pw.SizedBox(height: 20),
                  pw.Divider(color: PdfColors.black),
                  pw.SizedBox(height: 20),
                  pw.Container(
                      width: double.infinity,
                      child: pw.Text(
                          "NOTE: IF LOST, PLEASE RETURN TO ADDRESS- 536, Shameem Sharani, West Shewrapara 1216 Dhaka, Dhaka Division, Bangladesh\nPHONE: 01303-355623 EMAIL: info@sparkdelivery.com.bd"
                              .toUpperCase(),
                          textAlign: pw.TextAlign.center,
                          style: const pw.TextStyle(fontSize: 15)))
                ]))
          ]; // Center
        }));

    await Printing.layoutPdf(
        onLayout: (_) => pdf.save(),
        name: "Parcel Invoice (${parcel.data.id})");

    // String path = await ExtStorage.getExternalStoragePublicDirectory(
    //     ExtStorage.DIRECTORY_DOWNLOADS);
    // String fullPath = path + "/Parcel_Invoice_${parcel.id}.pdf";
    // final File file = File(fullPath);

    // if (file.existsSync()) {
    //   Get.snackbar("Already Download", "Invoice already downloaded",
    //       snackPosition: SnackPosition.TOP,
    //       backgroundColor: UIColors.primaryColor2,
    //       colorText: Colors.white,
    //       duration: Duration(seconds: 10),
    //       mainButton: TextButton(
    //         child: Text(
    //           "Open",
    //           style: TextStyle(color: UIColors.primaryColor),
    //         ),
    //         onPressed: () {
    //           OpenFile.open(fullPath);
    //         },
    //       ));
    // } else {
    //   try {
    //     await file.writeAsBytes(await pdf.save());

    //     Get.snackbar("Download Complete", "Invoice saved into downloads folder",
    //         snackPosition: SnackPosition.TOP,
    //         backgroundColor: UIColors.primaryColor2,
    //         colorText: Colors.white,
    //         duration: Duration(seconds: 10),
    //         mainButton: TextButton(
    //           child: Text(
    //             "Open",
    //             style: TextStyle(color: UIColors.primaryColor),
    //           ),
    //           onPressed: () {
    //             OpenFile.open(fullPath);
    //           },
    //         ));
    //   } catch (e) {
    //     Get.snackbar("Download Failed", "Something went wrong",
    //         snackPosition: SnackPosition.TOP,
    //         backgroundColor: UIColors.primaryColor2,
    //         colorText: Colors.white,
    //         duration: Duration(seconds: 10));
    //   }
    // }
  }
}
