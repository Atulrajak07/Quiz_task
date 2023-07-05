import 'package:earnest_task/core/routes.dart';
import 'package:earnest_task/feature/home/binding/home_binding.dart';
import 'package:earnest_task/feature/home/view/home_view.dart';
import 'package:earnest_task/feature/login/binding/login_binding.dart';
import 'package:earnest_task/feature/login/view/login_view.dart';
import 'package:earnest_task/feature/sign/binding/sign_binding.dart';
import 'package:earnest_task/feature/sign/view/sign_view.dart';
import 'package:get/get.dart';

import '../feature/splash/binding/splash_binding.dart';
import '../feature/splash/view/splash_view.dart';

List<GetPage> allpages = [
  GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
  ),

  GetPage(
    name: Routes.login,
    page: () => const LoginView(),
    binding: LoginBinding(),
  ),

  GetPage(
    name: Routes.sign,
    page: () => const SignView(),
    binding: SignBinding(),
  ),

  GetPage(
    name: Routes.home,
    page: () =>  HomeView(),
    binding: HomeBinding(),
  ),
];


