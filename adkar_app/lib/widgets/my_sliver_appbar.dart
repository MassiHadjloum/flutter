import 'dart:math';

import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/dikr_provider.dart';
import 'package:adkar_app/widgets/message_for_nina.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySliverAppBar extends StatelessWidget {
  final String imageUrl;
  final String title;
  final List<String> messages;
  final bool hideMsg;
  const MySliverAppBar({
    Key? key,
    required this.messages,
    required this.title,
    required this.imageUrl,
    required this.hideMsg,
  }) : super(key: key);

  Widget _buildMessage(bool hidemsg) {
    final idx = Random().nextInt(messages.length);
    return !hidemsg
        ? Align(
            alignment: Alignment.topCenter,
            child: MessageForNina(message: messages[idx]),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final hidemsg = Provider.of<DikrProvider>(context).getHide;
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
        // index: 1,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          if (imageUrl != '')
            Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.fill,
              height: mediaQuery.height * .27,
            ),
          messages.isNotEmpty ? _buildMessage(hidemsg) : Container(),
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


  /*    Indexed(
                index: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ),
              ), */
