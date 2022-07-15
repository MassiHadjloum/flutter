import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:adkar_app/providers/dikr_provider.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/screens/parametre.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:adkar_app/widgets/build_icon_btn.dart';
import 'package:adkar_app/widgets/drawer.dart';
import 'package:adkar_app/widgets/tasbih_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MousabihaScreen extends StatefulWidget {
  static const routeName = "/mousabiha";
  const MousabihaScreen({Key? key}) : super(key: key);

  @override
  State<MousabihaScreen> createState() => _MousabihaScreenState();
}

class _MousabihaScreenState extends State<MousabihaScreen> {
   final _tasbihController = TextEditingController();
  final _tikrarController = TextEditingController();
  void _submitData(BuildContext context) {
    final tasbihName = _tasbihController.text;
    final tikrar = (int.parse(_tikrarController.text));
    //print(_tikrarController.text);
    if (tasbihName.isEmpty) {
      return;
    }
    final tasbih = Dikr(id: '', name: tasbihName, tikrar: tikrar, total: 0);
    Provider.of<DikrProvider>(context, listen: false).insertTasbih(tasbih);
    _tasbihController.text = "";
    _tikrarController.text = "";
  }

   Widget _buildContent(double height, double width) {
    return SizedBox(
      height: height, //
      width: width, // mediquery.width * .8,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
             SizedBox(
              child: TextField(
                textAlign: TextAlign.right,
                controller: _tasbihController,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "الذكر",

                  //labelStyle: TextStyle(color: theme.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _tikrarController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "عدد المرات",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAlertAddTasbih(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          final mediaquery = MediaQuery.of(context).size;
          return AlertDialog(
            //backgroundColor: whitingcolor,
            content:
                _buildContent(mediaquery.height * .19, mediaquery.width * .8),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child:
                    const Text("إلغاء ", style: TextStyle(color: primaryColor)),
              ),
              TextButton(
                onPressed: () {
                  _submitData(context);
                  Navigator.of(context).pop();
                },
                child: const Text("إضافة  ",
                    style: TextStyle(color: primaryColor)),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    //final mediquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        title: "المسبحة",
        actions: [
          BuildIconBtn(
            icon: Icons.home,
            goTo: () => Navigator.of(context).pushNamed(MyHomePage.routName),
          ),
          BuildIconBtn(
            icon: Icons.settings,
            goTo: () =>
                Navigator.of(context).pushNamed(ParametrsScreen.routeName),
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: isNightMode ? secondaryColor : whitingcolor,
      drawer: const MyDrawer(),
      body: FutureBuilder(
        future: Provider.of<DikrProvider>(context, listen: false).load(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<DikrProvider>(
              builder: (ctx, data, ch) => ListView.builder(
                itemBuilder: (ctx, idx) => TasbihItem(
                    isNightMode: isNightMode,
                    tasbih: data.getMousabihaList[idx],
                    textColor: textColor),
                itemCount: data.getMousabihaList.length,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertAddTasbih(context),
        child: const Icon(Icons.add),
        backgroundColor: darkprimaryColor,
        foregroundColor: primaryColor,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
