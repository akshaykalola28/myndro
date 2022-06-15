import 'package:get/get.dart';
import 'package:myndro/binding/home_binding.dart';
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
      page: () => const VerificationCodeScreen(),
      binding: RegistrationBinding()),
  GetPage(
      name: DashboardScreen.pageId,
      page: () => DashboardScreen(),
      binding: DashboardBinding()),
  GetPage(
      name: HomeScreen.pageId,
      page: () => const HomeScreen(),
      binding: HomeBinding()),
];
