import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IsmAllah extends StatelessWidget {
  final String title;
  final String description;
  const IsmAllah({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    final backgroungColor = isNightMode ? Colors.black87 : secondcolor;
    final menutype = provider.getMenuType;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            child: AlertDialog(
              titlePadding: const EdgeInsets.only(top: 7),
              backgroundColor: isNightMode ? secondaryColor : qoranmenuColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                title,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              elevation: 5,
              content: Text(
                description,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 17,
                  color: textColor,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child:
                      const Text("تم", style: TextStyle(color: primaryColor)),
                ),
              ],
            ),
          ),
        );
      },
      child: Card(
        color: whitingcolor,
        elevation: 4,
        child: Container(
          //margin: const EdgeInsets.all(5),
          height: menutype == "grid" ? null : 70,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            //border: Border.all(width: 2, color: primaryColor),
            color: backgroungColor,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.centerRight,
              colors: isNightMode ? darker : sea,
            ),
            //borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          alignment:
              menutype == "grid" ? Alignment.center : Alignment.centerRight,
          child: menutype != "grid"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/images/box4.png"),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: menutype == "grid" ? 22 : 25,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: menutype == "grid" ? 22 : 25,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
