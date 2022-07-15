import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

LinearGradient getliniarGradiant(bool? isNightMode) => LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.centerRight,
      colors: isNightMode! ? darker : sea,
    );

LinearGradient getliniarGradiantTwo(List<Color> colors) => LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.centerRight,
      colors: colors,
    );

/* Future<void> showAlertAddTasbih(BuildContext context) async{
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        //backgroundColor: whitingcolor,
        content: const AddNewTasbih(),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("إلغاء ", style: TextStyle(color: primaryColor)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("إضافة  ", style: TextStyle(color: primaryColor)),
          ),
        ],
      ),
    );
  } */