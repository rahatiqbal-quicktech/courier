// ignore_for_file: unnecessary_this, file_names, unnecessary_getters_setters, prefer_collection_literals, unnecessary_new

class DeliverymanModel {
  dynamic _id;
  dynamic _area;
  dynamic _name;
  dynamic _email;
  dynamic _phone;
  dynamic _designation;
  dynamic _password;
  dynamic _passwordReset;
  dynamic _image;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  DeliverymanModel(
      {dynamic id,
      dynamic area,
      dynamic name,
      dynamic email,
      dynamic phone,
      dynamic designation,
      dynamic password,
      dynamic passwordReset,
      String image,
      dynamic status,
      dynamic createdAt,
      dynamic updatedAt}) {
    this._id = id;
    this._area = area;
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._designation = designation;
    this._password = password;
    this._passwordReset = passwordReset;
    this._image = image;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get area => _area;
  set area(dynamic area) => _area = area;
  dynamic get name => _name;
  set name(dynamic name) => _name = name;
  dynamic get email => _email;
  set email(dynamic email) => _email = email;
  dynamic get phone => _phone;
  set phone(dynamic phone) => _phone = phone;
  dynamic get designation => _designation;
  set designation(dynamic designation) => _designation = designation;
  dynamic get password => _password;
  set password(dynamic password) => _password = password;
  dynamic get passwordReset => _passwordReset;
  set passwordReset(dynamic passwordReset) => _passwordReset = passwordReset;
  dynamic get image => _image;
  set image(dynamic image) => _image = image;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  DeliverymanModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _area = json['area'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _designation = json['designation'];
    _password = json['password'];
    _passwordReset = json['passwordReset'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['area'] = this._area;
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['designation'] = this._designation;
    data['password'] = this._password;
    data['passwordReset'] = this._passwordReset;
    data['image'] = this._image;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
