// To parse this JSON data, do
//
//     final expertPrescList = expertPrescListFromJson(jsonString);

import 'dart:convert';

ExpertPrescList expertPrescListFromJson(String str) =>
    ExpertPrescList.fromJson(json.decode(str));

String expertPrescListToJson(ExpertPrescList data) =>
    json.encode(data.toJson());

class ExpertPrescList {
  ExpertPrescList({
    required this.code,
    required this.msg,
    required this.type,
    required this.data,
  });

  String code;
  String msg;
  String type;
  PrescData data;

  factory ExpertPrescList.fromJson(Map<String, dynamic> json) =>
      ExpertPrescList(
        code: json["code"],
        msg: json["msg"],
        type: json["type"],
        data: PrescData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "type": type,
        "data": data.toJson(),
      };
}

class PrescData {
  PrescData({
    required this.preDetails,
  });

  List<List<PreDetail>> preDetails;

  factory PrescData.fromJson(Map<String, dynamic> json) => PrescData(
        preDetails: List<List<PreDetail>>.from(json["pre_details"].map(
            (x) => List<PreDetail>.from(x.map((x) => PreDetail.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "pre_details": List<dynamic>.from(preDetails
            .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class PreDetail {
  PreDetail({
    required this.prescriptionDetailsId,
    required this.prescriptionId,
    required this.medicineName,
    required this.insName,
    required this.frequency,
    required this.attachment,
    required this.dateCreated,
    required this.createdBy,
    required this.dateModified,
  });

  String prescriptionDetailsId;
  String prescriptionId;
  String medicineName;
  String insName;
  String frequency;
  String attachment;
  DateTime dateCreated;
  String createdBy;
  DateTime dateModified;

  factory PreDetail.fromJson(Map<String, dynamic> json) => PreDetail(
        prescriptionDetailsId: json["prescription_details_id"],
        prescriptionId: json["prescription_id"],
        medicineName: json["medicine_name"],
        insName: json["ins_name"],
        frequency: json["frequency"],
        attachment: json["attachment"],
        dateCreated: DateTime.parse(json["date_created"]),
        createdBy: json["CreatedBy"],
        dateModified: DateTime.parse(json["date_modified"]),
      );

  Map<String, dynamic> toJson() => {
        "prescription_details_id": prescriptionDetailsId,
        "prescription_id": prescriptionId,
        "medicine_name": medicineName,
        "ins_name": insName,
        "frequency": frequency,
        "attachment": attachment,
        "date_created": dateCreated.toIso8601String(),
        "CreatedBy": createdBy,
        "date_modified": dateModified.toIso8601String(),
      };
}
