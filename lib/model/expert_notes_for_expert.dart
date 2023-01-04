class ExpertNotesForExpert {
  String? code;
  String? msg;
  String? type;
  List<ExpertNotesForExpertList>? data;

  ExpertNotesForExpert({this.code, this.msg, this.type, this.data});

  ExpertNotesForExpert.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    if (json['data'] != null) {
      data = <ExpertNotesForExpertList>[];
      json['data'].forEach((v) {
        data!.add(ExpertNotesForExpertList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpertNotesForExpertList {
  String? appointmentNotesId;
  String? appointmentId;
  String? doctorId;
  String? caseNo;
  String? patientId;
  String? notesDesc;
  String? isShare;
  dynamic shareDate;
  String? createdDate;
  String? createdBy;

  ExpertNotesForExpertList(
      {this.appointmentNotesId,
      this.appointmentId,
      this.doctorId,
      this.caseNo,
      this.patientId,
      this.notesDesc,
      this.isShare,
      this.shareDate,
      this.createdDate,
      this.createdBy});

  ExpertNotesForExpertList.fromJson(Map<String, dynamic> json) {
    appointmentNotesId = json['appointment_notes_id'];
    appointmentId = json['appointment_id'];
    doctorId = json['doctor_id'];
    caseNo = json['case_no'];
    patientId = json['patient_id'];
    notesDesc = json['notes_desc'];
    isShare = json['is_share'];
    shareDate = json['share_date'];
    createdDate = json['created_date'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_notes_id'] = appointmentNotesId;
    data['appointment_id'] = appointmentId;
    data['doctor_id'] = doctorId;
    data['case_no'] = caseNo;
    data['patient_id'] = patientId;
    data['notes_desc'] = notesDesc;
    data['is_share'] = isShare;
    data['share_date'] = shareDate;
    data['created_date'] = createdDate;
    data['created_by'] = createdBy;
    return data;
  }
}
