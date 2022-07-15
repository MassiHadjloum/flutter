import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/screens/AsmaAllahGrid.dart';
import 'package:adkar_app/screens/adiya_menu.dart';
import 'package:adkar_app/screens/adkar_btn_grid.dart';
import 'package:adkar_app/screens/mousabiha.dart';
import 'package:adkar_app/screens/parametre.dart';
import 'package:adkar_app/screens/qoran_grid.dart';
import 'package:adkar_app/widgets/btn_home_page.dart';
import 'package:flutter/material.dart';

class MenuHomePage extends StatelessWidget {
  final String type;
  final double width;

  final Color textColor;
  const MenuHomePage({
    Key? key,
    required this.type,
    required this.width,
    required this.textColor,
  }) : super(key: key);

  void goToScreen(String title, BuildContext context) {
    switch (title) {
      case "أذكار المسلم":
        Navigator.of(context).pushReplacementNamed(AdkarGridBtns.routeName);
        break;
      case "أسماء الله الحسنى":
        Navigator.of(context).pushReplacementNamed(AsmaAllahGrid.routeName);
        break;
      case "القرآن":
        Navigator.of(context).pushReplacementNamed(QoranGrid.routeName);
        break;
      case "جوامع الدعاء":
        Navigator.of(context)
            .pushReplacementNamed(AdiyaScreenMenu.routeName, arguments: {
          'title': "جوامع الدعاء",
          'data': Data.adiyaname,
        });
        break;
      case "فضائل":
        Navigator.of(context)
            .pushReplacementNamed(AdiyaScreenMenu.routeName, arguments: {
          'title': "فضائل",
          'data': Data.fadhailname,
        });
        break;
      case "المسبحة":
        Navigator.of(context).pushReplacementNamed(MousabihaScreen.routeName);
        break;
     /*  case "مواقيت الصلاة":
        Navigator.of(context).pushNamed(AdhanTimes.routeName);
        break; */
      case "إعدادات":
        Navigator.of(context).pushNamed(ParametrsScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final listScreens = Data.listScreens;
    return /* Expanded( 
      child: */
        type == "grid"
            ? SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (ctx, idx) => BtnHomePage(
                    onClick: goToScreen, textColor: textColor,
                    title: listScreens[idx],
                    //ctx,
                  ),
                  childCount: listScreens.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: width > 420 ? 2.8 : 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                    (ctx, idx) => BtnHomePage(
                          onClick: goToScreen, textColor: textColor,
                          title: listScreens[idx],
                          //ctx,
                        ),
                    childCount: listScreens.length)
                //)

                );
  }
}


/* 
GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: width > 420 ? 2.8 : 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: listScreens.length,
              itemBuilder: (ctx, idx) => BtnHomePage(
                backgroundColor: backgroundColor,
                onClick: goToScreen, textColor: textColor,
                title: listScreens[idx],
                //ctx,
              ),
            )

             : ListView.builder(
              itemBuilder: (ctx, idx) => BtnHomePage(
                backgroundColor: backgroundColor,
                onClick: goToScreen, textColor: textColor,
                title: listScreens[idx],
                //ctx,
              ),
              itemCount: listScreens.length,
            ),

*/