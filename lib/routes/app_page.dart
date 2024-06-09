import 'package:get/get.dart';
import 'package:moonair/modules/authen/authen_binding.dart';
import 'package:moonair/modules/authen/screens/forgot_password_screen.dart';
import 'package:moonair/modules/authen/screens/login_screen.dart';
import 'package:moonair/modules/authen/screens/reset_password_screen.dart';
import 'package:moonair/modules/authen/screens/signup_sceen.dart';
import 'package:moonair/modules/authen/screens/welcom_screen.dart';
import 'package:moonair/modules/base/base_binding.dart';
import 'package:moonair/modules/base/base_screen.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_binding.dart';
import 'package:moonair/modules/buy_ticket/screens/booked_detail.dart';
import 'package:moonair/modules/buy_ticket/screens/booked_info.dart';
import 'package:moonair/modules/buy_ticket/screens/booking_detail.dart';
import 'package:moonair/modules/buy_ticket/screens/passenger.dart';
import 'package:moonair/modules/buy_ticket/screens/search_ticket_screen.dart';
import 'package:moonair/modules/buy_ticket/screens/seat_booking.dart';
import 'package:moonair/modules/chatbot/screens/chat_bot_screen.dart';
import 'package:moonair/modules/edit-profile/edit_profile_binding.dart';
import 'package:moonair/modules/edit-profile/screens/profile.dart';
import 'package:moonair/modules/history/screens/history_ticket_screen.dart';
import 'package:moonair/modules/home/home_binding.dart';
import 'package:moonair/modules/home/screen/home_screen.dart';
import 'package:moonair/routes/app_route.dart';

import '../modules/edit-profile/screens/edit_profile.dart';

class AppPages {
  static final List<GetPage> pages = [
    //welcome
    GetPage(
      name: AppRoutes.welcomePage,
      page: () => WelcomScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
    //1. authen
    //login
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
    //signup
    GetPage(
      name: AppRoutes.signUpPage,
      page: () => SignUpScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
    //forgot password
    GetPage(
      name: AppRoutes.forgotPasswordPage,
      page: () => ForgotPasswordScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
    //reset password
    GetPage(
      name: AppRoutes.resetPasswordPage,
      page: () => PasswordResetScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),

    //chatbot
    GetPage(
      name: AppRoutes.chatbotPage,
      page: () => ChatbotScreen(),
      transition: Transition.cupertino,
    ),

    //2. Home
    //home

    GetPage(
      name: AppRoutes.base,
      page: () => BaseScreen(),
      transition: Transition.cupertino,
      binding: BaseBinding(),
    ),

    GetPage(
      name: AppRoutes.homePage,
      page: () => Home(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),

    //search ticket
    GetPage(
      name: AppRoutes.searchTicket,
      page: () => SearchTicket(),
      transition: Transition.cupertino,
      binding: BuyTicketBinding(),
    ),

    //3. Edit profile
    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfile(),
      transition: Transition.cupertino,
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => UserProfileScreen(),
      transition: Transition.cupertino,
      binding: EditProfileBinding(),
    ),

    // Buy ticket
    // Chọn chỗ ngồi
    GetPage(
      name: AppRoutes.seatBook,
      page: () => SeatBooking(),
      transition: Transition.cupertino,
      binding: BuyTicketBinding(),
    ),
    // Điền tên hành khách
    GetPage(
      name: AppRoutes.passenger,
      page: () => Passenger(),
      transition: Transition.cupertino,
      binding: BuyTicketBinding(),
    ),
    //Thanh toán
    GetPage(
      name: AppRoutes.invoice,
      page: () => MyBookingDetail(),
      transition: Transition.cupertino,
      binding: BuyTicketBinding(),
    ),
    //Sau khi thanh toán
    GetPage(
      name: AppRoutes.paidTickets,
      page: () => MyBookedInfo(),
      transition: Transition.cupertino,
      binding: BuyTicketBinding(),
    ),
    // Chi tiết từng vé
    GetPage(
      name: AppRoutes.ticketDetail,
      page: () => MyBookedDetail(),
      transition: Transition.cupertino,
      binding: BuyTicketBinding(),
    ),

    //history
    GetPage(
      name: AppRoutes.history,
      page: () => History(),
      transition: Transition.cupertino,
      binding: BuyTicketBinding(),
    ),

    //test payment
    //history
  ];
}
