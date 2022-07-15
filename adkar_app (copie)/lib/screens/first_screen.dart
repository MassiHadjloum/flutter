import 'dart:async';
import 'dart:math';
import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/constants/reuse_components.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/home_page.dart';
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
     
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const MyHomePage(),
          ),
        );
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
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          gradient: getliniarGradiantTwo(mygradient[idxcolor]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/logoapp.png",
              height: mediaquery.height * .2,
              width: mediaquery.width * .3,
            ),
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
