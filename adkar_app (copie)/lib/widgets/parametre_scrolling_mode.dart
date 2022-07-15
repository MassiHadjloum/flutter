import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/divider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScrollingModeParam extends StatelessWidget {
  final List<Map<String, Object>> list;
  final Function checkRadioParam;
  const ScrollingModeParam({
    Key? key,
    required this.list,
    required this.checkRadioParam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    final isnigthMode = provider.getNightMode;
    final colornight = isnigthMode ? whitingcolor : secondaryColor; 
    final mediaquery = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        children: <Widget>[
          const MyDivider(),
          const SizedBox(height: 10),
          ...list
              .mapIndexed(
                (index, item) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        checkRadioParam(index);
                      },
                      icon: Icon(
                        item['checked'] as bool
                            ? Icons.radio_button_checked_rounded
                            : Icons.radio_button_off_rounded,
                            color: colornight,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      height: mediaquery.height * .09,
                      width: mediaquery.width * .26,
                      decoration: BoxDecoration(
                        //color: primaryColor,
                        border: Border.all(
                          width: 1.5,
                          color: isnigthMode ? opacityPrimaryColor : secondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        item['icon'] as String,
                        height: 50,
                        //color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
