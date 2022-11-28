// ignore_for_file: file_names, unnecessary_getters_setters

class ParcelTypeModel {
  int _id;
  String _title;
  String _slug;
  String _createdAt;
  String _updatedAt;

  ParcelTypeModel(
      {int id, String title, String slug, String createdAt, String updatedAt}) {
    _id = id;
    _title = title;
    _slug = slug;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get slug => _slug;
  set slug(String slug) => _slug = slug;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  ParcelTypeModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['slug'] = _slug;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
