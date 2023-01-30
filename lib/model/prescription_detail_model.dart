class PrescDetailModel {
  String? code;
  String? msg;
  String? type;
  PrescDetail? data;

  PrescDetailModel({this.code, this.msg, this.type, this.data});

  PrescDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data = json['data'] != null ? PrescDetail.fromJson(json['data']) : null;
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

class PrescDetail {
  List<PreDetailsData>? preDetails;

  PrescDetail({this.preDetails});

  PrescDetail.fromJson(Map<String, dynamic> json) {
    if (json['pre_details'] != null) {
      preDetails = <PreDetailsData>[];
      json['pre_details'].forEach((v) {
        preDetails!.add(PreDetailsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (preDetails != null) {
      data['pre_details'] = preDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreDetailsData {
  String? prescriptionDetailsId;
  String? prescriptionId;
  String? medicineName;
  String? insName;
  String? frequency;
  String? attachment;
  String? dateCreated;
  String? createdBy;
  String? dateModified;

  PreDetailsData(
      {this.prescriptionDetailsId,
      this.prescriptionId,
      this.medicineName,
      this.insName,
      this.frequency,
      this.attachment,
      this.dateCreated,
      this.createdBy,
      this.dateModified});

  PreDetailsData.fromJson(Map<String, dynamic> json) {
    prescriptionDetailsId = json['prescription_details_id'];
    prescriptionId = json['prescription_id'];
    medicineName = json['medicine_name'];
    insName = json['ins_name'];
    frequency = json['frequency'];
    attachment = json['attachment'];
    dateCreated = json['date_created'];
    createdBy = json['CreatedBy'];
    dateModified = json['date_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prescription_details_id'] = prescriptionDetailsId;
    data['prescription_id'] = prescriptionId;
    data['medicine_name'] = medicineName;
    data['ins_name'] = insName;
    data['frequency'] = frequency;
    data['attachment'] = attachment;
    data['date_created'] = dateCreated;
    data['CreatedBy'] = createdBy;
    data['date_modified'] = dateModified;
    return data;
  }
}
