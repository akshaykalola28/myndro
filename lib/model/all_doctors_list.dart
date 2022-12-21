class AllDoctors {
  String? code;
  String? msg;
  String? type;
  DoctorsList? data;

  AllDoctors({this.code, this.msg, this.type, this.data});

  AllDoctors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data = json['data'] != null ? DoctorsList.fromJson(json['data']) : null;
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

class DoctorsList {
  List<DoctorcategoryList>? doctorcategory;

  DoctorsList({this.doctorcategory});

  DoctorsList.fromJson(Map<String, dynamic> json) {
    if (json['doctorcategory'] != null) {
      doctorcategory = <DoctorcategoryList>[];
      json['doctorcategory'].forEach((v) {
        doctorcategory!.add(DoctorcategoryList.fromJson(v));
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

class DoctorcategoryList {
  String? doctorId;
  String? doctorType;
  String? doctorName;
  String? doctorCategoryId;
  String? doctorSubcategoryIds;
  String? doctorProfession;
  String? doctorContactNo;
  String? doctorEmailId;
  String? doctorUserName;
  String? doctorPassword;
  String? doctorGender;
  String? doctorDob;
  String? doctorCountryId;
  String? doctorStateId;
  String? doctorCityId;
  String? doctorPincode;
  String? doctorAddress;
  String? doctorProfileImage;
  String? doctorAdharCard;
  String? doctorPanCard;
  String? doctorDocumentNo;
  String? doctorDegreeCertificatePath;
  String? doctorPracticeCertificatePath;
  String? doctorGstCertificatePath;
  String? doctorVendorAgreement;
  String? doctorVendorSignature;
  String? doctorStatus;
  String? dateCreated;
  String? dateModified;
  String? ipAddress;
  String? doctorDesc;
  String? doctorStartTime;
  String? doctorEndTime;
  String? doctorVideoCharge;
  String? doctorAudioCharge;
  dynamic otp;
  String? otpDatetime;
  String? isOtpVerified;
  String? degreeCollegeName;
  String? degreeName;
  String? degreeYear;
  String? doctorSerialNumber;
  String? doctorBankId;
  String? doctorBankName;
  String? doctorAccountName;
  String? doctorAccountNumber;
  String? doctorIfscCode;
  String? doctorBankAddress;
  String? doctorAccountType;
  String? doctorBankCountryId;
  String? doctorBankStateId;
  String? doctorBankCityId;
  String? doctorCancelCheque;
  String? doctorBankZipCode;
  String? doctorAdditionalInfoId;
  String? doctorAdditionalDegree;
  String? addDegreeCollegeName;
  String? addDegreeYear;
  String? workExperienceCertificate;
  String? doctorWorkExperience;
  String? workExperienceInYear;
  String? doctorAwardsCertificate;
  String? doctorAwards;
  String? doctorAwardsYear;
  String? doctorTraningCertificatePath;
  String? doctorTrainingDes;
  String? doctorTrainingYear;
  String? doctorExpertize;
  String? doctorSpecialization;
  String? doctorTreatmentApproch;
  String? doctorLanguage;
  String? doctorSessionTime;
  String? doctorSessionPrice;
  String? countryId;
  String? countryName;
  String? note;
  String? countryCode;
  String? stateId;
  String? stateName;
  String? cityId;
  String? cityName;
  String? doctorCategoryName;
  String? adminCommisionPer;
  String? doctorCategoryNote;

  DoctorcategoryList(
      {this.doctorId,
      this.doctorType,
      this.doctorName,
      this.doctorCategoryId,
      this.doctorSubcategoryIds,
      this.doctorProfession,
      this.doctorContactNo,
      this.doctorEmailId,
      this.doctorUserName,
      this.doctorPassword,
      this.doctorGender,
      this.doctorDob,
      this.doctorCountryId,
      this.doctorStateId,
      this.doctorCityId,
      this.doctorPincode,
      this.doctorAddress,
      this.doctorProfileImage,
      this.doctorAdharCard,
      this.doctorPanCard,
      this.doctorDocumentNo,
      this.doctorDegreeCertificatePath,
      this.doctorPracticeCertificatePath,
      this.doctorGstCertificatePath,
      this.doctorVendorAgreement,
      this.doctorVendorSignature,
      this.doctorStatus,
      this.dateCreated,
      this.dateModified,
      this.ipAddress,
      this.doctorDesc,
      this.doctorStartTime,
      this.doctorEndTime,
      this.doctorVideoCharge,
      this.doctorAudioCharge,
      this.otp,
      this.otpDatetime,
      this.isOtpVerified,
      this.degreeCollegeName,
      this.degreeName,
      this.degreeYear,
      this.doctorSerialNumber,
      this.doctorBankId,
      this.doctorBankName,
      this.doctorAccountName,
      this.doctorAccountNumber,
      this.doctorIfscCode,
      this.doctorBankAddress,
      this.doctorAccountType,
      this.doctorBankCountryId,
      this.doctorBankStateId,
      this.doctorBankCityId,
      this.doctorCancelCheque,
      this.doctorBankZipCode,
      this.doctorAdditionalInfoId,
      this.doctorAdditionalDegree,
      this.addDegreeCollegeName,
      this.addDegreeYear,
      this.workExperienceCertificate,
      this.doctorWorkExperience,
      this.workExperienceInYear,
      this.doctorAwardsCertificate,
      this.doctorAwards,
      this.doctorAwardsYear,
      this.doctorTraningCertificatePath,
      this.doctorTrainingDes,
      this.doctorTrainingYear,
      this.doctorExpertize,
      this.doctorSpecialization,
      this.doctorTreatmentApproch,
      this.doctorLanguage,
      this.doctorSessionTime,
      this.doctorSessionPrice,
      this.countryId,
      this.countryName,
      this.note,
      this.countryCode,
      this.stateId,
      this.stateName,
      this.cityId,
      this.cityName,
      this.doctorCategoryName,
      this.adminCommisionPer,
      this.doctorCategoryNote});

  DoctorcategoryList.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    doctorType = json['doctor_type'];
    doctorName = json['doctor_name'];
    doctorCategoryId = json['doctor_category_id'];
    doctorSubcategoryIds = json['doctor_subcategory_ids'];
    doctorProfession = json['doctor_profession'];
    doctorContactNo = json['doctor_contact_no'];
    doctorEmailId = json['doctor_email_id'];
    doctorUserName = json['doctor_user_name'];
    doctorPassword = json['doctor_password'];
    doctorGender = json['doctor_gender'];
    doctorDob = json['doctor_dob'];
    doctorCountryId = json['doctor_country_id'];
    doctorStateId = json['doctor_state_id'];
    doctorCityId = json['doctor_city_id'];
    doctorPincode = json['doctor_pincode'];
    doctorAddress = json['doctor_address'];
    doctorProfileImage = json['doctor_profile_image'];
    doctorAdharCard = json['doctor_adhar_card'];
    doctorPanCard = json['doctor_pan_card'];
    doctorDocumentNo = json['doctor_document_no'];
    doctorDegreeCertificatePath = json['doctor_degree_certificate_path'];
    doctorPracticeCertificatePath = json['doctor_practice_certificate_path'];
    doctorGstCertificatePath = json['doctor_gst_certificate_path'];
    doctorVendorAgreement = json['doctor_vendor_agreement'];
    doctorVendorSignature = json['doctor_vendor_signature'];
    doctorStatus = json['doctor_status'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    ipAddress = json['ip_address'];
    doctorDesc = json['doctor_desc'];
    doctorStartTime = json['doctor_start_time'];
    doctorEndTime = json['doctor_end_time'];
    doctorVideoCharge = json['doctor_video_charge'];
    doctorAudioCharge = json['doctor_audio_charge'];
    otp = json['otp'];
    otpDatetime = json['otp_datetime'];
    isOtpVerified = json['is_otp_verified'];
    degreeCollegeName = json['degree_college_name'];
    degreeName = json['degree_name'];
    degreeYear = json['degree_year'];
    doctorSerialNumber = json['doctor_serial_number'];
    doctorBankId = json['doctor_bank_id'];
    doctorBankName = json['doctor_bank_name'];
    doctorAccountName = json['doctor_account_name'];
    doctorAccountNumber = json['doctor_account_number'];
    doctorIfscCode = json['doctor_ifsc_code'];
    doctorBankAddress = json['doctor_bank_address'];
    doctorAccountType = json['doctor_account_type'];
    doctorBankCountryId = json['doctor_bank_country_id'];
    doctorBankStateId = json['doctor_bank_state_id'];
    doctorBankCityId = json['doctor_bank_city_id'];
    doctorCancelCheque = json['doctor_cancel_cheque'];
    doctorBankZipCode = json['doctor_bank_zip_code'];
    doctorAdditionalInfoId = json['doctor_additional_info_id'];
    doctorAdditionalDegree = json['doctor_additional_degree'];
    addDegreeCollegeName = json['add_degree_college_name'];
    addDegreeYear = json['add_degree_year'];
    workExperienceCertificate = json['work_experience_certificate'];
    doctorWorkExperience = json['doctor_work_experience'];
    workExperienceInYear = json['work_experience_in_year'];
    doctorAwardsCertificate = json['doctor_Awards_certificate'];
    doctorAwards = json['doctor_awards'];
    doctorAwardsYear = json['doctor_awards_year'];
    doctorTraningCertificatePath = json['doctor_traning_certificate_path'];
    doctorTrainingDes = json['doctor_training_des'];
    doctorTrainingYear = json['doctor_training_year'];
    doctorExpertize = json['doctor_expertize'];
    doctorSpecialization = json['doctor_specialization'];
    doctorTreatmentApproch = json['doctor_treatment_approch'];
    doctorLanguage = json['doctor_language'];
    doctorSessionTime = json['doctor_session_time'];
    doctorSessionPrice = json['doctor_session_price'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    note = json['note'];
    countryCode = json['country_code'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    doctorCategoryName = json['doctor_category_name'];
    adminCommisionPer = json['admin_commision_per'];
    doctorCategoryNote = json['doctor_category_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['doctor_type'] = doctorType;
    data['doctor_name'] = doctorName;
    data['doctor_category_id'] = doctorCategoryId;
    data['doctor_subcategory_ids'] = doctorSubcategoryIds;
    data['doctor_profession'] = doctorProfession;
    data['doctor_contact_no'] = doctorContactNo;
    data['doctor_email_id'] = doctorEmailId;
    data['doctor_user_name'] = doctorUserName;
    data['doctor_password'] = doctorPassword;
    data['doctor_gender'] = doctorGender;
    data['doctor_dob'] = doctorDob;
    data['doctor_country_id'] = doctorCountryId;
    data['doctor_state_id'] = doctorStateId;
    data['doctor_city_id'] = doctorCityId;
    data['doctor_pincode'] = doctorPincode;
    data['doctor_address'] = doctorAddress;
    data['doctor_profile_image'] = doctorProfileImage;
    data['doctor_adhar_card'] = doctorAdharCard;
    data['doctor_pan_card'] = doctorPanCard;
    data['doctor_document_no'] = doctorDocumentNo;
    data['doctor_degree_certificate_path'] = doctorDegreeCertificatePath;
    data['doctor_practice_certificate_path'] = doctorPracticeCertificatePath;
    data['doctor_gst_certificate_path'] = doctorGstCertificatePath;
    data['doctor_vendor_agreement'] = doctorVendorAgreement;
    data['doctor_vendor_signature'] = doctorVendorSignature;
    data['doctor_status'] = doctorStatus;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['ip_address'] = ipAddress;
    data['doctor_desc'] = doctorDesc;
    data['doctor_start_time'] = doctorStartTime;
    data['doctor_end_time'] = doctorEndTime;
    data['doctor_video_charge'] = doctorVideoCharge;
    data['doctor_audio_charge'] = doctorAudioCharge;
    data['otp'] = otp;
    data['otp_datetime'] = otpDatetime;
    data['is_otp_verified'] = isOtpVerified;
    data['degree_college_name'] = degreeCollegeName;
    data['degree_name'] = degreeName;
    data['degree_year'] = degreeYear;
    data['doctor_serial_number'] = doctorSerialNumber;
    data['doctor_bank_id'] = doctorBankId;
    data['doctor_bank_name'] = doctorBankName;
    data['doctor_account_name'] = doctorAccountName;
    data['doctor_account_number'] = doctorAccountNumber;
    data['doctor_ifsc_code'] = doctorIfscCode;
    data['doctor_bank_address'] = doctorBankAddress;
    data['doctor_account_type'] = doctorAccountType;
    data['doctor_bank_country_id'] = doctorBankCountryId;
    data['doctor_bank_state_id'] = doctorBankStateId;
    data['doctor_bank_city_id'] = doctorBankCityId;
    data['doctor_cancel_cheque'] = doctorCancelCheque;
    data['doctor_bank_zip_code'] = doctorBankZipCode;
    data['doctor_additional_info_id'] = doctorAdditionalInfoId;
    data['doctor_additional_degree'] = doctorAdditionalDegree;
    data['add_degree_college_name'] = addDegreeCollegeName;
    data['add_degree_year'] = addDegreeYear;
    data['work_experience_certificate'] = workExperienceCertificate;
    data['doctor_work_experience'] = doctorWorkExperience;
    data['work_experience_in_year'] = workExperienceInYear;
    data['doctor_Awards_certificate'] = doctorAwardsCertificate;
    data['doctor_awards'] = doctorAwards;
    data['doctor_awards_year'] = doctorAwardsYear;
    data['doctor_traning_certificate_path'] = doctorTraningCertificatePath;
    data['doctor_training_des'] = doctorTrainingDes;
    data['doctor_training_year'] = doctorTrainingYear;
    data['doctor_expertize'] = doctorExpertize;
    data['doctor_specialization'] = doctorSpecialization;
    data['doctor_treatment_approch'] = doctorTreatmentApproch;
    data['doctor_language'] = doctorLanguage;
    data['doctor_session_time'] = doctorSessionTime;
    data['doctor_session_price'] = doctorSessionPrice;
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['note'] = note;
    data['country_code'] = countryCode;
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['doctor_category_name'] = doctorCategoryName;
    data['admin_commision_per'] = adminCommisionPer;
    data['doctor_category_note'] = doctorCategoryNote;
    return data;
  }
}
