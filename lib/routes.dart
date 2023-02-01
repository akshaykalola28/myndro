import 'package:get/get.dart';
import 'package:myndro/binding/patient_prescription_binding.dart';

import 'binding/binding.dart';
import 'screens/screens.dart';

final List<GetPage> appPages = [
  GetPage(
      name: SplashScreen.pageId,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding()),
  GetPage(
      name: UserRegistration.pageId,
      page: () => UserRegistration(),
      binding: RegistrationBinding()),
  GetPage(
      name: LoginScreen.pageId,
      page: () => const LoginScreen(),
      binding: LoginBinding()),
  GetPage(
      name: ForgotPasswordScreen.pageId,
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordBinding()),
  GetPage(
      name: EnterPhoneNumber.pageId,
      page: () => const EnterPhoneNumber(),
      binding: PhoneNumberBinding()),
  GetPage(
      name: YourCategory.pageId,
      page: () => const YourCategory(),
      binding: YourCategoryBinding()),
  GetPage(
      name: PsycologistDropdown.pageId,
      page: () => const PsycologistDropdown(),
      binding: PsycologistDropdownBinding()),
  GetPage(
      name: SelectExpertise.pageId,
      page: () => const SelectExpertise(),
      binding: YourCategoryBinding()),
  GetPage(
      name: CreatePasswordScreen.pageId,
      page: () => const CreatePasswordScreen(),
      binding: NewPasswordBinding()),
  GetPage(
      name: ExpertRegistrationForm.pageId,
      page: () => const ExpertRegistrationForm(),
      binding: RegistrationBinding()),
  GetPage(
      name: CongAdminApproval.pageId,
      page: () => const CongAdminApproval(),
      binding: RegistrationBinding()),
  GetPage(
      name: OnBoardingScreen.pageId,
      page: () => OnBoardingScreen(),
      binding: OnBoardingBinding()),
  GetPage(
      name: VerificationCodeScreen.pageId,
      page: () => VerificationCodeScreen(),
      binding: RegistrationBinding()),
  GetPage(
      name: DashboardScreen.pageId,
      page: () => const DashboardScreen(),
      binding: DashboardBinding()),
  GetPage(
      name: HomeScreen.pageId,
      page: () => const HomeScreen(),
      binding: HomeBinding()),
  GetPage(
      name: ExpertDetailScreen.pageId,
      page: () => const ExpertDetailScreen(),
      binding: ExpertDetailBinding()),
  GetPage(
      name: AssessmentScreen.pageId,
      page: () => const AssessmentScreen(),
      binding: AssessmentBinding()),
  GetPage(
      name: AssessmentStartScreen.pageId,
      page: () => const AssessmentStartScreen(),
      binding: AssessmentBinding()),
  GetPage(
      name: AssessmentEndScreen.pageId,
      page: () => AssessmentEndScreen(),
      binding: AssessmentBinding()),
  GetPage(
      name: AllAssessmentsNav.pageId,
      page: () => const AllAssessmentsNav(),
      binding: AssessmentCatBinding()),
  GetPage(
      name: WalletScreen.pageId,
      page: () => const WalletScreen(),
      binding: WalletBinding()),
  GetPage(
      name: SettingScreen.pageId,
      page: () => SettingScreen(),
      binding: SettingBinding()),
  GetPage(
      name: TwoStepVerification.pageId,
      page: () => TwoStepVerification(),
      binding: SettingBinding()),
  GetPage(
      name: SearchScreen.pageId,
      page: () => SearchScreen(),
      binding: HomeBinding()),
  GetPage(
      name: UpcomingAppointments.pageId,
      page: () => const UpcomingAppointments(),
      binding: HomeBinding()),
  GetPage(
      name: AskUSScreen.pageId,
      page: () => const AskUSScreen(),
      binding: AskUsBinding()),
  GetPage(
      name: DoctorNotesScreen.pageId,
      page: () => const DoctorNotesScreen(),
      binding: DoctorNotesBinding()),
  GetPage(
      name: DoctorNotesDetail.pageId,
      page: () => const DoctorNotesDetail(),
      binding: DoctorNotesBinding()),
  GetPage(
      name: PrescriptionScreen.pageId,
      page: () => const PrescriptionScreen(),
      binding: PrescriptionDetailBinding()),
  GetPage(
      name: PrescriptionListScreen.pageId,
      page: () => const PrescriptionListScreen(),
      binding: DoctorNotesBinding()),
  GetPage(
      name: OffersScreen.pageId,
      page: () => OffersScreen(),
      binding: OffersBinding()),
  GetPage(
      name: MyndroLockerScreen.pageId,
      page: () => MyndroLockerScreen(),
      binding: MyndroLockerBinding()),
  GetPage(
      name: MyndroDocumentScreen.pageId,
      page: () => const MyndroDocumentScreen(),
      binding: MyndroLockerBinding()),
  GetPage(
      name: PackagesScreen.pageId,
      page: () => const PackagesScreen(),
      binding: PackagesBinding()),
  GetPage(
      name: PackagesFormScreen.pageId,
      page: () => const PackagesFormScreen(),
      binding: PackagesBinding()),
  GetPage(
      name: PackagesDetailScreen.pageId,
      page: () => PackagesDetailScreen(),
      binding: PackagesBinding()),
  GetPage(
      name: ExpertHome.pageId,
      page: () => const ExpertHome(),
      binding: ExpertHomeBinding()),
  GetPage(
      name: ExpertAppointment.pageId,
      page: () => const ExpertAppointment(),
      binding: ExpertAppointmentBinding()),
  GetPage(
      name: ExpertTodayAppointment.pageId,
      page: () => const ExpertTodayAppointment(),
      binding: ExpertTodayAppoBinidng()),
  GetPage(
      name: ExpertMessages.pageId,
      page: () => const ExpertMessages(),
      binding: ExpertMessagesBinding()),
  GetPage(
      name: ExpertPackages.pageId,
      page: () => const ExpertPackages(),
      binding: ExpertPackagesBinding()),
  GetPage(
      name: ExpertPackagesList.pageId,
      page: () => const ExpertPackagesList(),
      binding: ExpertPackagesBinding()),
  GetPage(
      name: ExpertReports.pageId,
      page: () => const ExpertReports(),
      binding: ExpertReportsBinding()),
  GetPage(
      name: ExpertCalender.pageId,
      page: () => const ExpertCalender(),
      binding: ExpertCalenderBinding()),
  GetPage(
      name: ExpertAllPatients.pageId,
      page: () => const ExpertAllPatients(),
      binding: ExpertPatientInfoBinding()),
  GetPage(
      name: ExpertPatientDetail.pageId,
      page: () => const ExpertPatientDetail(),
      binding: ExpertPatientInfoBinding()),
  GetPage(
      name: ExpertPatientNotes.pageId,
      page: () => const ExpertPatientNotes(),
      binding: ExpertPatientInfoBinding()),
  GetPage(
      name: ExpertPatientReports.pageId,
      page: () => const ExpertPatientReports(),
      binding: ExpertPatientInfoBinding()),
  GetPage(
      name: ExpertProfile.pageId,
      page: () => ExpertProfile(),
      binding: ExpertProfileBinding()),
  GetPage(
      name: ExpertProfileNonMandatory.pageId,
      page: () => const ExpertProfileNonMandatory(),
      binding: ExpertProfileBinding()),
  GetPage(
      name: EmployeeDocs.pageId,
      page: () => const EmployeeDocs(),
      binding: EmployeeDocsBinding()),
  GetPage(
      name: PatientAppoList.pageId,
      page: () => const PatientAppoList(),
      binding: PatientAppoListBinding()),
  GetPage(
      name: ExpertAppointmentList.pageId,
      page: () => const ExpertAppointmentList(),
      binding: ExpertAppoListBinding()),
  GetPage(
      name: CallScreen.pageId,
      page: () => const CallScreen(),
      binding: CallScreenBinding()),
  GetPage(
      name: WebViewScreen.pageId,
      page: () => const WebViewScreen(),
      binding: WebViewScreenBinding()),
];
