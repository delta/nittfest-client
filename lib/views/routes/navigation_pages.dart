import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:nittfest/bindings/forms_binding.dart';
import 'package:nittfest/views/pages/forms/forms_page.dart';
import 'package:nittfest/views/pages/home/home_page.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';
import 'package:nittfest/bindings/home_binding.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.inductionsHomeRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.inductionsFormsRoute,
          page: () => const FormsPage(),
          binding: FormsBindings(),
        ),
        GetPage(
          name: NavigationRoutes.preferencesRoute,
          page: () => const FormsPage(),
          binding: FormsBindings(),
        ),
      ];
}
