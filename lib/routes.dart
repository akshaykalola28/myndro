import 'package:get/get.dart';
import 'binding/binding.dart';
import 'screens/screens.dart';

final List<GetPage> appPages = [
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
];
