import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.seatNumber,
    this.onTap,
    this.height = 55,
    this.width = 55,
    this.isSelected = false,
    this.isAvailable = true,
  });

  final void Function()? onTap;
  final String seatNumber;
  final double width;
  final double height;
  final bool isSelected;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isAvailable ? onTap : null,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: isAvailable
                  ? isSelected
                      ? AppColors.tint1
                      : AppColors.white
                  : Colors.grey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isAvailable
                    ? isSelected
                        ? AppColors.tint1
                        : AppColors.primary
                    : AppColors.grey1,
              )),
          alignment: Alignment.center,
          child: Text(
            seatNumber,
            style: CustomTextStyle.h3(AppColors.blacktext).copyWith(
              color: isAvailable
                  ? AppColors.blacktext
                  : AppColors.blacktext.withOpacity(0.6),
            ),
          ),
        ));
  }
}

class SeatInfoWidget extends StatelessWidget {
  const SeatInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: false,
        ),
        const SizedBox(width: 4),
        Text(
          "Đã chọn",
          style: CustomTextStyle.p3bold(AppColors.whitetext),
        ),
        const SizedBox(width: 10),
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: true,
        ),
        const SizedBox(width: 4),
        Text(
          "Đang chọn",
          style: CustomTextStyle.p3bold(AppColors.whitetext),
        ),
        const SizedBox(width: 10),
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: false,
        ),
        const SizedBox(width: 4),
        Text(
          "Có thể chọn",
          style: CustomTextStyle.p3bold(AppColors.whitetext),
        ),
      ],
    );
  }
}
