import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DikrBodyItem extends StatelessWidget {
  final Dikr dikr;
  final VoidCallback onDeleteItem;
  final double size;
  final Color textColor;

  const DikrBodyItem({
    Key? key,
    required this.dikr,
    required this.onDeleteItem,
    required this.size,
    required this.textColor,
  }) : super(key: key);

  Widget _buildText(String? content, Color? color, double size) {
    return Text(
      content!,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.justify,
      style: TextStyle(color: color, fontSize: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        if (dikr.istiada != null)
          _buildText(dikr.istiada, Theme.of(context).errorColor, size - 1.0),
        if (dikr.basmala != null)
          _buildText(dikr.basmala, Theme.of(context).errorColor, size - 1.0),
        SizedBox(
          //padding: const EdgeInsets.only(left: 5.0, top: 4),
          child: Text(
            dikr.name,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ),
        if (dikr.faida != null) const Divider(),
        if (dikr.faida != null)
          Text(
            dikr.faida!,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: size - (size * .3),
            ),
          ),
        const Divider(),
        BtnTikrar(dikr: dikr, onDeleteItem: onDeleteItem)
      ],
    );
  }
}

class BtnTikrar extends StatefulWidget {
  final Dikr dikr;
  final VoidCallback onDeleteItem;
  const BtnTikrar({
    Key? key,
    required this.dikr,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  _BtnTikrarState createState() => _BtnTikrarState();
}

class _BtnTikrarState extends State<BtnTikrar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(opacityPrimaryColor)),
      onPressed: () {
        if (widget.dikr.tikrar > 1) {
          setState(() {
            widget.dikr.tikrar -= 1;
            provider.reduceTikrarsByOne();
          });
        } else {
          setState(() {
            widget.onDeleteItem();
          });
        }
      },

      //onDeleteItem(),
      child: Text('${widget.dikr.tikrar} تكرار'),
    );
  }
}
