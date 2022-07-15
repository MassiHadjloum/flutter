import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/constants/reuse_components.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/build_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtnHomePage extends StatelessWidget {
  final Color textColor;
  final Function onClick;
  final String title;
  const BtnHomePage({
    required this.textColor,
    required this.onClick,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    final menutype = provider.getMenuType;
    //final backgroundColor = isNightMode ? darker : sea;
    final mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onClick(title, context),
      child: Card(
        color: whitingcolor,
        elevation: 4,
        child: Container(
          height: menutype == 'grid' ? mediaQuery.height * .2 : mediaQuery.height * .1,
          padding: menutype != 'grid' ? const EdgeInsets.only(right: 20) : null,
          decoration: BoxDecoration(
            //border: Border.all(width: 2, color: primaryColor),
            gradient: getliniarGradiant(isNightMode),
          ),
          child: menutype != 'grid'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        "assets/images/box.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: BuildText(
                        title: title,
                        color: textColor,
                        size: 22,
                        bold: true,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: BuildText(
                    title: title,
                    color: textColor,
                    size: 22,
                    bold: true,
                  ),
                ),
        ),
      ),
    );
  }
}
