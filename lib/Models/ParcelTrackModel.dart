// ignore_for_file: file_names, library_prefixes, unnecessary_getters_setters, prefer_collection_literals, unnecessary_new, deprecated_member_use

import 'package:courier/Models/ParcelDetailModel.dart' as parcelData;

class ParcelTrackModel {
  bool _success;
  dynamic _message;
  List<Data> _data;
  parcelData.Data _parcel;

  ParcelTrackModel(
      {bool success,
      dynamic message,
      List<Data> data,
      parcelData.Data parcel}) {
    _success = success;
    _message = message;
    _data = data;
    _parcel = parcel;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  dynamic get message => _message;
  set message(dynamic message) => _message = message;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;
  parcelData.Data get parcel => _parcel;
  set parcel(parcelData.Data parcel) => _parcel = parcel;

  ParcelTrackModel.fromJson(Map<dynamic, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
    _parcel = parcelData.Data.fromJson(json['parcel']);
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['success'] = _success;
    data['message'] = _message;
    data['data'] = _data.map((v) => v.toJson()).toList();
    data['parcel'] = _parcel;
    return data;
  }
}

class Data {
  dynamic _id;
  dynamic _parcelId;
  dynamic _note;
  dynamic _noteTitle;
  dynamic _createdAt;
  dynamic _updatedAt;
  // Notes notes;

  Data({
    dynamic id,
    dynamic parcelId,
    dynamic note,
    dynamic noteTitle,
    dynamic createdAt,
    dynamic updatedAt,
    // this.notes
  }) {
    _id = id;
    _parcelId = parcelId;
    _note = note;
    _noteTitle = noteTitle;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get parcelId => _parcelId;
  set parcelId(dynamic parcelId) => _parcelId = parcelId;
  dynamic get note => _note;
  set note(dynamic note) => _note = note;
  dynamic get noteTitle => _noteTitle;
  set noteTitle(dynamic noteTitle) => _noteTitle = noteTitle;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  Data.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _parcelId = json['parcelId'];
    _note = json['note'];
    _noteTitle = json['noteTitle'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    // notes:
    // Notes.fromJson(json["notes"]);
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = _id;
    data['parcelId'] = _parcelId;
    data['note'] = _note;
    data['noteTitle'] = _noteTitle;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

// class Notes {
//   Notes({
//     this.id,
//     this.title,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int id;
//   String title;
//   int status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory Notes.fromJson(Map<String, dynamic> json) => Notes(
//         id: json["id"],
//         title: json["title"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
