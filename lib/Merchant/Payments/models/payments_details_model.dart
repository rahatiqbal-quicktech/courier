// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<PaymentsDetailsModel> paymentsDetailsModelFromJson(String str) =>
    List<PaymentsDetailsModel>.from(
        json.decode(str).map((x) => PaymentsDetailsModel.fromJson(x)));

String paymentsDetailsModelToJson(List<PaymentsDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentsDetailsModel {
  PaymentsDetailsModel({
    this.id,
    this.invoiceNo,
    this.merchantId,
    this.paymentInvoice,
    this.cod,
    this.merchantAmount,
    this.merchantDue,
    this.merchantpayStatus,
    this.merchantPaid,
    this.recipientName,
    this.recipientAddress,
    this.recipientPhone,
    this.note,
    this.deliveryCharge,
    this.payReturn,
    this.codCharge,
    this.productPrice,
    this.deliverymanId,
    this.deliverymanAmount,
    this.dPayinvoice,
    this.deliverymanPaystatus,
    this.pickupmanId,
    this.agentId,
    this.agentAmount,
    this.aPayinvoice,
    this.agentPaystatus,
    this.productName,
    this.productColor,
    this.productQty,
    this.productWeight,
    this.trackingCode,
    this.percelType,
    this.helpNumber,
    this.reciveZone,
    this.orderType,
    this.codType,
    this.paymentOption,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  dynamic invoiceNo;
  int merchantId;
  dynamic paymentInvoice;
  int cod;
  int merchantAmount;
  int merchantDue;
  String merchantpayStatus;
  int merchantPaid;
  String recipientName;
  String recipientAddress;
  String recipientPhone;
  String note;
  int deliveryCharge;
  int payReturn;
  int codCharge;
  dynamic productPrice;
  dynamic deliverymanId;
  dynamic deliverymanAmount;
  dynamic dPayinvoice;
  dynamic deliverymanPaystatus;
  dynamic pickupmanId;
  dynamic agentId;
  dynamic agentAmount;
  dynamic aPayinvoice;
  dynamic agentPaystatus;
  String productName;
  String productColor;
  int productQty;
  int productWeight;
  String trackingCode;
  int percelType;
  dynamic helpNumber;
  String reciveZone;
  int orderType;
  int codType;
  int paymentOption;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentsDetailsModel.fromJson(Map<String, dynamic> json) =>
      PaymentsDetailsModel(
        id: json["id"],
        invoiceNo: json["invoiceNo"],
        merchantId: json["merchantId"],
        paymentInvoice: json["paymentInvoice"],
        cod: json["cod"],
        merchantAmount: json["merchantAmount"],
        merchantDue: json["merchantDue"],
        merchantpayStatus: json["merchantpayStatus"],
        merchantPaid: json["merchantPaid"],
        recipientName: json["recipientName"],
        recipientAddress: json["recipientAddress"],
        recipientPhone: json["recipientPhone"],
        note: json["note"],
        deliveryCharge: json["deliveryCharge"],
        payReturn: json["pay_return"],
        codCharge: json["codCharge"],
        productPrice: json["productPrice"],
        deliverymanId: json["deliverymanId"],
        deliverymanAmount: json["deliverymanAmount"],
        dPayinvoice: json["dPayinvoice"],
        deliverymanPaystatus: json["deliverymanPaystatus"],
        pickupmanId: json["pickupmanId"],
        agentId: json["agentId"],
        agentAmount: json["agentAmount"],
        aPayinvoice: json["aPayinvoice"],
        agentPaystatus: json["agentPaystatus"],
        productName: json["productName"],
        productColor: json["productColor"],
        productQty: json["productQty"],
        productWeight: json["productWeight"],
        trackingCode: json["trackingCode"],
        percelType: json["percelType"],
        helpNumber: json["helpNumber"],
        reciveZone: json["reciveZone"],
        orderType: json["orderType"],
        codType: json["codType"],
        paymentOption: json["payment_option"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoiceNo": invoiceNo,
        "merchantId": merchantId,
        "paymentInvoice": paymentInvoice,
        "cod": cod,
        "merchantAmount": merchantAmount,
        "merchantDue": merchantDue,
        "merchantpayStatus": merchantpayStatus,
        "merchantPaid": merchantPaid,
        "recipientName": recipientName,
        "recipientAddress": recipientAddress,
        "recipientPhone": recipientPhone,
        "note": note,
        "deliveryCharge": deliveryCharge,
        "pay_return": payReturn,
        "codCharge": codCharge,
        "productPrice": productPrice,
        "deliverymanId": deliverymanId,
        "deliverymanAmount": deliverymanAmount,
        "dPayinvoice": dPayinvoice,
        "deliverymanPaystatus": deliverymanPaystatus,
        "pickupmanId": pickupmanId,
        "agentId": agentId,
        "agentAmount": agentAmount,
        "aPayinvoice": aPayinvoice,
        "agentPaystatus": agentPaystatus,
        "productName": productName,
        "productColor": productColor,
        "productQty": productQty,
        "productWeight": productWeight,
        "trackingCode": trackingCode,
        "percelType": percelType,
        "helpNumber": helpNumber,
        "reciveZone": reciveZone,
        "orderType": orderType,
        "codType": codType,
        "payment_option": paymentOption,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
