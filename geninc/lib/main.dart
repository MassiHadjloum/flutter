import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geninc/providers/terrain_provider.dart';
import 'package:geninc/screens/detail_ville.dart';
import 'package:geninc/screens/home.dart';
import 'package:geninc/screens/mombres.dart';
import 'package:geninc/screens/splash_screen.dart';
import 'package:geninc/screens/stat.dart';
import 'package:geninc/screens/terrain.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
   SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  ); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TerrainProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('fr', ''),
          Locale('ar', ''),
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),//  Home(),
        routes: {
          //Home.routeName: (ctx) => const Home(),
          Terrain.routeName: (ctx) => const Terrain(),
          Statistics.routeName: (ctx) => const Statistics(),
          Members.routeName: (ctx) => const Members(),
          DetailVille.routeName: (ctx) => const DetailVille(),
        },
      ),
    );
  }
}
