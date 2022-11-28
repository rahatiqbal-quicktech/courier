import 'dart:developer';

import 'package:courier/Merchant/Payments/service/payments_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

reportView(context, String postData) async {
  final pw.Document pdf = pw.Document();

  final pref = GetStorage();

  const tableHeaders = [
    'Tracking ID',
    'Name',
    'Phone',
    'Total',
    'Charge',
    'Sub Total',
    'Payment'
  ];

  const imageProvider = AssetImage('assets/images/logo.png');

  final image = await flutterImageProvider(imageProvider);

  // final parcels = allParcels[index];

  var listData = await PaymentsService().getPaymentDetails(postData);
  List<Parcel> parcels = [];
  for (var i = 0; i < listData.length; i++) {
    int total = int.parse(listData[i].cod.toString());
    int charge = int.parse(listData[i].codCharge.toString()) +
        int.parse(listData[i].deliveryCharge.toString());
    var data = Parcel(
      listData[i].trackingCode,
      listData[i].recipientName,
      listData[i].recipientPhone,
      // listData[i].merchantPaid.toString(),
      total.toString(),
      charge.toString(),

      // listData[i].deliveryCharge.toString(),
      // listData[i].merchantAmount.toString(),
      (total - charge).toString(),
      listData[i].merchantPaid.toString(),
    );
    log(data.toString());
    parcels.add(data);
  }

  var data = listData[0];

  pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Container(
              child: pw.Column(children: [
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Image(image, width: 100),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text("Invoice #: ${data.id}"),
                        pw.Text(
                            "Date: ${DateFormat.yMMMMd().format(DateTime.parse(data.createdAt.toString()))}"),
                        pw.Text(
                            "Time: ${DateFormat.jms().format(DateTime.parse(data.createdAt.toString()))}"),
                        pw.Text("Merchant Name: ${pref.read('userName')}"),
                        pw.Text(
                            "Merchant Phone: ${pref.read('userPhone').toString()}")
                      ])
                ]),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              border: null,
              cellAlignment: pw.Alignment.centerLeft,
              headerDecoration: const pw.BoxDecoration(
                color: PdfColor.fromInt(0xfffce8e8),
              ),
              headerHeight: 20,
              cellAlignments: {
                0: pw.Alignment.center,
                1: pw.Alignment.center,
                2: pw.Alignment.center,
                3: pw.Alignment.center,
                4: pw.Alignment.center,
                5: pw.Alignment.centerRight,
                6: pw.Alignment.centerRight,
              },
              headerStyle: pw.TextStyle(
                color: PdfColor.fromHex("#000000"),
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
              ),
              cellStyle: const pw.TextStyle(
                fontSize: 10,
              ),
              rowDecoration: pw.BoxDecoration(
                border: pw.Border(
                  bottom: pw.BorderSide(
                    color: PdfColor.fromHex("#899976"),
                    width: .5,
                  ),
                ),
              ),
              headers: List<String>.generate(
                tableHeaders.length,
                (col) => tableHeaders[col],
              ),
              data: List<List<String>>.generate(
                listData.length,
                (row) => List<String>.generate(
                  tableHeaders.length,
                  (col) => parcels[0].getIndex(col),
                ),
              ),
            ),
            pw.SizedBox(height: 30),
            pw.Align(
                alignment: pw.Alignment.bottomRight,
                child: pw.Container(
                    width: 150,
                    child: pw.Column(children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('Total : '),
                            pw.Text('${data.merchantAmount} N',
                                style: const pw.TextStyle(fontSize: 15)),
                          ]),
                    ])))
          ]))
        ]; // Center
      }));

  await Printing.layoutPdf(
      onLayout: (_) => pdf.save(), name: "Payment_Invoice (${data.id})");
}

class Parcel {
  final String trackingId;
  final String name;
  final String phone;
  final String total;
  final String charge;
  final String subTotal;
  final String payment;

  const Parcel(this.trackingId, this.name, this.phone, this.total, this.charge,
      this.subTotal, this.payment);

  getIndex(int index) {
    switch (index) {
      case 0:
        return trackingId;
      case 1:
        return name;
      case 2:
        return phone;
      case 3:
        return total;
      case 4:
        return charge;
      case 5:
        return subTotal;
      case 6:
        return payment;
    }
    return '';
  }
}
