class LockerDataList {
  String? msg;
  String? type;
  List<PatientDocs>? patientDocs;

  LockerDataList({this.msg, this.type, this.patientDocs});

  LockerDataList.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    type = json['type'];
    if (json['patient_docs'] != null) {
      patientDocs = <PatientDocs>[];
      json['patient_docs'].forEach((v) {
        patientDocs!.add(PatientDocs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['type'] = type;
    if (patientDocs != null) {
      data['patient_docs'] = patientDocs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientDocs {
  String? lockerId;
  String? appointmentId;
  String? caseNo;
  String? documentTitle;
  String? patientId;
  String? documentPath;
  String? documentType;
  String? dateCreated;
  String? dateModified;
  String? doctorName;
  String? isShare;

  PatientDocs(
      {this.lockerId,
      this.appointmentId,
      this.caseNo,
      this.documentTitle,
      this.patientId,
      this.documentPath,
      this.documentType,
      this.dateCreated,
      this.dateModified,
      this.doctorName,
      this.isShare});

  PatientDocs.fromJson(Map<String, dynamic> json) {
    lockerId = json['locker_id'];
    appointmentId = json['appointment_id'];
    caseNo = json['case_no'];
    documentTitle = json['document_title'];
    patientId = json['patient_id'];
    documentPath = json['document_path'];
    documentType = json['document_type'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    doctorName = json['doctor_name'];
    isShare = json['is_share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locker_id'] = lockerId;
    data['appointment_id'] = appointmentId;
    data['case_no'] = caseNo;
    data['document_title'] = documentTitle;
    data['patient_id'] = patientId;
    data['document_path'] = documentPath;
    data['document_type'] = documentType;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['doctor_name'] = doctorName;
    data['is_share'] = isShare;
    return data;
  }
}
