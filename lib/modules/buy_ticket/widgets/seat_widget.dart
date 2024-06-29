// import 'package:flutter/material.dart';
// import '../../../core/app_colors.dart';
// import '../../../core/app_themes.dart';

// class SeatWidget extends StatelessWidget {
//   const SeatWidget({
//     super.key,
//     required this.seatNumber,
//     this.onTap,
//     this.height = 55,
//     this.width = 55,
//     this.isSelected = false,
//     this.isAvailable = true,
//   });

//   final void Function()? onTap;
//   final String seatNumber;
//   final double width;
//   final double height;
//   final bool isSelected;
//   final bool isAvailable;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: isAvailable ? onTap : null,
//         child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//               color: isAvailable
//                   ? isSelected
//                       ? AppColors.tint1
//                       : AppColors.white
//                   : Colors.grey,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: isAvailable
//                     ? isSelected
//                         ? AppColors.tint1
//                         : AppColors.primary
//                     : AppColors.grey1,
//               )),
//           alignment: Alignment.center,
//           child: Text(
//             seatNumber,
//             style: CustomTextStyle.h3(AppColors.blacktext).copyWith(
//               color: isAvailable
//                   ? AppColors.blacktext
//                   : AppColors.blacktext.withOpacity(0.6),
//             ),
//           ),
//         ));
//   }
// }

// class SeatInfoWidget extends StatelessWidget {
//   const SeatInfoWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const SeatWidget(
//           seatNumber: "",
//           width: 24,
//           height: 24,
//           isAvailable: false,
//         ),
//         const SizedBox(width: 4),
//         Text(
//           "Đã chọn",
//           style: CustomTextStyle.p3bold(AppColors.whitetext),
//         ),
//         const SizedBox(width: 10),
//         const SeatWidget(
//           seatNumber: "",
//           width: 24,
//           height: 24,
//           isAvailable: true,
//           isSelected: true,
//         ),
//         const SizedBox(width: 4),
//         Text(
//           "Đang chọn",
//           style: CustomTextStyle.p3bold(AppColors.whitetext),
//         ),
//         const SizedBox(width: 10),
//         const SeatWidget(
//           seatNumber: "",
//           width: 24,
//           height: 24,
//           isAvailable: true,
//           isSelected: false,
//         ),
//         const SizedBox(width: 4),
//         Text(
//           "Có thể chọn",
//           style: CustomTextStyle.p3bold(AppColors.whitetext),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';

import '../../../core/app_colors.dart';

class SeatWidget extends StatefulWidget {
  const SeatWidget({
    Key? key,
    required this.seatNumber,
    this.onTap,
    this.height = 55,
    this.width = 55,
    this.isSelected = false,
    this.isAvailable = true,
  }) : super(key: key);

  final VoidCallback? onTap;
  final int seatNumber;
  final double width;
  final double height;
  final bool isSelected;
  final bool isAvailable;

  @override
  _SeatWidgetState createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  bool _isSelected = false;
  final BuyTicketController _buyTicketController = Get.find();
  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
          setState(() {
            _isSelected = !_isSelected;
          });
          if (_isSelected) {
            _buyTicketController.currentTicketClass.value!.chooseSeats
                ?.add(widget.seatNumber);
          } else {
            _buyTicketController.currentTicketClass.value!.chooseSeats
                ?.remove(widget.seatNumber);
          }
          _buyTicketController.currentChooseSeats.value = _buyTicketController
              .currentTicketClass.value!.chooseSeats!
              .join(',');

          List<int> chooseSeats =
              _buyTicketController.currentTicketClass.value!.chooseSeats ?? [];

          _buyTicketController.currentTotal.value = chooseSeats.length *
              _buyTicketController.currentTicketClass.value!.ratio *
              _buyTicketController.currentFlight.value!.price;
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.isAvailable
              ? _isSelected
                  ? AppColors.tint1
                  : AppColors.white
              : Colors.grey,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.isAvailable
                ? _isSelected
                    ? AppColors.tint1
                    : AppColors.primary
                : AppColors.grey1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.seatNumber > 0 ? widget.seatNumber.toString() : '',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: widget.isAvailable
                ? AppColors.blacktext
                : AppColors.blacktext.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}

class SeatInfoWidget extends StatelessWidget {
  const SeatInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SeatWidget(
          seatNumber: 0,
          width: 24,
          height: 24,
          isAvailable: false,
        ),
        SizedBox(width: 4),
        Text(
          'Đã chọn',
          style: TextStyle(color: AppColors.whitetext),
        ),
        SizedBox(width: 10),
        SeatWidget(
          seatNumber: 0,
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: true,
        ),
        SizedBox(width: 4),
        Text(
          'Đang chọn',
          style: TextStyle(color: AppColors.whitetext),
        ),
        SizedBox(width: 10),
        SeatWidget(
          seatNumber: 0,
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: false,
        ),
        SizedBox(width: 4),
        Text(
          'Có thể chọn',
          style: TextStyle(color: AppColors.whitetext),
        ),
      ],
    );
  }
}
