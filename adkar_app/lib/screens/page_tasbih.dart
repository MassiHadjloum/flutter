
import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:adkar_app/providers/dikr_provider.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:adkar_app/widgets/increment_tasbih.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasbihPage extends StatefulWidget {
  static const routeName = "/mousabiha/tasbih";
  const TasbihPage({Key? key}) : super(key: key);

  @override
  _TasbihPageState createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  var actual = 0;
  var tikrar = 0;
  var _init = false;

  late Dikr tasbih;
  var args;

  @override
  void didChangeDependencies() {
    if (!_init) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, Dikr>;
      tasbih = args['tasbih'] as Dikr;
      tikrar = tasbih.tikrar;
      _init = false;
    }
    super.didChangeDependencies();
  }

  void addOne() {
    final to = tasbih.total!;
    setState(() {
      tasbih.total = to + 1;
      if (actual == tikrar - 1) {
        setState(() {
          actual = 0;
        });
      } else {
        setState(() {
          actual++;
        });
      }
    });
  }

  Widget _buildText(String text, Color color, {double? size}) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }

  Widget _buildColumn(List<Widget> children) {
    return Column(
      children: <Widget>[...children],
    );
  }

  Widget _buildTikrarContainer(int tikrar,
      [Color textColor = secondaryColor, double size = 19.0]) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: opacityPrimaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: _buildText("$tikrar", textColor, size: size),
    );
  }

  Future<bool> scope() {
    return Provider.of<DikrProvider>(context, listen: false)
        .update(tasbih)
        .then((value) => true);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    final isNightMode = provider.getNightMode;
    final background = isNightMode ? darkprimaryColor : whitingcolor;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    final mediaQuery = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return scope();
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: "المسبحة",
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<DikrProvider>(context, listen: false)
                    .deleteTasbih(tasbih.id);
                Navigator.of(context).pop();
              },
              tooltip: " حذف الذكر",
              icon: const Icon(
                Icons.highlight_remove_rounded,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        backgroundColor: background,
        body: SingleChildScrollView(
          child: SizedBox(
            height: mediaQuery.height,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: Text(
                    tasbih.name,
                    style: TextStyle(fontSize: 23, color: textColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildColumn(
                      [
                        _buildText("عدد المرات", textColor, size: 19),
                        _buildTikrarContainer(tasbih.tikrar),
                      ],
                    ),
                    _buildColumn([
                      _buildText("عدد المرات الإجمالي", textColor, size: 19),
                      _buildText("${tasbih.total} ", textColor, size: 18)
                    ]),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildColumn([
                        _buildText("العدد الحالي", textColor, size: 19),
                        _buildText("$actual", textColor, size: 18)
                      ]),
                      _buildColumn([
                        _buildText("دورة", textColor, size: 19),
                        _buildText("${(tasbih.total! / tasbih.tikrar).ceil()} ",
                            textColor,
                            size: 18)
                      ]),
                    ],
                  ),
                ),
                IncrementTasbih(increment: addOne),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<DikrProvider>(context, listen: false)
                .updateResetTotal(tasbih);
            setState(() {
              actual = 0;
            });
          },
          child: const Icon(
            Icons.settings_backup_restore_outlined,
            size: 40,
          ),
          tooltip: "تصفير العداد",
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}
