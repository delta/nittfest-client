import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:nittfest/bindings/events_binding.dart';
import 'package:nittfest/bindings/home_binding.dart';
import 'package:nittfest/bindings/login_binding.dart';
import 'package:nittfest/views/eventspage/events_page.dart';
import 'package:nittfest/views/home/home_page.dart';
import 'package:nittfest/routes/navigation_routes.dart';
import 'package:nittfest/views/login/login_page.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.homeRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.loginRoute,
          page: () => const LoginPage(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: NavigationRoutes.eventsRoute,
          page: () => const EventsPage(),
          binding: EventsBindings(),
        ),
      ];
}
