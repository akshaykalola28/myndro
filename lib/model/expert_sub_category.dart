class ExpertSubCatModel {
  String? code;
  String? msg;
  String? type;
  Data? data;

  ExpertSubCatModel({this.code, this.msg, this.type, this.data});

  ExpertSubCatModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Doctorsubcategory>? doctorsubcategory;

  Data({this.doctorsubcategory});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['doctorsubcategory'] != null) {
      doctorsubcategory = <Doctorsubcategory>[];
      json['doctorsubcategory'].forEach((v) {
        doctorsubcategory!.add(Doctorsubcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorsubcategory != null) {
      data['doctorsubcategory'] =
          doctorsubcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctorsubcategory {
  String? doctorSubcategoryId;
  String? doctorCategoryId;
  String? doctorSubcategoryName;
  String? doctorSubcategoryNote;
  String? dateCreated;
  String? dateModified;
  String? ipAddress;
  String? doctorCategoryName;
  String? adminCommisionPer;
  String? doctorCategoryNote;

  Doctorsubcategory(
      {this.doctorSubcategoryId,
      this.doctorCategoryId,
      this.doctorSubcategoryName,
      this.doctorSubcategoryNote,
      this.dateCreated,
      this.dateModified,
      this.ipAddress,
      this.doctorCategoryName,
      this.adminCommisionPer,
      this.doctorCategoryNote});

  Doctorsubcategory.fromJson(Map<String, dynamic> json) {
    doctorSubcategoryId = json['doctor_subcategory_id'];
    doctorCategoryId = json['doctor_category_id'];
    doctorSubcategoryName = json['doctor_subcategory_name'];
    doctorSubcategoryNote = json['doctor_subcategory_note'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    ipAddress = json['ip_address'];
    doctorCategoryName = json['doctor_category_name'];
    adminCommisionPer = json['admin_commision_per'];
    doctorCategoryNote = json['doctor_category_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_subcategory_id'] = doctorSubcategoryId;
    data['doctor_category_id'] = doctorCategoryId;
    data['doctor_subcategory_name'] = doctorSubcategoryName;
    data['doctor_subcategory_note'] = doctorSubcategoryNote;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['ip_address'] = ipAddress;
    data['doctor_category_name'] = doctorCategoryName;
    data['admin_commision_per'] = adminCommisionPer;
    data['doctor_category_note'] = doctorCategoryNote;
    return data;
  }
}
