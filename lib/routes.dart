import 'package:get/get.dart';
import 'binding/binding.dart';
import 'screens/screens.dart';

final List<GetPage> appPages = [
  GetPage(
      name: SplashScreen.pageId,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding()),
  GetPage(
      name: RegistrationScreen.pageId,
      page: () => RegistrationScreen(),
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
      page: () =>  EnterPhoneNumber(),
      binding: PhoneNumberBinding()),
  GetPage(
      name: YourCategory.pageId,
      page: () =>  const YourCategory(),
      binding: YourCategoryBinding()),
  GetPage(
      name: CreatePasswordScreen.pageId,
      page: () => const CreatePasswordScreen(),
      binding: NewPasswordBinding()),

  GetPage(
      name: ExpertRegistrationForm.pageId,
      page: () =>  const ExpertRegistrationForm(),
      binding: RegistrationBinding()),
  GetPage(
      name: OnBoardingScreen.pageId,
      page: () =>   OnBoardingScreen(),
      binding: OnBoardingBinding()),
];
