mixin Apis {
  // static String baseUrl = 'https://vvexim.com/api/';
  // static String baseUrl = 'https://myndro.com/api/';
  static String baseUrl = 'http://myndro.com/api/';

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
  static const String assessmentQuestion = 'assement_question';
  static const String postMndroLocker = 'create_patient_locker';
  static const String listPatientDocuments = 'list_patient_documents';
  static const String expertSignupCategory = 'expert_signup_category1';
  static const String expertSignupSubCategory = 'expert_signup_sub_category';
  static const String expertSigninCode = 'expert_signin_code';

  // static const String expertSignupFinalCode = 'signup_expert_final_code';
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

  static const String expertAppointmentList = 'expert_appointment_list';
  static const String patientAppointmentList = 'patient_appointment_list';
  static const String expertCreatePackage = 'create_package';
  static const String expertPackageList = 'packages_list';

  static const String sendChatFromExpert = 'send_chatFromExpert';
  static const String sendChatFromPatient = 'send_chatFromPatient';
  static const String fetchExpertMsg = 'FetchMessagesByAppointmentFromExpert';
  static const String fetchPatientMsg = 'FetchMessagesByAppointmentFromPatient';
}
