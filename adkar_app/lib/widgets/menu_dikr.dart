import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/adkar_yawm.dart';
import 'package:adkar_app/widgets/build_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDikr extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final double? height;
  const MenuDikr({
    Key? key,
    required this.title,
    this.imageUrl,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    final backgroundColor = isNightMode ? Colors.black87 : secondcolor;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    final menutype = provider.getMenuType;
    //final idx = Random().nextInt(mygradient.length);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AdkarYawm.routeName,
            arguments: {"title": title!, "imageUrl": imageUrl!});
      },
      child: Card(
        elevation: 4,
        color: whitingcolor,
        child: Container(
          height: height,
          padding: menutype != "grid" ? const EdgeInsets.only(right: 20) : null,
          decoration: BoxDecoration(
            color: backgroundColor,
            //borderRadius: const BorderRadius.all(Radius.circular(10)),
            //border: Border.all(width: 2, color: primaryColor),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.centerRight,
              colors: isNightMode ? darkerGrid : sea, // mygradient[idx],
            ),
          ),
          alignment:
              menutype != "grid" ? Alignment.centerRight : Alignment.center,
          child: menutype == "grid"
              ? SizedBox(
                  //decoration: BoxDecoration(border: Border.all(width: 1, color: primaryColor)),
                  /*child: FittedBox(*/
                  child: BuildText(
                    title: title!,
                    color: textColor,
                    size: 20.0,
                    bold: true,
                  ),
                )
              /*   fit: BoxFit.fill,
              )*/
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Image.asset("assets/images/bbk.png"),
                    ),
                    BuildText(
                      title: title!,
                      color: textColor,
                      size: 22.0,
                      bold: true,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
