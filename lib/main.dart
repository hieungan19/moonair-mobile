<<<<<<< HEAD
import 'dart:async';
=======
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:moonair/modules/authen/screens/login_screen.dart';
import 'package:moonair/modules/authen/screens/signup_sceen.dart';
import 'package:moonair/modules/authen/screens/welcom_screen.dart';
import 'package:moonair/modules/passenger/screens/passenger.dart';
import 'package:moonair/modules/popup-bought-ticket/popup-bought-ticket.dart';
>>>>>>> origin/feat/edit-profile
=======
import 'package:moonair/modules/detail/widgets/booking_widget.dart';
import 'package:moonair/modules/detail/widgets/booked_widget.dart';
import 'package:moonair/modules/detail/screen/booking_detail.dart';
import 'package:moonair/modules/detail/screen/booked_detail.dart';
import 'package:moonair/modules/detail/screen/booked_info.dart';
>>>>>>> origin/feat/detail

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/routes/app_page.dart';
import 'package:moonair/routes/app_route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

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

  runApp(const App());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class App extends StatefulWidget {
  const App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AppState createState() => AppState();
}

class AppState extends State<App> {
  late String initialRoute = AppRoutes.searchTicket;
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
<<<<<<< HEAD
=======

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Popup_Bought_Ticket();
=======
    return MyBookedInfo();
>>>>>>> origin/feat/detail
  }
}
>>>>>>> origin/feat/edit-profile
