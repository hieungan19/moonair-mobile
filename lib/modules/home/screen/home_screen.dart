import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/data/models/airport.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/modules/home/home_controller.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';
import '../../../global_widgets/bottom_navbar.dart';
import '../../../global_widgets/button.dart';
import '../widget/home_textfield.dart';
import '../widget/istransit_button.dart';
import '../widget/select_time.dart';
import '../widget/small_avatar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _controller = Get.find();
  final fromcontroller = TextEditingController();
  final tocontroller = TextEditingController();

  void updateSelectedDate(String date, String title) {
    if (title == 'Ngày khởi hành') {
      _controller.departureDate.value = date;
    } else if (title == 'Ngày trở lại') {
      _controller.returnDate.value = date;
    }
  }

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
                        Avatar(
                          avtimage: DataCenter.user?.photo,
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
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 5, left: 20, right: 20),
                              child: Obx(
                                () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: // Trong phần build của widget cha
                                      [
                                    IsTransitButton(
                                      name: 'Một chiều',
                                      prefixIcon: const ImageIcon(
                                        AssetImage(
                                            'lib/assets/icons/right_arrow.png'),
                                      ),
                                      isSelected:
                                          !_controller.isReturnFlight.value,
                                      onTap: () {
                                        _controller.isReturnFlight.value =
                                            false;
                                      },
                                    ),
                                    IsTransitButton(
                                      name: 'Khứ hồi',
                                      prefixIcon: const ImageIcon(
                                        AssetImage(
                                            'lib/assets/icons/swap_arrow.png'),
                                      ),
                                      isSelected:
                                          _controller.isReturnFlight.value,
                                      onTap: () {
                                        _controller.isReturnFlight.value = true;
                                      },
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 10),
                          Text(
                            'Xuất phát',
                            style: CustomTextStyle.p1bold(AppColors.blacktext),
                          ),
                          Autocomplete<Airport>(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              if (textEditingValue.text.isEmpty) {
                                return const Iterable<Airport>.empty();
                              }
                              return _controller.airports
                                  .where((Airport airport) {
                                return airport.name.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase()) ||
                                    airport.city.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase());
                              });
                            },
                            onSelected: (Airport selection) {
                              fromcontroller.text =
                                  '${selection.name} - ${selection.city} ';
                              _controller.fromAirportId = selection.id;
                            },
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController
                                    fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              return TextField(
                                controller: fieldTextEditingController,
                                focusNode: fieldFocusNode,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.grey2),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primary),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fillColor: AppColors.white,
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: AppColors.info),
                                  hintText: 'Xuất phát từ',
                                  prefixIcon: const ImageIcon(AssetImage(
                                      'lib/assets/icons/flight_from.png')),
                                ),
                              );
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<Airport> onSelected,
                                Iterable<Airport> options) {
                              return Material(
                                elevation: 4.0,
                                child: SizedBox(
                                  height: 150.0,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: options.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final airport = options.elementAt(index);
                                      return GestureDetector(
                                        onTap: () {
                                          onSelected(airport);
                                        },
                                        child: ListTile(
                                          title: Text(
                                              '${airport.name} - ${airport.city}'),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          Text('Đến',
                              style:
                                  CustomTextStyle.p1bold(AppColors.blacktext)),
                          Autocomplete<Airport>(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              if (textEditingValue.text.isEmpty) {
                                return const Iterable<Airport>.empty();
                              }
                              return _controller.airports
                                  .where((Airport airport) {
                                return airport.name.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase()) ||
                                    airport.city.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase());
                              });
                            },
                            onSelected: (Airport selection) {
                              fromcontroller.text =
                                  '${selection.name} - ${selection.city} ';
                              _controller.toAirportId = selection.id;
                            },
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController
                                    fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              return TextField(
                                controller: fieldTextEditingController,
                                focusNode: fieldFocusNode,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.grey2),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primary),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fillColor: AppColors.white,
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: AppColors.info),
                                  hintText: 'Đến nơi',
                                  prefixIcon: const ImageIcon(AssetImage(
                                      'lib/assets/icons/flight_to.png')),
                                ),
                              );
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<Airport> onSelected,
                                Iterable<Airport> options) {
                              return Material(
                                elevation: 4.0,
                                child: SizedBox(
                                  height: 150.0,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: options.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final airport = options.elementAt(index);
                                      return GestureDetector(
                                        onTap: () {
                                          onSelected(airport);
                                        },
                                        child: ListTile(
                                          title: Text(
                                              '${airport.name} - ${airport.city}'),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
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
                                initialDate: _controller.departureDate,
                                onSelectDate: (date) {
                                  updateSelectedDate(date, 'Ngày khởi hành');
                                },
                              ),
                              Obx(
                                () => _controller.isReturnFlight.value == false
                                    ? SizedBox()
                                    : DateContainer(
                                        title: 'Ngày trở lại',
                                        initialDate: _controller.returnDate,
                                        onSelectDate: (date) {
                                          updateSelectedDate(
                                              date, 'Ngày trở lại');
                                        },
                                      ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Số hành khách',
                            style: CustomTextStyle.p1bold(AppColors.blacktext),
                          ),
                          HomeTextField(
                            keyboardType: TextInputType.number,
                            controller: _controller.seat,
                            hintText: '1 người',
                            obscureText: false,
                            prefixIcon: const ImageIcon(
                              AssetImage('lib/assets/icons/people.png'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          AppButton(
                              buttonText: 'Tìm kiếm',
                              onPressedFunction:
                                  _controller.navigateToSearchTicketPage)
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
