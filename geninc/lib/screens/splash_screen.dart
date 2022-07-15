import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const Home()));
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: media.width,
        height: media.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Center(
          child: TweenAnimationBuilder(
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
        ),
      ),
    );
  }
}
