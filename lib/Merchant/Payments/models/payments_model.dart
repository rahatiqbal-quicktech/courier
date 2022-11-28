// To parse this JSON data, do
//
//     final paymentsModel = paymentsModelFromJson(jsonString);

import 'dart:convert';

List<PaymentsModel> paymentsModelFromJson(String str) =>
    List<PaymentsModel>.from(
        json.decode(str).map((x) => PaymentsModel.fromJson(x)));

String paymentsModelToJson(List<PaymentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentsModel {
  PaymentsModel({
    this.totalParcel,
    this.total,
    this.updatedAt,
  });

  int totalParcel;
  String total;
  DateTime updatedAt;

  factory PaymentsModel.fromJson(Map<String, dynamic> json) => PaymentsModel(
        totalParcel: json["total_parcel"],
        total: json["total"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "total_parcel": totalParcel,
        "total": total,
        "updated_at": updatedAt.toIso8601String(),
      };
}
