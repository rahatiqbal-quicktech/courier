// ignore_for_file: file_names, unnecessary_getters_setters, unnecessary_this

class CodChargeModel {
  dynamic _id;
  dynamic _codcharge;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  CodChargeModel(
      {dynamic id,
      dynamic codcharge,
      dynamic status,
      dynamic createdAt,
      dynamic updatedAt}) {
    _id = id;
    _codcharge = codcharge;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get codcharge => _codcharge;
  set codcharge(dynamic codcharge) => _codcharge = codcharge;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  CodChargeModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _codcharge = json['codcharge'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this._id;
    data['codcharge'] = this._codcharge;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
