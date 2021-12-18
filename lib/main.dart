import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nittfest/views/routes/navigation_pages.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';

Future<void> main() async {
  runApp(const NITTFEST());
}

class NITTFEST extends StatelessWidget {
  const NITTFEST({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: NavigationRoutes.inductionsRoute,
        getPages: NavigationPages.getPages(),
      );
}
