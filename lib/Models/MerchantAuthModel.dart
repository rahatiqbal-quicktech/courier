// ignore_for_file: file_names, unnecessary_this, unnecessary_getters_setters

import 'package:courier/Models/MerchantModel.dart';

class MerchantAuthModel {
  bool _success;
  dynamic _message;
  MerchantModel _data;

  MerchantAuthModel({bool success, dynamic message, MerchantModel data}) {
    this._success = success;
    this._message = message;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  dynamic get message => _message;
  set message(dynamic message) => _message = message;
  MerchantModel get data => _data;
  set data(MerchantModel data) => _data = data;

  MerchantAuthModel.fromJson(Map<dynamic, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? MerchantModel.fromJson(json['data']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['success'] = this._success;
    data['message'] = this._message;
    data['data'] = this._data.toJson();
    return data;
  }
}
