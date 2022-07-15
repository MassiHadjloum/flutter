import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/constants/reuse_components.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/douae_screen.dart';
import 'package:adkar_app/widgets/build_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdiyaItem extends StatelessWidget {
  final String name;
  final int index;

  const AdiyaItem({
    Key? key,
    required this.name,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    return InkWell(
      splashColor: primaryColor,
      onTap: () {
        Navigator.of(context).pushNamed(DouaeScreen.routeName, arguments: name);
      },
      child: Card(
        color: whitingcolor,
        elevation: 5,
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(top: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            //border: Border.all(width: 2, color: primaryColor),
            //borderRadius: BorderRadius.circular(15),
            // color: isNightMode ? Colors.black87 : secondcolor,
            gradient: getliniarGradiant(isNightMode),
          ),
          child: BuildText(
            title: name,
            color: textColor,
            size: 18.0,
            bold: true,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
