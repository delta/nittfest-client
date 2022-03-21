import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/services/api_services.dart';
import 'package:nittfest/services/notification_services.dart';
import 'package:nittfest/services/storage_services.dart';
import 'package:nittfest/config/navigations.dart';
import 'package:nittfest/constants/navigation_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const NITTFEST());
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageServices().initStorage());
  await Get.putAsync(() => ApiServices().initApi());
  await Get.putAsync(() => NotificationServices().initialize());
}

class NITTFEST extends StatelessWidget {
  const NITTFEST({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        initialRoute: NavigationRoutes.main,
        getPages: NavigationPages.getPages(),
      );
}
