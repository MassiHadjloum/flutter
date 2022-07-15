import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySliverAppBar extends StatelessWidget {
  final String imageUrl;
  final String title;
  
  final bool hideMsg;
  const MySliverAppBar({
    Key? key,
  
    required this.title,
    required this.imageUrl,
    required this.hideMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Consumer(
      builder: (ctx, data, ch) => SliverAppBar(
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false,
        expandedHeight: mediaQuery.height * .27,
        floating: true,
        //pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: ch,
          collapseMode: CollapseMode.pin,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          if (imageUrl != '')
            Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.fill,
              height: mediaQuery.height * .27,
            ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 10.0, right: 10.0, bottom: 10),
            child: Text(
              title,
              style: const TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
