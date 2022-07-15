import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:adkar_app/providers/dikr_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddNewTasbih extends StatelessWidget {
   AddNewTasbih({Key? key}) : super(key: key);

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
  }

  Widget _buildContent(double height, double width) {
    return SizedBox(
      height: height, //
      width: width, // mediquery.width * .8,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            const SizedBox(
              child: TextField(
                textAlign: TextAlign.right,
                autofocus: true,
                decoration: InputDecoration(
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
                _buildContent(mediaquery.height * .18, mediaquery.width * .8),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child:
                    const Text("إلغاء ", style: TextStyle(color: primaryColor)),
              ),
              TextButton(
                onPressed: () => _submitData(context),
                child: const Text("إضافة  ",
                    style: TextStyle(color: primaryColor)),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    /*  final mediaquery = MediaQuery.of(context).size;
    return _buildContent(mediaquery.height * .18, mediaquery.width * .8);
 */
    return Container();
  }
}
