// ignore_for_file: file_names, unnecessary_getters_setters

class PickupModel {
  dynamic _id;
  dynamic _pickuptype;
  dynamic _date;
  dynamic _pickupAddress;
  dynamic _merchantId;
  dynamic _note;
  dynamic _estimedparcel;
  dynamic _area;
  dynamic _agent;
  dynamic _deliveryman;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  PickupModel(
      {dynamic id,
      dynamic pickuptype,
      dynamic date,
      dynamic pickupAddress,
      dynamic merchantId,
      dynamic note,
      dynamic estimedparcel,
      dynamic area,
      dynamic agent,
      dynamic deliveryman,
      dynamic status,
      dynamic createdAt,
      dynamic updatedAt}) {
    _id = id;
    _pickuptype = pickuptype;
    _date = date;
    _pickupAddress = pickupAddress;
    _merchantId = merchantId;
    _note = note;
    _estimedparcel = estimedparcel;
    _area = area;
    _agent = agent;
    _deliveryman = deliveryman;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get pickuptype => _pickuptype;
  set pickuptype(dynamic pickuptype) => _pickuptype = pickuptype;
  dynamic get date => _date;
  set date(dynamic date) => _date = date;
  dynamic get pickupAddress => _pickupAddress;
  set pickupAddress(dynamic pickupAddress) => _pickupAddress = pickupAddress;
  dynamic get merchantId => _merchantId;
  set merchantId(dynamic merchantId) => _merchantId = merchantId;
  dynamic get note => _note;
  set note(dynamic note) => _note = note;
  dynamic get estimedparcel => _estimedparcel;
  set estimedparcel(dynamic estimedparcel) => _estimedparcel = estimedparcel;
  dynamic get area => _area;
  set area(dynamic area) => _area = area;
  dynamic get agent => _agent;
  set agent(dynamic agent) => _agent = agent;
  dynamic get deliveryman => _deliveryman;
  set deliveryman(dynamic deliveryman) => _deliveryman = deliveryman;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  PickupModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _pickuptype = json['pickuptype'];
    _date = json['date'];
    _pickupAddress = json['pickupAddress'];
    _merchantId = json['merchantId'];
    _note = json['note'];
    _estimedparcel = json['estimedparcel'];
    _area = json['area'];
    _agent = json['agent'];
    _deliveryman = json['deliveryman'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['pickuptype'] = _pickuptype;
    data['date'] = _date;
    data['pickupAddress'] = _pickupAddress;
    data['merchantId'] = _merchantId;
    data['note'] = _note;
    data['estimedparcel'] = _estimedparcel;
    data['area'] = _area;
    data['agent'] = _agent;
    data['deliveryman'] = _deliveryman;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
