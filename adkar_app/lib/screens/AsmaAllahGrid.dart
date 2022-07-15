// ignore_for_file: file_names


import 'dart:async';
import 'dart:math';

import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/widgets/build_icon_btn.dart';
import 'package:adkar_app/widgets/build_text.dart';
import 'package:adkar_app/widgets/header_image.dart';
import 'package:adkar_app/widgets/my_second_sliver_appbar.dart';
import 'package:flutter/material.dart';

import '../providers/paramertes_provider.dart';
import '../screens/parametre.dart';
import '../widgets/appbar.dart';
import '../constants/data.dart';
import '../widgets/drawer.dart';
import '../widgets/isma_allah.dart';
import 'package:provider/provider.dart';

class AsmaAllahGrid extends StatefulWidget {
  static const routeName = "/asma_menu";
  const AsmaAllahGrid({Key? key}) : super(key: key);

  @override
  State<AsmaAllahGrid> createState() => _AsmaAllahGridState();
}

class _AsmaAllahGridState extends State<AsmaAllahGrid> {
  Widget? otherChild(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BuildText(
            title: title,
            color: whitingcolor,
            size: 32,
            bold: true,
          ),
          BuildText(
            title: content,
            color: whitingcolor,
            bold: false,
            size: 20,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  var idx = 0;
  
  Future<void> _refrech() async {
    await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        idx = Random().nextInt(99);
      });
    
  }
  @override
  void initState() {
    idx = Random().nextInt(99);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = Data.asmaallah;
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    //SavePreferences.setNightMode(isNightMode);
    // print("saved mode ${SavePreferences.getNightMode()}");
    final type = provider.getMenuType;
    

    return Scaffold(
      appBar: MyAppBar(
        title: "أسماء الله الحسنى",
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
      drawer: const MyDrawer(),
      backgroundColor: isNightMode ? secondaryColor : whitingcolor,
      body: RefreshIndicator(
                child: CustomScrollView(
                  slivers: [
                    MySecondSliverAppBar(
                      backgroundAppBar: HeaderImage(
                        title: "",
                        otherChild:
                            otherChild(list[idx].name, list[idx].description),
                      ),
                    ),
                    type == 'grid'
                        ? SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                                (cxt, idx) => IsmAllah(
                                    title: list[idx].name,
                                    description: list[idx].description),
                                childCount: list.length),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: width > 420 ? 2.8 : 1.5,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (cxt, idx) => IsmAllah(
                                title: list[idx].name,
                                description: list[idx].description,
                              ),
                              childCount: list.length,
                            ),
                          )
                  ],
                ),
                onRefresh: _refrech,
            
      ),
    );
  }
}
