class PatientPrescList {
  String? code;
  String? msg;
  String? type;
  PrescList? data;

  PatientPrescList({this.code, this.msg, this.type, this.data});

  PatientPrescList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data = json['data'] != null ? PrescList.fromJson(json['data']) : null;
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

class PrescList {
  List<PreDetails>? preDetails;

  PrescList({this.preDetails});

  PrescList.fromJson(Map<String, dynamic> json) {
    if (json['pre_details'] != null) {
      preDetails = <PreDetails>[];
      json['pre_details'].forEach((v) {
        preDetails!.add(PreDetails.fromJson(v));
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

class PreDetails {
  String? prescriptionId;
  String? patientId;
  String? appointmentId;
  String? caseNo;
  String? dateApt;

  PreDetails(
      {this.prescriptionId,
      this.patientId,
      this.appointmentId,
      this.caseNo,
      this.dateApt});

  PreDetails.fromJson(Map<String, dynamic> json) {
    prescriptionId = json['prescription_id'];
    patientId = json['patient_id'];
    appointmentId = json['appointment_id'];
    caseNo = json['case_no'];
    dateApt = json['date_apt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prescription_id'] = prescriptionId;
    data['patient_id'] = patientId;
    data['appointment_id'] = appointmentId;
    data['case_no'] = caseNo;
    data['date_apt'] = dateApt;
    return data;
  }
}
