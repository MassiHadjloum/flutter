import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final TabBar? tabBar;
  const MyAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.tabBar,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
      ),
      actions: actions,
      backgroundColor: secondaryColor,
      bottom: tabBar != null ? tabBar : null,
    );
  }
}
