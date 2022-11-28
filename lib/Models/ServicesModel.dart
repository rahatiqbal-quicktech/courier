// ignore_for_file: file_names

class ServicesModel {
  int id;
  String title;
  String slug;
  String subtitle;
  String time;
  int deliverycharge;
  int extradeliverycharge;
  int cod;
  String description;
  int status;
  String createdAt;
  String updatedAt;

  ServicesModel(
      {this.id,
      this.title,
      this.slug,
      this.subtitle,
      this.time,
      this.deliverycharge,
      this.extradeliverycharge,
      this.cod,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    time = json['time'];
    deliverycharge = json['deliverycharge'];
    extradeliverycharge = json['extradeliverycharge'];
    cod = json['cod'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['subtitle'] = subtitle;
    data['time'] = time;
    data['deliverycharge'] = deliverycharge;
    data['extradeliverycharge'] = extradeliverycharge;
    data['cod'] = cod;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
