import 'dart:async';
import 'dart:math';

import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/constants/index_msg.dart';
import 'package:adkar_app/constants/reuse_components.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
     Timer(const Duration(milliseconds: 4500), () {
      if (whichMessageToDisplayHijri() == TypeMessageHijri.NOTHING &&
          whichMessageToDisplayMiladi() == TypeMessageMiladi.NOTHING) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const MyHomePage(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => SecondScreen(),
          ),
        );
      }
    }); 
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final adiya = Data.adiya;
    final mediaquery = MediaQuery.of(context).size;
    final idx = Random().nextInt(adiya.length);
    final idxcolor = Random().nextInt(mygradient.length);
    final provider = Provider.of<ParametresProvider>(context);
    provider.initializeParams();
    //print("initial values param ${provider.getInitialParamsValue()}");
    return Scaffold(
      //backgroundColor: secondaryColor,
      body: Container(
        alignment: Alignment.center,
        //margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          gradient: getliniarGradiantTwo(mygradient[idxcolor]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/hijab.png",
              //color: opacityPrimaryColor,
              height: mediaquery.height * .4,
              width: mediaquery.width * .9,
            ),
            /*  Image.asset(
              "assets/images/dini.png",
              height: 100,
              width: 200,
              cacheHeight: 65,
              color: Colors.blue,
            ), */
            SizedBox(
              width: mediaquery.width * .7,
              child: Text(
                adiya[idx],
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 20,
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: .0, end: 1.0),
              duration: const Duration(seconds: 3),
              builder: (ctx, value, _) => const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  //value: value as double,
                  //backgroundColor: secondaryColor,
                  color: secondaryColor,
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
