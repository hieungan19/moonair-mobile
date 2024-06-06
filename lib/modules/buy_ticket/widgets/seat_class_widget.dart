import 'package:flutter/material.dart';
import 'package:moonair/core/app_colors.dart';

class SeatClass extends StatefulWidget {
  const SeatClass({super.key});

  @override
  State<SeatClass> createState() => _SeatClassState();
}

class _SeatClassState extends State<SeatClass> {
  String dropdownValue = 'Thương gia';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.primary, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          padding: const EdgeInsets.only(left: 10),
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Thương gia', 'Hạng A', 'Hạng B', 'Hạng C']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.blacktext,
                ),
              ),
            );
          }).toList(),
        ));
  }
}
