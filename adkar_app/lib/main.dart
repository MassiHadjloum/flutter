import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:adkar_app/helpers/shared_prefs.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/AsmaAllahGrid.dart';
import 'package:adkar_app/screens/adiya_menu.dart';
import 'package:adkar_app/screens/adkar_yawm.dart';
import 'package:adkar_app/screens/douae_screen.dart';
import 'package:adkar_app/screens/first_screen.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/providers/dikr_provider.dart';
import 'package:adkar_app/screens/adkar_btn_grid.dart';
import 'package:adkar_app/screens/mousabiha.dart';
import 'package:adkar_app/screens/page_tasbih.dart';
import 'package:adkar_app/screens/parametre.dart';
import 'package:adkar_app/screens/qoran_grid.dart';
import 'package:adkar_app/screens/sora_page.dart';
import 'package:adkar_app/screens/stat.dart';

void main() async {
  /* WidgetsFlutterBinding.ensureInitialized();
   */
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await SavePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => DikrProvider()),
        ChangeNotifierProvider(create: (ctx) => ParametresProvider()),
       // ChangeNotifierProvider(create: (ctx) => TimesSalatProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.green,
          primaryColor: primaryColor,
          colorScheme: const ColorScheme.dark(
            primary: primaryColor,
            surface: Colors.red,
            onBackground: Colors.green,
            secondary: whitingcolor,
            //brightness: Brightness.dark
          ),
          focusColor: accentColor,
          //brightness: Brightness.light,
          //dialogBackgroundColor: Colors.blueAccent,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'USA'),
          Locale('ar', 'SA'),
        ],
        home: const FirstScreen(),
        //initialRoute: "/",
        routes: {
          MyHomePage.routName: (ctx) => const MyHomePage(),
          AdkarGridBtns.routeName: (ctx) => const AdkarGridBtns(),
          AdkarYawm.routeName: (ctx) => const AdkarYawm(),
          AsmaAllahGrid.routeName: (ctx) => const AsmaAllahGrid(),
          QoranGrid.routeName: (ctx) => QoranGrid(),
          SoraPage.routeName: (ctx) => const SoraPage(),
          StatistiqueAdkar.routeName: (ctx) => const StatistiqueAdkar(),
          AdiyaScreenMenu.routeName: (ctx) => const AdiyaScreenMenu(),
          DouaeScreen.routeName: (ctx) => DouaeScreen(),
          ParametrsScreen.routeName: (ctx) => const ParametrsScreen(),
          MousabihaScreen.routeName: (ctx) => const MousabihaScreen(),
          TasbihPage.routeName: (ctx) => const TasbihPage(),
         // AdhanTimes.routeName: (ctx) => const AdhanTimes(),
        },
      ),
    );
  }
}
