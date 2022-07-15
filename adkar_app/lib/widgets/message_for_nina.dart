import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';


class MessageForNina extends StatelessWidget {
  final String message;
  const MessageForNina({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        //height: mediaquery.height * .2,
        // width: mediaquery.width * .8,

        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 15),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: whitingcolor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
