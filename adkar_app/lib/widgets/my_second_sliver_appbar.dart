
import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';

class MySecondSliverAppBar extends StatelessWidget {
  final Widget backgroundAppBar;
  const MySecondSliverAppBar({
    required this.backgroundAppBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: secondaryColor,
      automaticallyImplyLeading: false,
      expandedHeight: mediaQuery.height * .31,
      floating: true,
      //pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: backgroundAppBar,
        collapseMode: CollapseMode.pin,
        centerTitle: true,
      ),
    );
  }
}
