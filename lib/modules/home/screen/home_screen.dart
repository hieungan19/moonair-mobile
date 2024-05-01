import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moonair/modules/home/home_controller.dart';
import '../../../core/app_themes.dart';
import '../../../core/app_colors.dart';
import '../widget/small_avatar.dart';
import '../widget/istransit_button.dart';
import '../widget/home_textfield.dart';
import '../widget/select_time.dart';
import '../../../global_widgets/bottom_navbar.dart';
import '../../../global_widgets/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _controller = Get.find();
  final fromcontroller = TextEditingController();
  final tocontroller = TextEditingController();
  final passengetnumber = TextEditingController();
  final String initialDate = DateTime.now().toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Avatar(
                          avtimage: 'lib/assets/images/avt.png',
                          size: 50,
                        ),
                        IconButton(
                            onPressed: _controller.navigateToChatbotScreen,
                            icon: Image.asset('lib/assets/icons/chat_bot.png'))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Bạn muốn đi đâu',
                      style: CustomTextStyle.h2(AppColors.whitetext),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 5, left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IsTransitButton(
                                    name: 'Một chiều',
                                    prefixIcon: ImageIcon(
                                      AssetImage(
                                          'lib/assets/icons/right_arrow.png'),
                                    )),
                                IsTransitButton(
                                    name: 'Khứ hồi',
                                    prefixIcon: ImageIcon(
                                      AssetImage(
                                          'lib/assets/icons/swap_arrow.png'),
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Xuất phát',
                            style: CustomTextStyle.p1bold(AppColors.blacktext),
                          ),
                          HomeTextField(
                            controller: fromcontroller,
                            hintText: 'Xuất phát từ',
                            obscureText: false,
                            prefixIcon: const ImageIcon(
                                AssetImage('lib/assets/icons/flight_from.png')),
                          ),
                          const SizedBox(height: 10),
                          Text('Đến',
                              style:
                                  CustomTextStyle.p1bold(AppColors.blacktext)),
                          HomeTextField(
                            controller: tocontroller,
                            hintText: 'Đến nơi..',
                            obscureText: false,
                            prefixIcon: const ImageIcon(
                              AssetImage('lib/assets/icons/flight_to.png'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Thời gian',
                              style:
                                  CustomTextStyle.p1bold(AppColors.blacktext)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DateContainer(
                                  title: 'Ngày khởi hành',
                                  initialDate: initialDate),
                              DateContainer(
                                  title: 'Ngày trở lại',
                                  initialDate: initialDate),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Số hàng khách',
                            style: CustomTextStyle.p1bold(AppColors.blacktext),
                          ),
                          HomeTextField(
                            controller: passengetnumber,
                            hintText: '1 người',
                            obscureText: false,
                            prefixIcon: const ImageIcon(
                              AssetImage('lib/assets/icons/people.png'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          AppButton(
                              buttonText: 'Tìm kiếm', onPressedFunction: () {})
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
