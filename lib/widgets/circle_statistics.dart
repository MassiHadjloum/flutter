import 'package:bnparisbas/models/data_stat.dart';
import 'package:bnparisbas/widgets/body_accueil.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatCircle extends StatelessWidget {
  const StatCircle({Key? key}) : super(key: key);

  List<PieChartSectionData> getSectionData() {
    return PieData.data
        .asMap()
        .map<int, PieChartSectionData>((idx, data) {
          final value = PieChartSectionData(
            color: data.color,
            radius: 35,
            value: data.percent,
            //borderSide: const BorderSide(color: Colors.white, width: 1),
            title: "",
            /* titleStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ), */
            badgeWidget:
                const Icon(Icons.highlight_outlined, color: Colors.white),
          );
          return MapEntry(idx, value);
        })
        .values
        .toList();
  }

  Widget _buidContainer(BuildContext context, Widget child, double? height) {
    return Container(
      alignment: Alignment.center,
      height: height, // 220,
      width: MediaQuery.of(context).size.width * .55,
      child:  child, //const Text("-15,33 €", textAlign: TextAlign.center),
    );
  }

  Widget _buildIndicators(double? width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PieData.data
          .map(
            (e) => SizedBox(
              width: width,// 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: e.color,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(e.name),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AccueilBody.buildText(30, "Mes dépenses", 15, Colors.black, true),
            AccueilBody.buildText(
                30, "Depuis 01/03/2022", 13, Colors.black54, false),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Stack(
              children: [
                _buidContainer(
                  context,
                  PieChart(
                    PieChartData(
                      sections: getSectionData(),
                      //centerSpaceRadius: 70,
                      centerSpaceColor: Colors.grey[300],
                      sectionsSpace: 0,
                    ),
                  ),
                  mediaQuery.height * .25,
                ),
                _buidContainer(
                    context,
                    const Text("-15,33 €", textAlign: TextAlign.center),
                    mediaQuery.height * .24),
              ],
            ),
            const SizedBox(width: 20),
            _buildIndicators(mediaQuery.width * .3),
          ],
        ),
      ],
    );
  }
}
