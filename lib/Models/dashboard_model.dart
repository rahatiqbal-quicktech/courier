// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.mPending,
    this.mPick,
    this.mAwait,
    this.mDeliver,
    this.mPartialDeliver,
    this.mReturn,
    this.mDa,
    this.mHold,
    this.mWallet,
    this.tPending,
    this.tPick,
    this.tAwait,
    this.tDeliver,
    this.tPartialDeliver,
    this.tReturn,
    this.tDa,
    this.tHold,
    this.parcels,
    this.notice,
    this.merchant,
  });

  int mPending;
  int mPick;
  int mAwait;
  int mDeliver;
  int mPartialDeliver;
  int mReturn;
  int mDa;
  int mHold;
  dynamic mWallet;
  int tPending;
  int tPick;
  int tAwait;
  int tDeliver;
  int tPartialDeliver;
  int tReturn;
  int tDa;
  int tHold;
  List<Parcel> parcels;
  Notice notice;
  Merchant merchant;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        mPending: json["m_pending"],
        mPick: json["m_pick"],
        mAwait: json["m_await"],
        mDeliver: json["m_deliver"],
        mPartialDeliver: json["m_partial_deliver"],
        mReturn: json["m_return"],
        mDa: json["m_da"],
        mHold: json["m_hold"],
        mWallet: json["m_wallet"],
        tPending: json["t_pending"],
        tPick: json["t_pick"],
        tAwait: json["t_await"],
        tDeliver: json["t_deliver"],
        tPartialDeliver: json["t_partial_deliver"],
        tReturn: json["t_return"],
        tDa: json["t_da"],
        tHold: json["t_hold"],
        parcels:
            List<Parcel>.from(json["parcels"].map((x) => Parcel.fromJson(x))),
        notice: Notice.fromJson(json["notice"]),
        merchant: Merchant.fromJson(json["merchant"]),
      );

  Map<String, dynamic> toJson() => {
        "m_pending": mPending,
        "m_pick": mPick,
        "m_await": mAwait,
        "m_deliver": mDeliver,
        "m_partial_deliver": mPartialDeliver,
        "m_return": mReturn,
        "m_da": mDa,
        "m_hold": mHold,
        "m_wallet": mWallet,
        "t_pending": tPending,
        "t_pick": tPick,
        "t_await": tAwait,
        "t_deliver": tDeliver,
        "t_partial_deliver": tPartialDeliver,
        "t_return": tReturn,
        "t_da": tDa,
        "t_hold": tHold,
        "parcels": List<dynamic>.from(parcels.map((x) => x.toJson())),
        "notice": notice.toJson(),
        "merchant": merchant.toJson(),
      };
}

class Merchant {
  Merchant({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.companyName,
    this.pickLocation,
    this.phoneNumber,
    this.emailAddress,
    this.nearestZone,
    this.pickupPreference,
    this.socialLink,
    this.paymentMethod,
    this.paymentmode,
    this.withdrawal,
    this.nameOfBank,
    this.bankBranch,
    this.bankAcHolder,
    this.bankAcNo,
    this.bkashNumber,
    this.roketNumber,
    this.nogodNumber,
    this.balance,
    this.password,
    this.passwordReset,
    this.logo,
    this.agree,
    this.verifyToken,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  FirstName firstName;
  dynamic lastName;
  dynamic username;
  CompanyName companyName;
  dynamic pickLocation;
  String phoneNumber;
  EmailAddress emailAddress;
  dynamic nearestZone;
  dynamic pickupPreference;
  dynamic socialLink;
  int paymentMethod;
  dynamic paymentmode;
  int withdrawal;
  NameOfBank nameOfBank;
  BankBranch bankBranch;
  BankAcHolder bankAcHolder;
  String bankAcNo;
  dynamic bkashNumber;
  dynamic roketNumber;
  dynamic nogodNumber;
  int balance;
  String password;
  dynamic passwordReset;
  Logo logo;
  String agree;
  int verifyToken;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"],
        firstName: firstNameValues.map[json["firstName"]],
        lastName: json["lastName"],
        username: json["username"],
        companyName: companyNameValues.map[json["companyName"]],
        pickLocation: json["pickLocation"],
        phoneNumber: json["phoneNumber"],
        emailAddress: emailAddressValues.map[json["emailAddress"]],
        nearestZone: json["nearestZone"],
        pickupPreference: json["pickupPreference"],
        socialLink: json["socialLink"],
        paymentMethod: json["paymentMethod"],
        paymentmode: json["paymentmode"],
        withdrawal: json["withdrawal"],
        nameOfBank: nameOfBankValues.map[json["nameOfBank"]],
        bankBranch: bankBranchValues.map[json["bankBranch"]],
        bankAcHolder: bankAcHolderValues.map[json["bankAcHolder"]],
        bankAcNo: json["bankAcNo"],
        bkashNumber: json["bkashNumber"],
        roketNumber: json["roketNumber"],
        nogodNumber: json["nogodNumber"],
        balance: json["balance"],
        password: json["password"] == null ? null : json["password"],
        passwordReset: json["passwordReset"],
        logo: logoValues.map[json["logo"]],
        agree: json["agree"],
        verifyToken: json["verifyToken"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstNameValues.reverse[firstName],
        "lastName": lastName,
        "username": username,
        "companyName": companyNameValues.reverse[companyName],
        "pickLocation": pickLocation,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddressValues.reverse[emailAddress],
        "nearestZone": nearestZone,
        "pickupPreference": pickupPreference,
        "socialLink": socialLink,
        "paymentMethod": paymentMethod,
        "paymentmode": paymentmode,
        "withdrawal": withdrawal,
        "nameOfBank": nameOfBankValues.reverse[nameOfBank],
        "bankBranch": bankBranchValues.reverse[bankBranch],
        "bankAcHolder": bankAcHolderValues.reverse[bankAcHolder],
        "bankAcNo": bankAcNo,
        "bkashNumber": bkashNumber,
        "roketNumber": roketNumber,
        "nogodNumber": nogodNumber,
        "balance": balance,
        "password": password == null ? null : password,
        "passwordReset": passwordReset,
        "logo": logoValues.reverse[logo],
        "agree": agree,
        "verifyToken": verifyToken,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum BankAcHolder { SPENDBUY_MART }

final bankAcHolderValues =
    EnumValues({"Spendbuy Mart": BankAcHolder.SPENDBUY_MART});

enum BankBranch { NIGERIA }

final bankBranchValues = EnumValues({"Nigeria": BankBranch.NIGERIA});

enum CompanyName { ZICOMART }

final companyNameValues = EnumValues({"Zicomart": CompanyName.ZICOMART});

enum EmailAddress { CONTACT_ZICOMART_COM }

final emailAddressValues =
    EnumValues({"contact@zicomart.com": EmailAddress.CONTACT_ZICOMART_COM});

enum FirstName { ONYEKACHI_UMEJIAKU }

final firstNameValues =
    EnumValues({"Onyekachi Umejiaku": FirstName.ONYEKACHI_UMEJIAKU});

enum Logo { UPLOADS_MERCHANT_ZICOFAV_PNG }

final logoValues = EnumValues(
    {"uploads/merchant/zicofav.png": Logo.UPLOADS_MERCHANT_ZICOFAV_PNG});

enum NameOfBank { FIDELITY_BANK }

final nameOfBankValues =
    EnumValues({"Fidelity Bank": NameOfBank.FIDELITY_BANK});

class Notice {
  Notice({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Parcel {
  Parcel({
    this.id,
    this.invoiceNo,
    this.merchantId,
    this.paymentInvoice,
    this.cod,
    this.merchantAmount,
    this.merchantDue,
    this.merchantpayStatus,
    this.merchantPaid,
    this.recipientName,
    this.recipientAddress,
    this.recipientPhone,
    this.note,
    this.deliveryCharge,
    this.codCharge,
    this.productPrice,
    this.deliverymanId,
    this.deliverymanAmount,
    this.dPayinvoice,
    this.deliverymanPaystatus,
    this.pickupmanId,
    this.agentId,
    this.agentAmount,
    this.aPayinvoice,
    this.agentPaystatus,
    this.productName,
    this.productColor,
    this.productQty,
    this.productWeight,
    this.trackingCode,
    this.percelType,
    this.helpNumber,
    this.reciveZone,
    this.orderType,
    this.codType,
    this.paymentOption,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.merchant,
    this.parcelnote,
  });

  int id;
  dynamic invoiceNo;
  int merchantId;
  dynamic paymentInvoice;
  int cod;
  int merchantAmount;
  int merchantDue;
  String merchantpayStatus;
  int merchantPaid;
  String recipientName;
  String recipientAddress;
  String recipientPhone;
  String note;
  int deliveryCharge;
  int codCharge;
  dynamic productPrice;
  int deliverymanId;
  int deliverymanAmount;
  dynamic dPayinvoice;
  dynamic deliverymanPaystatus;
  dynamic pickupmanId;
  int agentId;
  int agentAmount;
  dynamic aPayinvoice;
  dynamic agentPaystatus;
  String productName;
  String productColor;
  int productQty;
  int productWeight;
  String trackingCode;
  int percelType;
  dynamic helpNumber;
  String reciveZone;
  int orderType;
  int codType;
  int paymentOption;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  Merchant merchant;
  Parcelnote parcelnote;

  factory Parcel.fromJson(Map<String, dynamic> json) => Parcel(
        id: json["id"],
        invoiceNo: json["invoiceNo"],
        merchantId: json["merchantId"],
        paymentInvoice: json["paymentInvoice"],
        cod: json["cod"],
        merchantAmount: json["merchantAmount"],
        merchantDue: json["merchantDue"],
        merchantpayStatus: json["merchantpayStatus"] == null
            ? null
            : json["merchantpayStatus"],
        merchantPaid: json["merchantPaid"],
        recipientName: json["recipientName"],
        recipientAddress: json["recipientAddress"],
        recipientPhone: json["recipientPhone"],
        note: json["note"],
        deliveryCharge: json["deliveryCharge"],
        codCharge: json["codCharge"],
        productPrice: json["productPrice"],
        deliverymanId:
            json["deliverymanId"] == null ? null : json["deliverymanId"],
        deliverymanAmount: json["deliverymanAmount"] == null
            ? null
            : json["deliverymanAmount"],
        dPayinvoice: json["dPayinvoice"],
        deliverymanPaystatus: json["deliverymanPaystatus"],
        pickupmanId: json["pickupmanId"],
        agentId: json["agentId"] == null ? null : json["agentId"],
        agentAmount: json["agentAmount"] == null ? null : json["agentAmount"],
        aPayinvoice: json["aPayinvoice"],
        agentPaystatus: json["agentPaystatus"],
        productName: json["productName"],
        productColor: json["productColor"],
        productQty: json["productQty"],
        productWeight: json["productWeight"],
        trackingCode: json["trackingCode"],
        percelType: json["percelType"],
        helpNumber: json["helpNumber"],
        reciveZone: json["reciveZone"],
        orderType: json["orderType"],
        codType: json["codType"],
        paymentOption: json["payment_option"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        merchant: Merchant.fromJson(json["merchant"]),
        parcelnote: Parcelnote.fromJson(json["parcelnote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoiceNo": invoiceNo,
        "merchantId": merchantId,
        "paymentInvoice": paymentInvoice,
        "cod": cod,
        "merchantAmount": merchantAmount,
        "merchantDue": merchantDue,
        "merchantpayStatus":
            merchantpayStatus == null ? null : merchantpayStatus,
        "merchantPaid": merchantPaid,
        "recipientName": recipientName,
        "recipientAddress": recipientAddress,
        "recipientPhone": recipientPhone,
        "note": note,
        "deliveryCharge": deliveryCharge,
        "codCharge": codCharge,
        "productPrice": productPrice,
        "deliverymanId": deliverymanId == null ? null : deliverymanId,
        "deliverymanAmount":
            deliverymanAmount == null ? null : deliverymanAmount,
        "dPayinvoice": dPayinvoice,
        "deliverymanPaystatus": deliverymanPaystatus,
        "pickupmanId": pickupmanId,
        "agentId": agentId == null ? null : agentId,
        "agentAmount": agentAmount == null ? null : agentAmount,
        "aPayinvoice": aPayinvoice,
        "agentPaystatus": agentPaystatus,
        "productName": productName,
        "productColor": productColor,
        "productQty": productQty,
        "productWeight": productWeight,
        "trackingCode": trackingCode,
        "percelType": percelType,
        "helpNumber": helpNumber,
        "reciveZone": reciveZone,
        "orderType": orderType,
        "codType": codType,
        "payment_option": paymentOption,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "merchant": merchant.toJson(),
        "parcelnote": parcelnote.toJson(),
      };
}

class Parcelnote {
  Parcelnote({
    this.id,
    this.parcelId,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int parcelId;
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  factory Parcelnote.fromJson(Map<String, dynamic> json) => Parcelnote(
      // id: json["id"] ?? 0,
      // parcelId: json["parcelId"] ?? 0,
      // note: json["note"] ?? "",
      // createdAt: DateTime.parse(json["created_at"]) ?? DateTime.now(),
      // updatedAt: DateTime.parse(json["updated_at"]) ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parcelId": parcelId,
        "note": note,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

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
