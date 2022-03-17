import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nittfest/bindings/auth_binding.dart';
import 'package:nittfest/bindings/home_bindings.dart';
import 'package:nittfest/bindings/splash_binding.dart';
import 'package:nittfest/views/auth.dart';
import 'package:nittfest/views/home.dart';
import 'package:nittfest/views/splash.dart';
import 'package:nittfest/constants/navigation_routes.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.main,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.authRoute,
          page: () => const AuthPage(),
          binding: AuthBindings(),
        ),
        GetPage(
          name: NavigationRoutes.splashRoute,
          page: () => const SplashPage(),
          binding: SplashBindings(),
        ),
      ];
}
