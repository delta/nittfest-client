import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/routes/navigation_pages.dart';
import 'package:nittfest/routes/navigation_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const NITTFEST());
}

Future<void> initServices() async {
  await Firebase.initializeApp();
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
