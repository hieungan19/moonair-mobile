import 'package:flutter/material.dart';
import 'package:moonair/modules/detail/widgets/booking_widget.dart';
import 'package:moonair/modules/detail/widgets/booked_widget.dart';
import 'package:moonair/modules/detail/screen/booking_detail.dart';
import 'package:moonair/modules/detail/screen/booked_detail.dart';
import 'package:moonair/modules/detail/screen/booked_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MyBookedInfo();
  }
}
