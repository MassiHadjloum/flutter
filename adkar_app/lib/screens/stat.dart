import 'package:adkar_app/widgets/appbar.dart';
import 'package:flutter/material.dart';

class StatistiqueAdkar extends StatelessWidget {
  static const routeName = "/stat";
  const StatistiqueAdkar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: "ihsaat",),
      body: Center(child:  Text('helo'),),
    );
  }
}