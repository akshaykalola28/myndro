mixin Apis {
  // static String baseUrl = 'https://vvexim.com/api/';
  // static String baseUrl = 'https://myndro.com/api/';
  static String baseUrl = 'https://myndro.com/api/';
  static String webViewUrl = 'https://myndro.com/';
  static String imageUrl =
      'https://myndro.com/front_theme/images/question_cate/';

  // static String baseUrl = 'http://mynd.thepackaginghouse.in/api/';
  static String baseUrl1 = 'https://scrapbazar.in/mynd.manzanotech.com/api/';

  static const String countryList = 'country_list';
  static const String userOtp = 'user_otp';
  static const String verifyOtp = 'verify_otp';
  static const String resendOtp = 'resend_otp';
  static const String addPatient = 'add_patient';
  static const String stateList = 'state_list';
  static const String cityList = 'city_list';
  static const String patientLogin = 'patient_login';

  static const String postMndroLocker = 'create_patient_locker';
  static const String listPatientDocuments = 'list_patient_documents';
  static const String expertSignupCategory = 'expert_signup_category1';
  static const String expertSignupSubCategory = 'expert_signup_sub_category';
  static const String expertSigninCode = 'expert_signin_code';

  static const String expertSignupProfile = 'signup_expert_profile';
  static const String expertSignupDegreeCode = 'signup_expert_degree_code';
  static const String expertSignupBankCode = 'signup_expert_bank_code';
  static const String expertSignupGstCode = 'signup_expert_gst_code';
  static const String expertSignupKyc = 'signup_expert_kyc_code';

  static const String addMoneyInWallet = 'addMoneyInWallet';
  static const String allDrList = 'all_doctors_list';
  static const String searchKeyword = 'search_keywords_list';
  static const String walletTransactions = 'walletTransationListAndAmount';
  static const String drSlotsList = 'doctor_slot_list';
  static const String saveDrSlots = 'save_doctor_slots_data';
  static const String createAppointment = 'create_appointment';
  static const String instantConnectAppointment = 'instant_connect_appointment';

  static const String expertAppointmentList = 'expert_appointment_list';
  static const String patientAppointmentList = 'patient_appointment_list';

  static const String expertCreatePackage = 'create_package';
  static const String expertPackageList = 'doctor_package_list_by_doctor_id';

  static const String createDrNotes = 'create_doctor_notes';
  static const String shareDrNotes = 'share_notes_by_doctor';
  static const String notesByAppoId =
      'doctor_notes_list_for_patient_appointmentID';
  static const String notesByPatientId = 'doctor_notes_list_ByPatientID';

  static const String sendChatFromExpert = 'send_chatFromExpert';
  static const String sendChatFromPatient = 'send_chatFromPatient';
  static const String fetchExpertMsg = 'FetchMessagesByAppointmentFromExpert';
  static const String fetchPatientMsg = 'FetchMessagesByAppointmentFromPatient';

  static const String updateMandata = 'update_expert_mandatory_data';
  static const String updateNonMandata = 'update_profile_non_mandatory';
  static const String serviceExpertise = 'service_expertise';
  static const String serviceTreatmentApproach = 'service_treatment_approach';
  static const String serviceSpecialization = 'service_specializations';
  static const String startMeetByDr = 'start_meeting_by_doctor';
  static const String changeExpertProfile = 'changeExpertProfileImage';

  static const String createPrescExpert = 'create_prescription_expert';
  static const String prescByAppoId = 'list_prescription_by_AppointmentID';
  static const String prescByPatientId = 'list_prescription';
  static const String prescDetailsByPresId = 'list_prescription_details';

  static const String assesmentCategory = 'assesments_category_list';
  static const String assessmentQuestion = 'assement_question_category_id';

  static const String sendForgotPassOtp = 'send_forgot_password_OTP';
  static const String checkForgotPassOtp =
      'check_OTP_entered_By_User_forgot_password';
  static const String updateForgotPass = 'update_password_forgot_password';

  static const String packagesList = 'packages_list';

  static const String expertToPatientReport = 'expert_to_patients_report';
  static const String myndroToExpertReport = 'myndro_to_experts_report';

  static const String doctorProfileById = 'doctor_profile_doctor_id ';
  static const String trainingCerti = 'change_Training_Certificate ';
  static const String awardCerti = 'change_Award_Certificate ';
  static const String workExpCerti = 'change_Work_Experince_Certificate ';

  static const String patientChangePassword = 'patient_change_password';
  static const String patientCheckLogin = 'patient_check_login_and_send_otp';
  static const String patientOtpVerificationForSetting =
      'last_step_verification_code';
}
