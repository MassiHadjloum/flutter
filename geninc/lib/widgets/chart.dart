import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';

class ChartLinear extends StatefulWidget {
  final double maxX;
  final double maxY;
  final double minY;
  final List<List<double>> ventes;
  final String typeChart;
  const ChartLinear({
    required this.maxX,
    required this.maxY,
    required this.minY,
    required this.ventes,
    required this.typeChart,
    Key? key,
  }) : super(key: key);

  @override
  _ChartLinearState createState() => _ChartLinearState();
}

class _ChartLinearState extends State<ChartLinear> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.ventes} ");
    return Container(
      width: double.infinity,
      height: 300,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(top: 15, right: 8, left: 15),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(
            show: true,
            border: Border.all(width: 1, color: Colors.white),
          ),
          gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (vl) => FlLine(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
              getDrawingVerticalLine: (vl) => FlLine(
                    color: Colors.white,
                    strokeWidth: 1,
                  )),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              axisNameSize: 35,
              //axisNameWidget: const Text('jours'),

              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 35,
                getTitlesWidget: (value, meta) {
                  if (widget.typeChart == JOUR) {
                    switch (value.toInt()) {
                      case 1:
                        return _buildText('Lun');
                      case 2:
                        return _buildText('Mar');
                      case 3:
                        return _buildText('Mer');
                      case 4:
                        return _buildText('Jeu');
                      case 5:
                        return _buildText('Ven');
                      case 6:
                        return _buildText('Sam');
                    }
                  } else if(widget.typeChart == SEMAINE){
                    switch (value.toInt()) {
                      case 1:
                        return _buildText('1');
                      case 2:
                        return _buildText('2');
                      case 3:
                        return _buildText('3');
                      case 4:
                        return _buildText('4');
                      case 5:
                        return _buildText('5');
                      case 6:
                        return _buildText('6');
                      case 7:
                        return _buildText('7');
                      case 8:
                        return _buildText('8');
                    }
                    
                  } else {
                    switch (value.toInt()) {
                      case 1:
                        return _buildText('Janv');
                      case 2:
                        return _buildText('Fév');
                      case 3:
                        return _buildText('Mars');
                      case 4:
                        return _buildText('Avr');
                      case 5:
                        return _buildText('Mai');
                      case 6:
                        return _buildText('Juin');
                      case 7:
                        return _buildText('Juill');
                      case 8:
                        return _buildText('Aout');
                      case 9:
                        return _buildText('Sept');
                      case 10:
                        return _buildText('Oct');
                      case 11:
                        return _buildText('Nov');
                      case 12:
                        return _buildText('Déc');
                    }

                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              axisNameSize: 35,
              axisNameWidget: _buildText("Ventes"),
              //drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 35,
                getTitlesWidget: (value, meta) {
                  return _buildText("${value.toInt()}");
                  /* switch (value.toInt()) {
                    case 1:
                      return _buildText('1');
                    case 2:
                      return _buildText('2');
                    case 3:
                      return _buildText('3');
                    case 4:
                      return _buildText('4');
                    case 5:
                      return _buildText('5');
                    case 6:
                      return _buildText('6');
                    case 7:
                      return _buildText('7');
                    case 8:
                      return _buildText('8');
                    case 9:
                      return _buildText('9');
                    case 10:
                      return _buildText('10');
                  }
                  return const Text(''); */
                },
              ),
            ),
            topTitles: AxisTitles(axisNameSize: 0),
            rightTitles: AxisTitles(axisNameSize: 0),
          ),
          maxX: widget.maxX,
          minX: 0,
          maxY: widget.maxY,
          minY: widget.minY,
          lineBarsData: [
            LineChartBarData(
              spots: widget.ventes.map((e) => FlSpot(e[0], e[1])).toList(),
              /* const [
                FlSpot(1, 2),
                FlSpot(2, 4),
                FlSpot(3, 3),
                FlSpot(4, 8),
                FlSpot(5, 5),
                FlSpot(6, 2),
              ], */
              //isCurved: true,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              barWidth: 2,
              //isStrokeCapRound: false,
              dotData: FlDotData(
                show: true,
              ),
              // la surface de truc
              belowBarData: BarAreaData(show: false, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
  /* Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
           // getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  } */
}
