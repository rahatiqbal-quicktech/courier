// // ignore_for_file: file_names

// class NearestZoneModel {
//   int id;
//   String zonename;
//   int status;
//   String createdAt;
//   String updatedAt;

//   NearestZoneModel(
//       {this.id, this.zonename, this.status, this.createdAt, this.updatedAt});

//   NearestZoneModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     zonename = json['zonename'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['zonename'] = zonename;
//     data['status'] = status;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final nearestZoneModel = nearestZoneModelFromJson(jsonString);

import 'dart:convert';

List<NearestZoneModel> nearestZoneModelFromJson(String str) =>
    List<NearestZoneModel>.from(
        json.decode(str).map((x) => NearestZoneModel.fromJson(x)));

String nearestZoneModelToJson(List<NearestZoneModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NearestZoneModel {
  NearestZoneModel({
    this.id,
    this.state,
    this.zonename,
    this.extradeliverycharge,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int state;
  String zonename;
  int extradeliverycharge;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory NearestZoneModel.fromJson(Map<String, dynamic> json) =>
      NearestZoneModel(
        id: json["id"],
        state: json["state"],
        zonename: json["zonename"],
        extradeliverycharge: json["extradeliverycharge"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state": state,
        "zonename": zonename,
        "extradeliverycharge": extradeliverycharge,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
