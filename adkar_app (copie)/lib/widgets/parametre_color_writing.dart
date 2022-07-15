import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class WritingColorParam extends StatelessWidget {
  final List<List<Map<String, Object>>> list;
  final Function checkedRadioParam;
  final String? modeColor;
  const WritingColorParam({
    Key? key,
    required this.list,
    required this.checkedRadioParam,
    this.modeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    final isnigthMode =
        Provider.of<ParametresProvider>(context, listen: false).getNightMode;
    final colornight = isnigthMode ? whitingcolor : secondaryColor;
    return SizedBox(
      child: Column(
        children: <Widget>[
          const MyDivider(),
          ...list
              .mapIndexed(
                (indexI, item) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: mediaquery.width * .8,
                     
                      margin: const EdgeInsets.only(bottom: 5, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ...item
                              .mapIndexed(
                                (indexJ, color) => ContentParametre(
                                  checkedRadioParam: checkedRadioParam,
                                  colornight: colornight,
                                  mediaquery: mediaquery,
                                  modeColor: modeColor,
                                  isnigthMode: isnigthMode,
                                  indexI: indexI,
                                  indexJ: indexJ,
                                  checked: color['checked'] as bool,
                                  textColor: color['color'] as Color,
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class ContentParametre extends StatelessWidget {
  const ContentParametre({
    Key? key,
    required this.checkedRadioParam,
    required this.colornight,
    required this.mediaquery,
    required this.modeColor,
    required this.isnigthMode,
    required this.indexI,
    required this.indexJ,
    required this.checked,
    required this.textColor,
  }) : super(key: key);

  final Function checkedRadioParam;
  final Color colornight;
  final Size mediaquery;
  final String? modeColor;
  final bool isnigthMode;
  final int indexI;
  final int indexJ;
  final bool checked;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () {
            checkedRadioParam(indexI, indexJ);
          },
          icon: Icon(
              checked
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_off_rounded,
              color: checked ? textColor : colornight),
        ),
        Container(
          //padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          //alignment: Alignment.center,
          height: mediaquery.height * .06,
          width: 50, // mediaquery.width * .26,
          decoration: BoxDecoration(
            //color: modeColor! == 'foreGround' ? primaryColor : textColor,
            color:
                textColor, // modeColor! == 'foreGround' ? textColor : secondaryColor,
            border: Border.all(
              width: 1.5,
              color: isnigthMode ? opacityPrimaryColor : secondaryColor,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          /* child: Text(
            "ٱلْحَمْدُ لِلَّهِ",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ), */
        ),
      ],
    );
  }
}
