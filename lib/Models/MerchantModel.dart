// ignore_for_file: file_names, unnecessary_getters_setters

class MerchantModel {
  dynamic _id;
  dynamic _firstName;
  dynamic _lastName;
  dynamic _username;
  dynamic _companyName;
  dynamic _pickLocation;
  dynamic _phoneNumber;
  dynamic _emailAddress;
  dynamic _nearestZone;
  dynamic _pickupPreference;
  dynamic _socialLink;
  dynamic _paymentMethod;
  dynamic _paymentmode;
  dynamic _withdrawal;
  dynamic _nameOfBank;
  dynamic _bankBranch;
  dynamic _bankAcHolder;
  dynamic _bankAcNo;
  dynamic _bkashNumber;
  dynamic _roketNumber;
  dynamic _nogodNumber;
  dynamic _balance;
  dynamic _password;
  dynamic _passwordReset;
  dynamic _logo;
  dynamic _agree;
  dynamic _verify;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  MerchantModel(
      {dynamic id,
      dynamic firstName,
      dynamic lastName,
      dynamic username,
      dynamic companyName,
      dynamic pickLocation,
      dynamic phoneNumber,
      dynamic emailAddress,
      dynamic nearestZone,
      dynamic pickupPreference,
      dynamic socialLink,
      dynamic paymentMethod,
      dynamic paymentmode,
      dynamic withdrawal,
      dynamic nameOfBank,
      dynamic bankBranch,
      dynamic bankAcHolder,
      dynamic bankAcNo,
      dynamic bkashNumber,
      dynamic roketNumber,
      dynamic nogodNumber,
      dynamic balance,
      dynamic password,
      dynamic passwordReset,
      dynamic logo,
      dynamic agree,
      dynamic verify,
      dynamic status,
      dynamic createdAt,
      dynamic updatedAt}) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _companyName = companyName;
    _pickLocation = pickLocation;
    _phoneNumber = phoneNumber;
    _emailAddress = emailAddress;
    _nearestZone = nearestZone;
    _pickupPreference = pickupPreference;
    _socialLink = socialLink;
    _paymentMethod = paymentMethod;
    _paymentmode = paymentmode;
    _withdrawal = withdrawal;
    _nameOfBank = nameOfBank;
    _bankBranch = bankBranch;
    _bankAcHolder = bankAcHolder;
    _bankAcNo = bankAcNo;
    _bkashNumber = bkashNumber;
    _roketNumber = roketNumber;
    _nogodNumber = nogodNumber;
    _balance = balance;
    _password = password;
    _passwordReset = passwordReset;
    _logo = logo;
    _agree = agree;
    _verify = verify;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get firstName => _firstName;
  set firstName(dynamic firstName) => _firstName = firstName;
  dynamic get lastName => _lastName;
  set lastName(dynamic lastName) => _lastName = lastName;
  dynamic get username => _username;
  set username(dynamic username) => _username = username;
  dynamic get companyName => _companyName;
  set companyName(dynamic companyName) => _companyName = companyName;
  dynamic get pickLocation => _pickLocation;
  set pickLocation(dynamic pickLocation) => _pickLocation = pickLocation;
  dynamic get phoneNumber => _phoneNumber;
  set phoneNumber(dynamic phoneNumber) => _phoneNumber = phoneNumber;
  dynamic get emailAddress => _emailAddress;
  set emailAddress(dynamic emailAddress) => _emailAddress = emailAddress;
  dynamic get nearestZone => _nearestZone;
  set nearestZone(dynamic nearestZone) => _nearestZone = nearestZone;
  dynamic get pickupPreference => _pickupPreference;
  set pickupPreference(dynamic pickupPreference) =>
      _pickupPreference = pickupPreference;
  dynamic get socialLink => _socialLink;
  set socialLink(dynamic socialLink) => _socialLink = socialLink;
  dynamic get paymentMethod => _paymentMethod;
  set paymentMethod(dynamic paymentMethod) => _paymentMethod = paymentMethod;
  dynamic get paymentmode => _paymentmode;
  set paymentmode(dynamic paymentmode) => _paymentmode = paymentmode;
  dynamic get withdrawal => _withdrawal;
  set withdrawal(dynamic withdrawal) => _withdrawal = withdrawal;
  dynamic get nameOfBank => _nameOfBank;
  set nameOfBank(dynamic nameOfBank) => _nameOfBank = nameOfBank;
  dynamic get bankBranch => _bankBranch;
  set bankBranch(dynamic bankBranch) => _bankBranch = bankBranch;
  dynamic get bankAcHolder => _bankAcHolder;
  set bankAcHolder(dynamic bankAcHolder) => _bankAcHolder = bankAcHolder;
  dynamic get bankAcNo => _bankAcNo;
  set bankAcNo(dynamic bankAcNo) => _bankAcNo = bankAcNo;
  dynamic get bkashNumber => _bkashNumber;
  set bkashNumber(dynamic bkashNumber) => _bkashNumber = bkashNumber;
  dynamic get roketNumber => _roketNumber;
  set roketNumber(dynamic roketNumber) => _roketNumber = roketNumber;
  dynamic get nogodNumber => _nogodNumber;
  set nogodNumber(dynamic nogodNumber) => _nogodNumber = nogodNumber;
  dynamic get balance => _balance;
  set balance(dynamic balance) => _balance = balance;
  dynamic get password => _password;
  set password(dynamic password) => _password = password;
  dynamic get passwordReset => _passwordReset;
  set passwordReset(dynamic passwordReset) => _passwordReset = passwordReset;
  dynamic get logo => _logo;
  set logo(dynamic logo) => _logo = logo;
  dynamic get agree => _agree;
  set agree(dynamic agree) => _agree = agree;
  dynamic get verify => _verify;
  set verify(dynamic verify) => _verify = verify;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  MerchantModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _username = json['username'];
    _companyName = json['companyName'];
    _pickLocation = json['pickLocation'];
    _phoneNumber = json['phoneNumber'];
    _emailAddress = json['emailAddress'];
    _nearestZone = json['nearestZone'];
    _pickupPreference = json['pickupPreference'];
    _socialLink = json['socialLink'];
    _paymentMethod = json['paymentMethod'];
    _paymentmode = json['paymentmode'];
    _withdrawal = json['withdrawal'];
    _nameOfBank = json['nameOfBank'];
    _bankBranch = json['bankBranch'];
    _bankAcHolder = json['bankAcHolder'];
    _bankAcNo = json['bankAcNo'];
    _bkashNumber = json['bkashNumber'];
    _roketNumber = json['roketNumber'];
    _nogodNumber = json['nogodNumber'];
    _balance = json['balance'];
    _password = json['password'];
    _passwordReset = json['passwordReset'];
    _logo = json['logo'];
    _agree = json['agree'];
    _verify = json['verify'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['firstName'] = _firstName;
    data['lastName'] = _lastName;
    data['username'] = _username;
    data['companyName'] = _companyName;
    data['pickLocation'] = _pickLocation;
    data['phoneNumber'] = _phoneNumber;
    data['emailAddress'] = _emailAddress;
    data['nearestZone'] = _nearestZone;
    data['pickupPreference'] = _pickupPreference;
    data['socialLink'] = _socialLink;
    data['paymentMethod'] = _paymentMethod;
    data['paymentmode'] = _paymentmode;
    data['withdrawal'] = _withdrawal;
    data['nameOfBank'] = _nameOfBank;
    data['bankBranch'] = _bankBranch;
    data['bankAcHolder'] = _bankAcHolder;
    data['bankAcNo'] = _bankAcNo;
    data['bkashNumber'] = _bkashNumber;
    data['roketNumber'] = _roketNumber;
    data['nogodNumber'] = _nogodNumber;
    data['balance'] = _balance;
    data['password'] = _password;
    data['passwordReset'] = _passwordReset;
    data['logo'] = _logo;
    data['agree'] = _agree;
    data['verify'] = _verify;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
