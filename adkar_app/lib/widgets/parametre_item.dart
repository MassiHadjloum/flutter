import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/constants/reuse_components.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/build_text.dart';
import 'package:adkar_app/widgets/param_size_writing.dart';
import 'package:adkar_app/widgets/parametre_color_writing.dart';
import 'package:adkar_app/widgets/parametre_scrolling_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParametreItem extends StatelessWidget {
  final String title;
  const ParametreItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    //final mediaQuery = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 5,
      child: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          gradient: getliniarGradiant(isNightMode),
        ),
        child: ExpandCard(title: title),
      ),
    );
  }
}

class ExpandCard extends StatefulWidget {
  final String title;
  const ExpandCard({Key? key, required this.title}) : super(key: key);

  @override
  _ExpandCardState createState() => _ExpandCardState();
}

class _ExpandCardState extends State<ExpandCard> {
  var more = false;
  late Widget content;
  void showMore() {
    setState(() {
      more = !more;
    });
  }

  void chooseParam(ParametresProvider provider) {
    switch (widget.title) {
      case "تغيير حجم الخط":
        content = WritingSizeParam(
          list: provider.getListSize,
          checkedRadioSize: provider.checkedRadio,
        );
        break;
      case "تغيير لون الخط":
        content = WritingColorParam(
          list: provider.getListColor,
          checkedRadioParam: provider.checkedRadioColor,
          modeColor: "foreGround",
        );
        break;
      case "تغيير لون الواجهة الخلفية":
        content = WritingColorParam(
          list: provider.getListColorBackgound,
          checkedRadioParam: provider.checkedRadioBackgoundColor,
          modeColor: "backGround",
        );
        break;
      case "تغيير اتجاه تمرير الاذكار":
        content = ScrollingModeParam(
          list: provider.getListScrollMode,
          checkRadioParam: provider.checkedRadioScrolling,
        );
        break;
      case "تغيير شكل واجهة الاذكار":
        content = ScrollingModeParam(
          list: provider.getListMenuType,
          checkRadioParam: provider.checkedRadioMenuType,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final textColor = provider.getNightMode ? whitingcolor : secondaryColor;
    chooseParam(provider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .1,
          child: ListTile(
            
              title: BuildText(
                title: widget.title,
                color: textColor,
                size: 18.0,
                bold: true,
                textDirection: TextDirection.rtl,
              ),
              leading: IconButton(
                icon: Icon(
                  !more ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                  color: secondaryColor,
                  size: 30,
                ),
                onPressed: showMore,
              )),
        ),
        if (more) content,
      ],
    );
  }
}
