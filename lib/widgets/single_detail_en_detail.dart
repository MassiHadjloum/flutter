import 'package:bnparisbas/constants/data.dart';
import 'package:flutter/material.dart';

class SingleCardDetail extends StatefulWidget {
  final String title;
  final String text;
  const SingleCardDetail({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  _SingleCardDetailState createState() => _SingleCardDetailState();
}

class _SingleCardDetailState extends State<SingleCardDetail> {
  var expand = false;

  void expandeMore([String title = ""]) {
    setState(() {
      expand = !expand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: expandeMore,
              child: Icon(
                !expand ? Icons.expand_more : Icons.expand_less_rounded,
                color: primaryColor,
                size: 40,
              ),
            ),
          ],
        ),
        if (expand) Text(widget.text, textAlign: TextAlign.justify)
      ],
    );
  }
}
