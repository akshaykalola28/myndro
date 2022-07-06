import 'package:get/get.dart';
import 'binding/binding.dart';
import 'screens/screens.dart';

final List<GetPage> appPages = [
  GetPage(
      name: SplashScreen.pageId,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding()),
  GetPage(
      name: UserRegistration.pageId,
      page: () => const UserRegistration(),
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
      page: () => EnterPhoneNumber(),
      binding: PhoneNumberBinding()),
  GetPage(
      name: YourCategory.pageId,
      page: () => const YourCategory(),
      binding: YourCategoryBinding()),
  GetPage(
      name: PsycologistDropdown.pageId,
      page: () => const PsycologistDropdown(),
      binding: YourCategoryBinding()),
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
      page: () => DashboardScreen(),
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
      binding: AssessmentBinding()),
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
];
