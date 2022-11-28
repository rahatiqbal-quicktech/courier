// ignore_for_file: file_names, unnecessary_getters_setters

class ParcelModel {
  dynamic _id;
  dynamic _invoiceNo;
  dynamic _merchantId;
  dynamic _paymentInvoice;
  dynamic _cod;
  dynamic _merchantAmount;
  dynamic _merchantDue;
  dynamic _merchantpayStatus;
  dynamic _merchantPaid;
  dynamic _recipientName;
  dynamic _recipientAddress;
  dynamic _recipientPhone;
  dynamic _note;
  dynamic _deliveryCharge;
  dynamic _codCharge;
  dynamic _productPrice;
  dynamic _deliverymanId;
  dynamic _agentId;
  dynamic _productWeight;
  dynamic _trackingCode;
  dynamic _percelType;
  dynamic _helpNumber;
  dynamic _reciveZone;
  dynamic _orderType;
  dynamic _codType;
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

  ParcelModel(
      {dynamic id,
      dynamic invoiceNo,
      dynamic merchantId,
      dynamic paymentInvoice,
      dynamic cod,
      dynamic merchantAmount,
      dynamic merchantDue,
      dynamic merchantpayStatus,
      dynamic merchantPaid,
      dynamic recipientName,
      dynamic recipientAddress,
      dynamic recipientPhone,
      dynamic note,
      dynamic deliveryCharge,
      dynamic codCharge,
      dynamic productPrice,
      dynamic deliverymanId,
      dynamic agentId,
      dynamic productWeight,
      dynamic trackingCode,
      dynamic percelType,
      dynamic helpNumber,
      dynamic reciveZone,
      dynamic orderType,
      dynamic codType,
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
    _id = id;
    _invoiceNo = invoiceNo;
    _merchantId = merchantId;
    _paymentInvoice = paymentInvoice;
    _cod = cod;
    _merchantAmount = merchantAmount;
    _merchantDue = merchantDue;
    _merchantpayStatus = merchantpayStatus;
    _merchantPaid = merchantPaid;
    _recipientName = recipientName;
    _recipientAddress = recipientAddress;
    _recipientPhone = recipientPhone;
    _note = note;
    _deliveryCharge = deliveryCharge;
    _codCharge = codCharge;
    _productPrice = productPrice;
    _deliverymanId = deliverymanId;
    _agentId = agentId;
    _productWeight = productWeight;
    _trackingCode = trackingCode;
    _percelType = percelType;
    _helpNumber = helpNumber;
    _reciveZone = reciveZone;
    _orderType = orderType;
    _codType = codType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _emailAddress = emailAddress;
    _companyName = companyName;
    _mstatus = mstatus;
    _mid = mid;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get invoiceNo => _invoiceNo;
  set invoiceNo(dynamic invoiceNo) => _invoiceNo = invoiceNo;
  dynamic get merchantId => _merchantId;
  set merchantId(dynamic merchantId) => _merchantId = merchantId;
  dynamic get paymentInvoice => _paymentInvoice;
  set paymentInvoice(dynamic paymentInvoice) =>
      _paymentInvoice = paymentInvoice;
  dynamic get cod => _cod;
  set cod(dynamic cod) => _cod = cod;
  dynamic get merchantAmount => _merchantAmount;
  set merchantAmount(dynamic merchantAmount) =>
      _merchantAmount = merchantAmount;
  dynamic get merchantDue => _merchantDue;
  set merchantDue(dynamic merchantDue) => _merchantDue = merchantDue;
  dynamic get merchantpayStatus => _merchantpayStatus;
  set merchantpayStatus(dynamic merchantpayStatus) =>
      _merchantpayStatus = merchantpayStatus;
  dynamic get merchantPaid => _merchantPaid;
  set merchantPaid(dynamic merchantPaid) => _merchantPaid = merchantPaid;
  dynamic get recipientName => _recipientName;
  set recipientName(dynamic recipientName) => _recipientName = recipientName;
  dynamic get recipientAddress => _recipientAddress;
  set recipientAddress(dynamic recipientAddress) =>
      _recipientAddress = recipientAddress;
  dynamic get recipientPhone => _recipientPhone;
  set recipientPhone(dynamic recipientPhone) =>
      _recipientPhone = recipientPhone;
  dynamic get note => _note;
  set note(dynamic note) => _note = note;
  dynamic get deliveryCharge => _deliveryCharge;
  set deliveryCharge(dynamic deliveryCharge) =>
      _deliveryCharge = deliveryCharge;
  dynamic get codCharge => _codCharge;
  set codCharge(dynamic codCharge) => _codCharge = codCharge;
  dynamic get productPrice => _productPrice;
  set productPrice(dynamic productPrice) => _productPrice = productPrice;
  dynamic get deliverymanId => _deliverymanId;
  set deliverymanId(dynamic deliverymanId) => _deliverymanId = deliverymanId;
  dynamic get agentId => _agentId;
  set agentId(dynamic agentId) => _agentId = agentId;
  dynamic get productWeight => _productWeight;
  set productWeight(dynamic productWeight) => _productWeight = productWeight;
  dynamic get trackingCode => _trackingCode;
  set trackingCode(dynamic trackingCode) => _trackingCode = trackingCode;
  dynamic get percelType => _percelType;
  set percelType(dynamic percelType) => _percelType = percelType;
  dynamic get helpNumber => _helpNumber;
  set helpNumber(dynamic helpNumber) => _helpNumber = helpNumber;
  dynamic get reciveZone => _reciveZone;
  set reciveZone(dynamic reciveZone) => _reciveZone = reciveZone;
  dynamic get orderType => _orderType;
  set orderType(dynamic orderType) => _orderType = orderType;
  dynamic get codType => _codType;
  set codType(dynamic codType) => _codType = codType;
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

  ParcelModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _invoiceNo = json['invoiceNo'];
    _merchantId = json['merchantId'];
    _paymentInvoice = json['paymentInvoice'];
    _cod = json['cod'];
    _merchantAmount = json['merchantAmount'];
    _merchantDue = json['merchantDue'];
    _merchantpayStatus = json['merchantpayStatus'];
    _merchantPaid = json['merchantPaid'];
    _recipientName = json['recipientName'];
    _recipientAddress = json['recipientAddress'];
    _recipientPhone = json['recipientPhone'];
    _note = json['note'];
    _deliveryCharge = json['deliveryCharge'];
    _codCharge = json['codCharge'];
    _productPrice = json['productPrice'];
    _deliverymanId = json['deliverymanId'];
    _agentId = json['agentId'];
    _productWeight = json['productWeight'];
    _trackingCode = json['trackingCode'];
    _percelType = json['percelType'];
    _helpNumber = json['helpNumber'];
    _reciveZone = json['reciveZone'];
    _orderType = json['orderType'];
    _codType = json['codType'];
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
    final Map<dynamic, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['invoiceNo'] = _invoiceNo;
    data['merchantId'] = _merchantId;
    data['paymentInvoice'] = _paymentInvoice;
    data['cod'] = _cod;
    data['merchantAmount'] = _merchantAmount;
    data['merchantDue'] = _merchantDue;
    data['merchantpayStatus'] = _merchantpayStatus;
    data['merchantPaid'] = _merchantPaid;
    data['recipientName'] = _recipientName;
    data['recipientAddress'] = _recipientAddress;
    data['recipientPhone'] = _recipientPhone;
    data['note'] = _note;
    data['deliveryCharge'] = _deliveryCharge;
    data['codCharge'] = _codCharge;
    data['productPrice'] = _productPrice;
    data['deliverymanId'] = _deliverymanId;
    data['agentId'] = _agentId;
    data['productWeight'] = _productWeight;
    data['trackingCode'] = _trackingCode;
    data['percelType'] = _percelType;
    data['helpNumber'] = _helpNumber;
    data['reciveZone'] = _reciveZone;
    data['orderType'] = _orderType;
    data['codType'] = _codType;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['firstName'] = _firstName;
    data['lastName'] = _lastName;
    data['phoneNumber'] = _phoneNumber;
    data['emailAddress'] = _emailAddress;
    data['companyName'] = _companyName;
    data['mstatus'] = _mstatus;
    data['mid'] = _mid;
    return data;
  }
}
