import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/views/routes/navigation_pages.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  await initServices();
  setPathUrlStrategy();
  runApp(const NITTFEST());
}

Future<void> initServices() async {
  //print('starting services ...');

  await Get.putAsync(() => StorageServices().initStorage());
  //print('All services started...');
}

class NITTFEST extends StatelessWidget {
  const NITTFEST({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onUnknownRoute: (settings) {
          Get.offAndToNamed(NavigationRoutes.inductionsHomeRoute);
        },
        theme: ThemeData.dark(),
        initialRoute: NavigationRoutes.inductionsHomeRoute,
        getPages: NavigationPages.getPages(),
      );
}
