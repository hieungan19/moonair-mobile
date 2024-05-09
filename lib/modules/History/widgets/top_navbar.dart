import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({Key? key}) : super(key: key);
  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
        // padding: const EdgeInsets.only(top: 0),
        child: TabBar(
          labelColor: AppColors.primary,
          dividerColor: Colors.transparent,
          unselectedLabelColor: AppColors.grey2,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
          indicatorWeight: 5,
          indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(width: 5, color: AppColors.primary),
              borderRadius: BorderRadius.circular(20)),
          indicatorColor: AppColors.primary,
          tabs: [
            Tab(
              height: 40,
              child: Text('Tất cả',
                  style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
            ),
            Tab(
              height: 40,
              child: Text('Đã hủy',
                  style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
            ),
          ],
          controller: _controller,
        )
        );
  }
}
