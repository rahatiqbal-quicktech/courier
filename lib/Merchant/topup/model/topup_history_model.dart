// To parse this JSON data, do
//
//     final topupHistoryModel = topupHistoryModelFromJson(jsonString);

import 'dart:convert';

List<TopupHistoryModel> topupHistoryModelFromJson(String str) =>
    List<TopupHistoryModel>.from(
        json.decode(str).map((x) => TopupHistoryModel.fromJson(x)));

String topupHistoryModelToJson(List<TopupHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopupHistoryModel {
  TopupHistoryModel({
    this.id,
    this.merchantId,
    this.email,
    this.mobile,
    this.amount,
    this.reference,
    this.status,
    this.channel,
    this.currency,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int merchantId;
  String email;
  String mobile;
  String amount;
  String reference;
  String status;
  String channel;
  String currency;
  DateTime createdAt;
  DateTime updatedAt;

  factory TopupHistoryModel.fromJson(Map<String, dynamic> json) =>
      TopupHistoryModel(
        id: json["id"],
        merchantId: json["merchant_id"],
        email: json["email"],
        mobile: json["mobile"],
        amount: json["amount"],
        reference: json["reference"],
        status: json["status"],
        channel: json["channel"],
        currency: json["currency"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merchant_id": merchantId,
        "email": emailValues.reverse[email],
        "mobile": mobileValues.reverse[mobile],
        "amount": amount,
        "reference": reference,
        "status": statusValues.reverse[status],
        "channel": channelValues.reverse[channel],
        "currency": currencyValues.reverse[currency],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Channel { CARD }

final channelValues = EnumValues({"card": Channel.CARD});

enum Currency { NGN }

final currencyValues = EnumValues({"NGN": Currency.NGN});

enum Email { UMEJIAKU87_YAHOO_COM, ESTHEREBOSIE_GMAIL_COM }

final emailValues = EnumValues({
  "estherebosie@gmail.com": Email.ESTHEREBOSIE_GMAIL_COM,
  "umejiaku87@yahoo.com": Email.UMEJIAKU87_YAHOO_COM
});

enum Mobile { THE_08032968501, MOBILE_08032968501, THE_0147896325 }

final mobileValues = EnumValues({
  "0803 296 8501": Mobile.MOBILE_08032968501,
  "0147896325": Mobile.THE_0147896325,
  "08032968501": Mobile.THE_08032968501
});

enum Status { SUCCESS }

final statusValues = EnumValues({"success": Status.SUCCESS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
