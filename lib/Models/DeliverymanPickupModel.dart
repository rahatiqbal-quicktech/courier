// ignore_for_file: file_names, unnecessary_this, unnecessary_getters_setters

class DeliverymanPickupModel {
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
  dynamic _firstName;
  dynamic _lastName;
  dynamic _phoneNumber;
  dynamic _emailAddress;
  dynamic _companyName;
  dynamic _mstatus;
  dynamic _mid;

  DeliverymanPickupModel(
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
      dynamic updatedAt,
      dynamic firstName,
      dynamic lastName,
      dynamic phoneNumber,
      dynamic emailAddress,
      dynamic companyName,
      dynamic mstatus,
      dynamic mid}) {
    this._id = id;
    this._pickuptype = pickuptype;
    this._date = date;
    this._pickupAddress = pickupAddress;
    this._merchantId = merchantId;
    this._note = note;
    this._estimedparcel = estimedparcel;
    this._area = area;
    this._agent = agent;
    this._deliveryman = deliveryman;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._firstName = firstName;
    this._lastName = lastName;
    this._phoneNumber = phoneNumber;
    this._emailAddress = emailAddress;
    this._companyName = companyName;
    this._mstatus = mstatus;
    this._mid = mid;
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
  dynamic get firstName => _firstName;
  set firstName(dynamic firstName) => _firstName = firstName;
  dynamic get lastName => _lastName;
  set lastName(dynamic lastName) => _lastName = lastName;
  dynamic get phoneNumber => _phoneNumber;
  set phoneNumber(dynamic phoneNumber) => _phoneNumber = phoneNumber;
  dynamic get emailAddress => _emailAddress;
  set emailAddress(dynamic emailAddress) => _emailAddress = emailAddress;
  dynamic get companyName => _companyName;
  set companyName(dynamic companyName) => _companyName = companyName;
  dynamic get mstatus => _mstatus;
  set mstatus(dynamic mstatus) => _mstatus = mstatus;
  dynamic get mid => _mid;
  set mid(dynamic mid) => _mid = mid;

  DeliverymanPickupModel.fromJson(Map<dynamic, dynamic> json) {
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
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _phoneNumber = json['phoneNumber'];
    _emailAddress = json['emailAddress'];
    _companyName = json['companyName'];
    _mstatus = json['mstatus'];
    _mid = json['mid'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = this._id;
    data['pickuptype'] = this._pickuptype;
    data['date'] = this._date;
    data['pickupAddress'] = this._pickupAddress;
    data['merchantId'] = this._merchantId;
    data['note'] = this._note;
    data['estimedparcel'] = this._estimedparcel;
    data['area'] = this._area;
    data['agent'] = this._agent;
    data['deliveryman'] = this._deliveryman;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['phoneNumber'] = this._phoneNumber;
    data['emailAddress'] = this._emailAddress;
    data['companyName'] = this._companyName;
    data['mstatus'] = this._mstatus;
    data['mid'] = this._mid;
    return data;
  }
}
