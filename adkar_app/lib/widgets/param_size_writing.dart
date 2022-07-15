import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class WritingSizeParam extends StatelessWidget {
  final List<Map<String, Object>> list;
  final Function checkedRadioSize;
  const WritingSizeParam({
    Key? key,
    required this.list,
    required this.checkedRadioSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    final isnigthMode = provider.getNightMode;
    final colornight = isnigthMode ? whitingcolor : secondaryColor;
    //final listSize = provider.getListSize;
    final mediaquery = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        children: <Widget>[
          const MyDivider(),
          ...list
              .mapIndexed((index, item) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          checkedRadioSize(index);
                        },
                        icon: Icon(
                            item['checked'] as bool
                                ? Icons.radio_button_checked_rounded
                                : Icons.radio_button_off_rounded,
                            color: colornight),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        height: mediaquery.height * .07,
                        width: mediaquery.width * .29,
                        decoration: BoxDecoration(
                          //color: opacityPrimaryColor,
                          border: Border.all(
                            width: 1.5,
                            color: isnigthMode
                                ? opacityPrimaryColor
                                : secondaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "ٱلْحَمْدُ لِلَّهِ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: item['size'] as double,
                            color: colornight,
                          ),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ],
      ),
    );
  }
}
