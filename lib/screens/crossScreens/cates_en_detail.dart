import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/single_detail_en_detail.dart';
import 'package:flutter/material.dart';

class CardInDetail extends StatelessWidget {
  static const routeName = "/offres/cartes/en_detail";
  const CardInDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final title = arguments['title'] as String;
    final list = arguments['list'] as List<Map<String, String>>;
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(title: "EN DÉTAIL"),
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ReuseWidgets.buildText(
              title,
              Colors.black,
              18,
              mediaQuery.height * .06,
              true,
              alignment: Alignment.centerLeft,
            ),
            ...list
                .map((item) => Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: /* Column(
                            children: [ */
                            SingleCardDetail(
                                title: item['title']!, text: item['text']!),
                        // _buildHeaderList(item['title']!, item) //],
                        //),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
