import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(NITTFEST(
        loginStatus: Get.find<StorageServices>().retriveJWT() != null,
      )));
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageServices().initStorage());
  await Get.putAsync(() => ApiServices().initApi());
  await Get.putAsync(() => NotificationServices().initialize());
}

class NITTFEST extends StatelessWidget {
  final bool loginStatus;
  const NITTFEST({Key? key, required this.loginStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        initialRoute:
            loginStatus ? NavigationRoutes.main : NavigationRoutes.authRoute,
        getPages: NavigationPages.getPages(),
      );
}
