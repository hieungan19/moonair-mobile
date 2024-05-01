// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:moonair/modules/noti/controllers/push_noti_controller.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   NotificationServices notificationServices = NotificationServices();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     notificationServices.requestNotificationPermission();
//     notificationServices.forgroundMessage();
//     notificationServices.firebaseInit(context);
//     notificationServices.setupInteractMessage(context);
//     notificationServices.isTokenRefresh();

//     notificationServices.getDeviceToken().then((value) {
//       if (kDebugMode) {
//         print('device token');
//         print(value);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Notifications'),
//       ),
//       body: Center(
//         child: TextButton(
//             onPressed: () async {
//               try {
//                 // Thực hiện yêu cầu POST
//                 var response = await http.post(
//                   Uri.parse('http://10.0.2.2:3001/api/v1/send-noti'),
//                   body: {
//                     'fcm_token':
//                         'ePWPqIXDSWmPPWkIC7itiI:APA91bHya2bjGfhiBpaVGxj9uy8I4Zf6p1HZ2-0QIXC7axarx7mYRjSdPQ-9vf_AZCqKXqBWdmY2CiDia0Vnd1skuNI2sBxTX7EDDx7Fl94ao7Fmi1bpqI5rAIyiNVA-mIMQtBpFI8Ol',
//                   },
//                 );

//                 // Kiểm tra xem yêu cầu đã thành công hay không
//                 if (response.statusCode == 200) {
//                   // Xử lý kết quả khi yêu cầu thành công
//                   print('Notification sent successfully');
//                 } else {
//                   // Xử lý lỗi khi yêu cầu không thành công
//                   print('Failed to send notification');
//                 }
//               } catch (e) {
//                 // Xử lý các ngoại lệ khi có lỗi xảy ra trong quá trình gửi yêu cầu
//                 print('Error: $e');
//               }
//             },
//             child: Text('Send Notifications')),
//       ),
//     );
//   }
// }
