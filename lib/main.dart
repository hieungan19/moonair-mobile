import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/routes/app_page.dart';
import 'package:moonair/routes/app_route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
  await dotenv.load(fileName: ".env");
  print(dotenv.env['API_URL']);
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AppState createState() => AppState();
}

class AppState extends State<App> {
  late String initialRoute = AppRoutes.welcomePage;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: EasyLoading.init(),
    );
  }
}
