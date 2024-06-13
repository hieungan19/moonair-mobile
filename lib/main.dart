import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/core/values/api_url.dart';
import 'package:moonair/data/models/rule.dart';
import 'package:moonair/data/models/user.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/data/services/http_service.dart';
import 'package:moonair/routes/app_page.dart';
import 'package:moonair/routes/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> fetchRule() async {
  try {
    final response = await HttpService.getRequest(UrlValue.rule);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data['status'] == 'success') {
        var docs = data['doc'] as List;
        DataCenter.rule = Rule.fromJson(docs[0]);
      }
    } else {
      print('Failed to load rule');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyC8zIEbwJxt-dHEF5dpdi9mITS9_Wv84BA',
    appId: '1:412684218203:android:54751155c76dc807ae747e',
    messagingSenderId: '412684218203',
    projectId: 'moonair-d6aa6',
  ));
  Stripe.publishableKey = dotenv.env["STRIPE_PUBLISH_KEY"]!;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final token = await getToken();
  DataCenter.token = token;

  if (token != null) {
    var response = await HttpService.getRequest(UrlValue.userInfo);
    var data = jsonDecode(response.body);
    DataCenter.user = UserModel.fromJson(data["data"]);
    DataCenter.user?.printUserInfo();
  }

  await fetchRule();
  runApp(App(
      initialRoute: token == null ? AppRoutes.welcomePage : AppRoutes.base));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class App extends StatefulWidget {
  final String initialRoute;
  const App({super.key, required this.initialRoute});

  @override
  // ignore: library_private_types_in_public_api
  AppState createState() => AppState();
}

// Hàm lấy token từ bộ nhớ
Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: widget.initialRoute,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: EasyLoading.init(),
    );
  }
}
