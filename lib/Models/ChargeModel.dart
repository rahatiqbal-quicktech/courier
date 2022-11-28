// ignore_for_file: file_names

class ChargeModel {
  dynamic id;
  dynamic merchantId;
  dynamic packageId;
  dynamic delivery;
  dynamic extradelivery;
  dynamic cod;
  dynamic codpercent;
  dynamic createdAt;
  dynamic updatedAt;

  ChargeModel(
      {this.id,
      this.merchantId,
      this.packageId,
      this.delivery,
      this.extradelivery,
      this.cod,
      this.codpercent,
      this.createdAt,
      this.updatedAt});

  ChargeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantId = json['merchantId'];
    packageId = json['packageId'];
    delivery = json['delivery'];
    extradelivery = json['extradelivery'];
    cod = json['cod'];
    codpercent = json['codpercent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['merchantId'] = merchantId;
    data['packageId'] = packageId;
    data['delivery'] = delivery;
    data['extradelivery'] = extradelivery;
    data['cod'] = cod;
    data['codpercent'] = codpercent;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
