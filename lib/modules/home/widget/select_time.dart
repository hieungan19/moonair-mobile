import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';

class DateContainer extends StatelessWidget {
  final String title;
  final String initialDate;

  const DateContainer({
    super.key,
    required this.title,
    required this.initialDate,
  });

  Future<void> selectDate(BuildContext context) async {
    final ThemeData theme = ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(primary: AppColors.secondary),
    );
    final DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme,
          child: child!,
        );
      },
    );

    if (selected != null) {
      // Do something with the selected date
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: CustomTextStyle.p3(AppColors.grey2),
          ),
          Text(
            initialDate,
            style: CustomTextStyle.h4(AppColors.blacktext),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                selectDate(context);
              },
              icon: Image.asset(
                'lib/assets/icons/calender.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
