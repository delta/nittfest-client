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
  await Get.putAsync(() => StorageServices().initStorage());
}

class NITTFEST extends StatelessWidget {
  const NITTFEST({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: NavigationRoutes.homeRoute,
        getPages: NavigationPages.getPages(),
      );
}
