import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/views/routes/navigation_pages.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';

Future<void> main() async {
  await initServices();
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
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('bg1.webp'), context);
    precacheImage(const AssetImage('bg.png'), context);
    precacheImage(const AssetImage('logo_nf.png'), context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      onUnknownRoute: (settings) {
        Get.offAndToNamed(NavigationRoutes.splashRoute);
      },
      initialRoute: NavigationRoutes.inductionsHomeRoute,
      getPages: NavigationPages.getPages(),
    );
  }
}
