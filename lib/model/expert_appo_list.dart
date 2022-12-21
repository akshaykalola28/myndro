class expertAppoList {
  String? code;
  String? msg;
  String? type;
  ExpertAppoData? data;

  expertAppoList({this.code, this.msg, this.type, this.data});

  expertAppoList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data = json['data'] != null ? ExpertAppoData.fromJson(json['data']) : null;
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

class ExpertAppoData {
  List<Appointment>? appointment;

  ExpertAppoData({this.appointment});

  ExpertAppoData.fromJson(Map<String, dynamic> json) {
    if (json['appointment'] != null) {
      appointment = <Appointment>[];
      json['appointment'].forEach((v) {
        appointment!.add(Appointment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointment != null) {
      data['appointment'] = appointment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointment {
  String? appointmentId;
  String? categoryId;
  String? subCategoryId;
  String? audioVideo;
  String? doctorId;
  String? appointmentDate;
  String? appointmentTime;
  String? patientId;
  String? appointmentLink;
  String? meetingId;
  String? meetingStatus;
  String? meetingDuration;
  String? dateCreated;
  String? dateModified;
  String? type;
  String? quickConnect;
  String? status;
  String? caseNo;
  String? invoiceNo;
  String? invoiceUrl;
  String? isGeneratedMyndroToDocInvoice;
  String? doctorInvoiceUrl;
  String? doctorType;
  String? doctorName;
  String? doctorCategoryId;
  String? doctorSubcategoryIds;
  String? doctorProfession;
  String? doctorContactNo;
  String? doctorEmailId;
  String? doctorGender;
  String? doctorDob;
  String? doctorPincode;
  String? doctorAddress;
  String? doctorProfileImage;
  String? doctorAdharCard;
  String? doctorPanCard;
  String? doctorVendorAgreement;
  String? doctorVendorSignature;
  String? doctorStatus;
  String? aadharNumber;
  String? doctorAdharCardBack;
  String? panCardNumber;
  String? passportBack;
  String? passportFront;
  String? passportNumber;
  String? voterIdCardBack;
  String? voterIdCardFront;
  String? voterIdCardNumber;
  String? drivingLicenseBack;
  String? drivingLicenseFront;
  String? drivingLicenseNumber;
  String? doctorDegreeCertificatePath;
  String? doctorPracticeCertificatePath;
  String? isAcceptDeclaration;
  dynamic isHaveGst;
  String? gstNumber;
  String? doctorCreatedDate;
  String? doctorStartTime;
  String? doctorEndTime;
  String? doctorSessionDurationMinute;
  String? doctorVideoCharge;
  String? doctorAudioCharge;
  String? degreeCollegeName;
  String? degreeName;
  String? degreeYear;
  String? doctorSerialNumber;
  String? patientName;
  String? patientPhoneNo;
  String? patientEmail;
  String? patientDate;
  String? patientGender;
  String? patientAddressLine1;
  String? patientAddressLine2;
  dynamic patientAddressLine3;
  dynamic patientAddressLine4;
  dynamic patientAddressLine5;
  String? patientCountryId;
  String? patientStateId;
  String? patientCityId;
  String? patientZipCode;
  String? patientCreatedDate;
  String? doctorCategoryName;
  String? hSNCode;
  String? adminCommisionPer;
  String? doctorSubcategoryName;
  String? doctorCountryName;
  String? doctorStateName;
  String? doctorCityName;
  String? patientCountryName;
  String? patientStateName;
  String? patientCityName;

  Appointment(
      {this.appointmentId,
      this.categoryId,
      this.subCategoryId,
      this.audioVideo,
      this.doctorId,
      this.appointmentDate,
      this.appointmentTime,
      this.patientId,
      this.appointmentLink,
      this.meetingId,
      this.meetingStatus,
      this.meetingDuration,
      this.dateCreated,
      this.dateModified,
      this.type,
      this.quickConnect,
      this.status,
      this.caseNo,
      this.invoiceNo,
      this.invoiceUrl,
      this.isGeneratedMyndroToDocInvoice,
      this.doctorInvoiceUrl,
      this.doctorType,
      this.doctorName,
      this.doctorCategoryId,
      this.doctorSubcategoryIds,
      this.doctorProfession,
      this.doctorContactNo,
      this.doctorEmailId,
      this.doctorGender,
      this.doctorDob,
      this.doctorPincode,
      this.doctorAddress,
      this.doctorProfileImage,
      this.doctorAdharCard,
      this.doctorPanCard,
      this.doctorVendorAgreement,
      this.doctorVendorSignature,
      this.doctorStatus,
      this.aadharNumber,
      this.doctorAdharCardBack,
      this.panCardNumber,
      this.passportBack,
      this.passportFront,
      this.passportNumber,
      this.voterIdCardBack,
      this.voterIdCardFront,
      this.voterIdCardNumber,
      this.drivingLicenseBack,
      this.drivingLicenseFront,
      this.drivingLicenseNumber,
      this.doctorDegreeCertificatePath,
      this.doctorPracticeCertificatePath,
      this.isAcceptDeclaration,
      this.isHaveGst,
      this.gstNumber,
      this.doctorCreatedDate,
      this.doctorStartTime,
      this.doctorEndTime,
      this.doctorSessionDurationMinute,
      this.doctorVideoCharge,
      this.doctorAudioCharge,
      this.degreeCollegeName,
      this.degreeName,
      this.degreeYear,
      this.doctorSerialNumber,
      this.patientName,
      this.patientPhoneNo,
      this.patientEmail,
      this.patientDate,
      this.patientGender,
      this.patientAddressLine1,
      this.patientAddressLine2,
      this.patientAddressLine3,
      this.patientAddressLine4,
      this.patientAddressLine5,
      this.patientCountryId,
      this.patientStateId,
      this.patientCityId,
      this.patientZipCode,
      this.patientCreatedDate,
      this.doctorCategoryName,
      this.hSNCode,
      this.adminCommisionPer,
      this.doctorSubcategoryName,
      this.doctorCountryName,
      this.doctorStateName,
      this.doctorCityName,
      this.patientCountryName,
      this.patientStateName,
      this.patientCityName});

  Appointment.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    audioVideo = json['audio_video'];
    doctorId = json['doctor_id'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    patientId = json['patient_id'];
    appointmentLink = json['appointment_link'];
    meetingId = json['meeting_id'];
    meetingStatus = json['meeting_status'];
    meetingDuration = json['meeting_duration'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    type = json['type'];
    quickConnect = json['quick_connect'];
    status = json['status'];
    caseNo = json['case_no'];
    invoiceNo = json['invoice_no'];
    invoiceUrl = json['invoice_url'];
    isGeneratedMyndroToDocInvoice = json['is_generated_myndro_to_doc_invoice'];
    doctorInvoiceUrl = json['doctor_invoice_url'];
    doctorType = json['doctor_type'];
    doctorName = json['doctor_name'];
    doctorCategoryId = json['doctor_category_id'];
    doctorSubcategoryIds = json['doctor_subcategory_ids'];
    doctorProfession = json['doctor_profession'];
    doctorContactNo = json['doctor_contact_no'];
    doctorEmailId = json['doctor_email_id'];
    doctorGender = json['doctor_gender'];
    doctorDob = json['doctor_dob'];
    doctorPincode = json['doctor_pincode'];
    doctorAddress = json['doctor_address'];
    doctorProfileImage = json['doctor_profile_image'];
    doctorAdharCard = json['doctor_adhar_card'];
    doctorPanCard = json['doctor_pan_card'];
    doctorVendorAgreement = json['doctor_vendor_agreement'];
    doctorVendorSignature = json['doctor_vendor_signature'];
    doctorStatus = json['doctor_status'];
    aadharNumber = json['aadhar_number'];
    doctorAdharCardBack = json['doctor_adhar_card_back'];
    panCardNumber = json['pan_card_number'];
    passportBack = json['passport_back'];
    passportFront = json['passport_front'];
    passportNumber = json['passport_number'];
    voterIdCardBack = json['voter_id_card_back'];
    voterIdCardFront = json['voter_id_card_front'];
    voterIdCardNumber = json['voter_id_card_number'];
    drivingLicenseBack = json['driving_license_back'];
    drivingLicenseFront = json['driving_license_front'];
    drivingLicenseNumber = json['driving_license_number'];
    doctorDegreeCertificatePath = json['doctor_degree_certificate_path'];
    doctorPracticeCertificatePath = json['doctor_practice_certificate_path'];
    isAcceptDeclaration = json['is_accept_declaration'];
    isHaveGst = json['is_have_gst'];
    gstNumber = json['gst_number'];
    doctorCreatedDate = json['doctorCreatedDate'];
    doctorStartTime = json['doctor_start_time'];
    doctorEndTime = json['doctor_end_time'];
    doctorSessionDurationMinute = json['doctor_session_duration_minute'];
    doctorVideoCharge = json['doctor_video_charge'];
    doctorAudioCharge = json['doctor_audio_charge'];
    degreeCollegeName = json['degree_college_name'];
    degreeName = json['degree_name'];
    degreeYear = json['degree_year'];
    doctorSerialNumber = json['doctor_serial_number'];
    patientName = json['PatientName'];
    patientPhoneNo = json['patient_phone_no'];
    patientEmail = json['patient_email'];
    patientDate = json['patient_date'];
    patientGender = json['patient_gender'];
    patientAddressLine1 = json['patient_address_line_1'];
    patientAddressLine2 = json['patient_address_line_2'];
    patientAddressLine3 = json['patient_address_line_3'];
    patientAddressLine4 = json['patient_address_line_4'];
    patientAddressLine5 = json['patient_address_line_5'];
    patientCountryId = json['patient_country_id'];
    patientStateId = json['patient_state_id'];
    patientCityId = json['patient_city_id'];
    patientZipCode = json['patient_zip_code'];
    patientCreatedDate = json['patientCreatedDate'];
    doctorCategoryName = json['doctor_category_name'];
    hSNCode = json['HSNCode'];
    adminCommisionPer = json['admin_commision_per'];
    doctorSubcategoryName = json['doctor_subcategory_name'];
    doctorCountryName = json['DoctorCountryName'];
    doctorStateName = json['DoctorStateName'];
    doctorCityName = json['DoctorCityName'];
    patientCountryName = json['PatientCountryName'];
    patientStateName = json['PatientStateName'];
    patientCityName = json['PatientCityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_id'] = appointmentId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['audio_video'] = audioVideo;
    data['doctor_id'] = doctorId;
    data['appointment_date'] = appointmentDate;
    data['appointment_time'] = appointmentTime;
    data['patient_id'] = patientId;
    data['appointment_link'] = appointmentLink;
    data['meeting_id'] = meetingId;
    data['meeting_status'] = meetingStatus;
    data['meeting_duration'] = meetingDuration;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['type'] = type;
    data['quick_connect'] = quickConnect;
    data['status'] = status;
    data['case_no'] = caseNo;
    data['invoice_no'] = invoiceNo;
    data['invoice_url'] = invoiceUrl;
    data['is_generated_myndro_to_doc_invoice'] = isGeneratedMyndroToDocInvoice;
    data['doctor_invoice_url'] = doctorInvoiceUrl;
    data['doctor_type'] = doctorType;
    data['doctor_name'] = doctorName;
    data['doctor_category_id'] = doctorCategoryId;
    data['doctor_subcategory_ids'] = doctorSubcategoryIds;
    data['doctor_profession'] = doctorProfession;
    data['doctor_contact_no'] = doctorContactNo;
    data['doctor_email_id'] = doctorEmailId;
    data['doctor_gender'] = doctorGender;
    data['doctor_dob'] = doctorDob;
    data['doctor_pincode'] = doctorPincode;
    data['doctor_address'] = doctorAddress;
    data['doctor_profile_image'] = doctorProfileImage;
    data['doctor_adhar_card'] = doctorAdharCard;
    data['doctor_pan_card'] = doctorPanCard;
    data['doctor_vendor_agreement'] = doctorVendorAgreement;
    data['doctor_vendor_signature'] = doctorVendorSignature;
    data['doctor_status'] = doctorStatus;
    data['aadhar_number'] = aadharNumber;
    data['doctor_adhar_card_back'] = doctorAdharCardBack;
    data['pan_card_number'] = panCardNumber;
    data['passport_back'] = passportBack;
    data['passport_front'] = passportFront;
    data['passport_number'] = passportNumber;
    data['voter_id_card_back'] = voterIdCardBack;
    data['voter_id_card_front'] = voterIdCardFront;
    data['voter_id_card_number'] = voterIdCardNumber;
    data['driving_license_back'] = drivingLicenseBack;
    data['driving_license_front'] = drivingLicenseFront;
    data['driving_license_number'] = drivingLicenseNumber;
    data['doctor_degree_certificate_path'] = doctorDegreeCertificatePath;
    data['doctor_practice_certificate_path'] = doctorPracticeCertificatePath;
    data['is_accept_declaration'] = isAcceptDeclaration;
    data['is_have_gst'] = isHaveGst;
    data['gst_number'] = gstNumber;
    data['doctorCreatedDate'] = doctorCreatedDate;
    data['doctor_start_time'] = doctorStartTime;
    data['doctor_end_time'] = doctorEndTime;
    data['doctor_session_duration_minute'] = doctorSessionDurationMinute;
    data['doctor_video_charge'] = doctorVideoCharge;
    data['doctor_audio_charge'] = doctorAudioCharge;
    data['degree_college_name'] = degreeCollegeName;
    data['degree_name'] = degreeName;
    data['degree_year'] = degreeYear;
    data['doctor_serial_number'] = doctorSerialNumber;
    data['PatientName'] = patientName;
    data['patient_phone_no'] = patientPhoneNo;
    data['patient_email'] = patientEmail;
    data['patient_date'] = patientDate;
    data['patient_gender'] = patientGender;
    data['patient_address_line_1'] = patientAddressLine1;
    data['patient_address_line_2'] = patientAddressLine2;
    data['patient_address_line_3'] = patientAddressLine3;
    data['patient_address_line_4'] = patientAddressLine4;
    data['patient_address_line_5'] = patientAddressLine5;
    data['patient_country_id'] = patientCountryId;
    data['patient_state_id'] = patientStateId;
    data['patient_city_id'] = patientCityId;
    data['patient_zip_code'] = patientZipCode;
    data['patientCreatedDate'] = patientCreatedDate;
    data['doctor_category_name'] = doctorCategoryName;
    data['HSNCode'] = hSNCode;
    data['admin_commision_per'] = adminCommisionPer;
    data['doctor_subcategory_name'] = doctorSubcategoryName;
    data['DoctorCountryName'] = doctorCountryName;
    data['DoctorStateName'] = doctorStateName;
    data['DoctorCityName'] = doctorCityName;
    data['PatientCountryName'] = patientCountryName;
    data['PatientStateName'] = patientStateName;
    data['PatientCityName'] = patientCityName;
    return data;
  }
}
