class ExpertCategoryModel {
  String? code;
  String? msg;
  String? type;
  String? url;
  Data? data;

  ExpertCategoryModel({this.code, this.msg, this.type, this.url, this.data});

  ExpertCategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    url = json['url'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['type'] = type;
    data['url'] = url;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Doctorcategory>? doctorcategory;

  Data({this.doctorcategory});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['doctorcategory'] != null) {
      doctorcategory = <Doctorcategory>[];
      json['doctorcategory'].forEach((v) {
        doctorcategory!.add(Doctorcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorcategory != null) {
      data['doctorcategory'] = doctorcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctorcategory {
  String? doctorCategoryId;
  String? doctorCategoryName;
  String? adminCommisionPer;
  String? doctorCategoryNote;
  String? dateCreated;
  String? dateModified;
  String? ipAddress;

  Doctorcategory(
      {this.doctorCategoryId,
      this.doctorCategoryName,
      this.adminCommisionPer,
      this.doctorCategoryNote,
      this.dateCreated,
      this.dateModified,
      this.ipAddress});

  Doctorcategory.fromJson(Map<String, dynamic> json) {
    doctorCategoryId = json['doctor_category_id'];
    doctorCategoryName = json['doctor_category_name'];
    adminCommisionPer = json['admin_commision_per'];
    doctorCategoryNote = json['doctor_category_note'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    ipAddress = json['ip_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_category_id'] = doctorCategoryId;
    data['doctor_category_name'] = doctorCategoryName;
    data['admin_commision_per'] = adminCommisionPer;
    data['doctor_category_note'] = doctorCategoryNote;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['ip_address'] = ipAddress;
    return data;
  }
}
