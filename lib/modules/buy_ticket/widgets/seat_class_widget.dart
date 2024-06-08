import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/data/models/flight.dart';
import 'package:moonair/data/models/flight.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';

class SeatClass extends StatefulWidget {
  final List<Ticket>? ticketClass;
  const SeatClass({super.key, this.ticketClass});

  @override
  State<SeatClass> createState() => _SeatClassState();
}

class _SeatClassState extends State<SeatClass> {
  late String dropdownValue;
  late String selectedClassId; // Biến để lưu trữ ID của class được chọn
  BuyTicketController _controller = Get.find();
  @override
  void initState() {
    super.initState();
    // Thiết lập giá trị mặc định cho dropdownValue từ Ticket đầu tiên (nếu có)
    dropdownValue = widget.ticketClass?.isNotEmpty == true
        ? widget.ticketClass![0].className
        : '';
    // Thiết lập giá trị mặc định cho selectedClassId
    selectedClassId = widget.ticketClass?.isNotEmpty == true
        ? widget.ticketClass![0].id
        : ''; // Giả sử ID được lưu trữ trong thuộc tính id của Ticket
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
          _controller.currentClass.value = widget.ticketClass!
              .firstWhere((ticket) => ticket.className == newValue)
              .id;
        },
        items: widget.ticketClass?.map((Ticket ticket) {
          return DropdownMenuItem<String>(
            value: ticket.className,
            child: Text(
              ticket.className,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blacktext,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
