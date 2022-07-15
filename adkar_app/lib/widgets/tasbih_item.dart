import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:adkar_app/screens/page_tasbih.dart';
import 'package:adkar_app/widgets/build_text.dart';
import 'package:flutter/material.dart';

class TasbihItem extends StatelessWidget {
  const TasbihItem({
    Key? key,
    required this.isNightMode,
    required this.tasbih,
    required this.textColor,
  }) : super(key: key);

  final bool isNightMode;
  final Dikr tasbih;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: isNightMode ? Colors.black87 : whitingcolor,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Container(
        height: 110,
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(TasbihPage.routeName, arguments: {'tasbih': tasbih});
          },
          splashColor: primaryColor,
          child: ListTile(
            title: BuildText(
              title: tasbih.name,
              color: textColor,
              bold: true,
              size: 19,
              textDirection: TextDirection.rtl,
            ),
            subtitle: Text(
              "تكرار ${tasbih.tikrar}",
              style: TextStyle(color: textColor),
              textDirection: TextDirection.rtl,
            ),
            leading: Text(
              "إجمالي  ${tasbih.total}",
              style: TextStyle(color: textColor),
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
  }
}
