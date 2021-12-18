import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nittfest/views/pages/inductions/inductions_page.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';
import 'package:nittfest/bindings/inductions_binding.dart';
import 'package:nittfest/bindings/splash_binding.dart';
import 'package:nittfest/views/pages/splash/splash_page.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.splashRoute,
          page: () => const SplashPage(),
          binding: SplashBindings(),
        ),
        GetPage(
          name: NavigationRoutes.inductionsRoute,
          page: () => InductionsPage(),
          binding: InductionsBindings(),
        ),
      ];
}
