import 'package:flutter/material.dart';
import '../../../modules/seat/widget/seat_widget.dart';

class SeatRow extends StatelessWidget {
  final int rowNumber;
  final List<String> selectedSeats;
  final ValueChanged<List<String>> onSeatTap;

  const SeatRow({
    super.key,
    required this.rowNumber,
    required this.selectedSeats,
    required this.onSeatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int j = 1; j <= 4; j++) ...[
          const SizedBox(width: 4),
          SeatWidget(
            seatNumber: "${String.fromCharCode(rowNumber + 64)}$j",
            width: (MediaQuery.of(context).size.width - 80 - 66) / 4,
            height: (MediaQuery.of(context).size.width - 80 - 66) / 4,
            // isAvailable: rowNumber != 2,
            isSelected: selectedSeats
                .contains("${String.fromCharCode(rowNumber + 64)}$j"),
            onTap: () {
              String seat = "${String.fromCharCode(rowNumber + 64)}$j";
              List<String> updatedSelectedSeats = List.from(selectedSeats);
              if (selectedSeats.contains(seat)) {
                updatedSelectedSeats.remove(seat);
              } else {
                updatedSelectedSeats.add(seat);
              }
              onSeatTap(updatedSelectedSeats);
            },
          ),
          const SizedBox(width: 12),
        ]
      ],
    );
  }
}
