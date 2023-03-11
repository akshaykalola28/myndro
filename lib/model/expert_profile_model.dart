class ExpertProfile {
  String? code;
  String? msg;
  String? type;
  ExpertProfileData? data;

  ExpertProfile({this.code, this.msg, this.type, this.data});

  ExpertProfile.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data =
        json['data'] != null ? ExpertProfileData.fromJson(json['data']) : null;
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

class ExpertProfileData {
  DoctorInfoMyProfile? doctorInfoMyProfile;
  String? doctorSpecialities;

  ExpertProfileData({this.doctorInfoMyProfile, this.doctorSpecialities});

  ExpertProfileData.fromJson(Map<String, dynamic> json) {
    doctorInfoMyProfile = json['doctor_info_myProfile'] != null
        ? DoctorInfoMyProfile.fromJson(json['doctor_info_myProfile'])
        : null;
    doctorSpecialities = json['Doctor_Specialities'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorInfoMyProfile != null) {
      data['doctor_info_myProfile'] = doctorInfoMyProfile!.toJson();
    }
    data['Doctor_Specialities'] = doctorSpecialities;
    return data;
  }
}

class DoctorInfoMyProfile {
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
  String? aadharNumber;
  String? doctorAdharCard;
  String? doctorAdharCardBack;
  String? panCardNumber;
  String? doctorPanCard;
  String? passportBack;
  String? passportFront;
  String? passportNumber;
  String? voterIdCardBack;
  String? voterIdCardFront;
  String? voterIdCardNumber;
  String? drivingLicenseBack;
  String? drivingLicenseFront;
  String? drivingLicenseNumber;
  String? doctorDocumentNo;
  String? doctorDegreeCertificatePath;
  String? doctorPracticeCertificatePath;
  String? isAcceptDeclaration;
  String? isHaveGst;
  String? gstNumber;
  String? doctorGstCertificatePath;
  String? doctorVendorAgreement;
  String? doctorVendorSignature;
  String? doctorCancelCheque;
  String? doctorStatus;
  String? dateCreated;
  String? dateModified;
  String? ipAddress;
  String? doctorDesc;
  String? doctorStartTime;
  String? doctorEndTime;
  String? doctorSessionDurationMinute;
  String? doctorVideoCharge;
  String? doctorAudioCharge;
  String? otp;
  String? otpDatetime;
  String? isOtpVerified;
  String? degreeCollegeName;
  String? degreeName;
  String? degreeYear;
  String? practiceNo;
  String? doctorSerialNumber;
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
  String? doctorCategoryName;
  List<Expertize>? expertize;
  List<Speciliaztion>? speciliaztion;
  List<TreatmentApproch>? treatmentApproch;

  DoctorInfoMyProfile(
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
      this.aadharNumber,
      this.doctorAdharCard,
      this.doctorAdharCardBack,
      this.panCardNumber,
      this.doctorPanCard,
      this.passportBack,
      this.passportFront,
      this.passportNumber,
      this.voterIdCardBack,
      this.voterIdCardFront,
      this.voterIdCardNumber,
      this.drivingLicenseBack,
      this.drivingLicenseFront,
      this.drivingLicenseNumber,
      this.doctorDocumentNo,
      this.doctorDegreeCertificatePath,
      this.doctorPracticeCertificatePath,
      this.isAcceptDeclaration,
      this.isHaveGst,
      this.gstNumber,
      this.doctorGstCertificatePath,
      this.doctorVendorAgreement,
      this.doctorVendorSignature,
      this.doctorCancelCheque,
      this.doctorStatus,
      this.dateCreated,
      this.dateModified,
      this.ipAddress,
      this.doctorDesc,
      this.doctorStartTime,
      this.doctorEndTime,
      this.doctorSessionDurationMinute,
      this.doctorVideoCharge,
      this.doctorAudioCharge,
      this.otp,
      this.otpDatetime,
      this.isOtpVerified,
      this.degreeCollegeName,
      this.degreeName,
      this.degreeYear,
      this.practiceNo,
      this.doctorSerialNumber,
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
      this.doctorCategoryName,
      this.expertize,
      this.speciliaztion,
      this.treatmentApproch});

  DoctorInfoMyProfile.fromJson(Map<String, dynamic> json) {
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
    aadharNumber = json['aadhar_number'];
    doctorAdharCard = json['doctor_adhar_card'];
    doctorAdharCardBack = json['doctor_adhar_card_back'];
    panCardNumber = json['pan_card_number'];
    doctorPanCard = json['doctor_pan_card'];
    passportBack = json['passport_back'];
    passportFront = json['passport_front'];
    passportNumber = json['passport_number'];
    voterIdCardBack = json['voter_id_card_back'];
    voterIdCardFront = json['voter_id_card_front'];
    voterIdCardNumber = json['voter_id_card_number'];
    drivingLicenseBack = json['driving_license_back'];
    drivingLicenseFront = json['driving_license_front'];
    drivingLicenseNumber = json['driving_license_number'];
    doctorDocumentNo = json['doctor_document_no'];
    doctorDegreeCertificatePath = json['doctor_degree_certificate_path'];
    doctorPracticeCertificatePath = json['doctor_practice_certificate_path'];
    isAcceptDeclaration = json['is_accept_declaration'];
    isHaveGst = json['is_have_gst'];
    gstNumber = json['gst_number'];
    doctorGstCertificatePath = json['doctor_gst_certificate_path'];
    doctorVendorAgreement = json['doctor_vendor_agreement'];
    doctorVendorSignature = json['doctor_vendor_signature'];
    doctorCancelCheque = json['doctor_cancel_cheque'];
    doctorStatus = json['doctor_status'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    ipAddress = json['ip_address'];
    doctorDesc = json['doctor_desc'];
    doctorStartTime = json['doctor_start_time'];
    doctorEndTime = json['doctor_end_time'];
    doctorSessionDurationMinute = json['doctor_session_duration_minute'];
    doctorVideoCharge = json['doctor_video_charge'];
    doctorAudioCharge = json['doctor_audio_charge'];
    otp = json['otp'];
    otpDatetime = json['otp_datetime'];
    isOtpVerified = json['is_otp_verified'];
    degreeCollegeName = json['degree_college_name'];
    degreeName = json['degree_name'];
    degreeYear = json['degree_year'];
    practiceNo = json['practice_no'];
    doctorSerialNumber = json['doctor_serial_number'];
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
    doctorCategoryName = json['doctor_category_name'];
    if (json['expertize'] != null) {
      expertize = <Expertize>[];
      json['expertize'].forEach((v) {
        expertize!.add(Expertize.fromJson(v));
      });
    }
    if (json['Speciliaztion'] != null) {
      speciliaztion = <Speciliaztion>[];
      json['Speciliaztion'].forEach((v) {
        speciliaztion!.add(Speciliaztion.fromJson(v));
      });
    }
    if (json['treatment_approch'] != null) {
      treatmentApproch = <TreatmentApproch>[];
      json['treatment_approch'].forEach((v) {
        treatmentApproch!.add(TreatmentApproch.fromJson(v));
      });
    }
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
    data['aadhar_number'] = aadharNumber;
    data['doctor_adhar_card'] = doctorAdharCard;
    data['doctor_adhar_card_back'] = doctorAdharCardBack;
    data['pan_card_number'] = panCardNumber;
    data['doctor_pan_card'] = doctorPanCard;
    data['passport_back'] = passportBack;
    data['passport_front'] = passportFront;
    data['passport_number'] = passportNumber;
    data['voter_id_card_back'] = voterIdCardBack;
    data['voter_id_card_front'] = voterIdCardFront;
    data['voter_id_card_number'] = voterIdCardNumber;
    data['driving_license_back'] = drivingLicenseBack;
    data['driving_license_front'] = drivingLicenseFront;
    data['driving_license_number'] = drivingLicenseNumber;
    data['doctor_document_no'] = doctorDocumentNo;
    data['doctor_degree_certificate_path'] = doctorDegreeCertificatePath;
    data['doctor_practice_certificate_path'] = doctorPracticeCertificatePath;
    data['is_accept_declaration'] = isAcceptDeclaration;
    data['is_have_gst'] = isHaveGst;
    data['gst_number'] = gstNumber;
    data['doctor_gst_certificate_path'] = doctorGstCertificatePath;
    data['doctor_vendor_agreement'] = doctorVendorAgreement;
    data['doctor_vendor_signature'] = doctorVendorSignature;
    data['doctor_cancel_cheque'] = doctorCancelCheque;
    data['doctor_status'] = doctorStatus;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['ip_address'] = ipAddress;
    data['doctor_desc'] = doctorDesc;
    data['doctor_start_time'] = doctorStartTime;
    data['doctor_end_time'] = doctorEndTime;
    data['doctor_session_duration_minute'] = doctorSessionDurationMinute;
    data['doctor_video_charge'] = doctorVideoCharge;
    data['doctor_audio_charge'] = doctorAudioCharge;
    data['otp'] = otp;
    data['otp_datetime'] = otpDatetime;
    data['is_otp_verified'] = isOtpVerified;
    data['degree_college_name'] = degreeCollegeName;
    data['degree_name'] = degreeName;
    data['degree_year'] = degreeYear;
    data['practice_no'] = practiceNo;
    data['doctor_serial_number'] = doctorSerialNumber;
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
    data['doctor_category_name'] = doctorCategoryName;
    if (expertize != null) {
      data['expertize'] = expertize!.map((v) => v.toJson()).toList();
    }
    if (speciliaztion != null) {
      data['Speciliaztion'] = speciliaztion!.map((v) => v.toJson()).toList();
    }
    if (treatmentApproch != null) {
      data['treatment_approch'] =
          treatmentApproch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expertize {
  String? expertize;

  Expertize({this.expertize});

  Expertize.fromJson(Map<String, dynamic> json) {
    expertize = json['expertize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expertize'] = expertize;
    return data;
  }
}

class Speciliaztion {
  String? speciliaztion;

  Speciliaztion({this.speciliaztion});

  Speciliaztion.fromJson(Map<String, dynamic> json) {
    speciliaztion = json['Speciliaztion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Speciliaztion'] = speciliaztion;
    return data;
  }
}

class TreatmentApproch {
  String? treatmentApproch;

  TreatmentApproch({this.treatmentApproch});

  TreatmentApproch.fromJson(Map<String, dynamic> json) {
    treatmentApproch = json['treatment_approch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['treatment_approch'] = treatmentApproch;
    return data;
  }
}
