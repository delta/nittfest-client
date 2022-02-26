import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:nittfest/bindings/home_binding.dart';
import 'package:nittfest/views/home/home_page.dart';
import 'package:nittfest/routes/navigation_routes.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.homeRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
      ];
}
