import 'package:flutter/material.dart';

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
      actions: actions,
      backgroundColor:
          Theme.of(context).colorScheme.secondary, //rgba(47, 54, 64,1.0)
      bottom: tabBar != null ? tabBar : null,
    );
  }
}
