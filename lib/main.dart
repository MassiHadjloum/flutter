import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:bnparisbas/screens/crossScreens/cates_en_detail.dart';
import 'package:bnparisbas/screens/crossScreens/compte_de_cheque.dart';
import 'package:bnparisbas/screens/crossScreens/details_cates_visa.dart';
import 'package:bnparisbas/screens/crossScreens/offres_les_cartes.dart';
import 'package:bnparisbas/screens/crossScreens/profile_screen.dart';
import 'package:bnparisbas/screens/crossScreens/select_acount_distination.dart';
import 'package:bnparisbas/screens/crossScreens/telecharger_rib.dart';
import 'package:bnparisbas/screens/mainScreens/home_screen.dart';
import 'package:bnparisbas/widgets/virement_beneficaire.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/crossScreens/ajout_beneficaire.dart';
import './screens/crossScreens/beneficaire_detail.dart';
import './screens/mainScreens/accueille_screen.dart';
import './screens/mainScreens/aide_screen.dart';
import './screens/mainScreens/assurance_screen.dart';
import './screens/mainScreens/astuces_screen.dart';
import './screens/mainScreens/bourse_screen.dart';
import './screens/mainScreens/comptes_cartes_screen.dart';
import './screens/mainScreens/contacter_conseiller_screen.dart';
import './screens/mainScreens/empreinte_carbone_screen.dart';
import './screens/mainScreens/login_screen.dart';
import './screens/mainScreens/offres_screen.dart';
import './screens/mainScreens/paimenet_mobile_screen.dart';
import './screens/mainScreens/parrainage_screen.dart';
import './screens/mainScreens/piloter_epargne_screen.dart';
import './screens/mainScreens/rib_screen.dart';
import './screens/mainScreens/securite_screen.dart';
import './screens/mainScreens/suivi_demande_screen.dart';
import './screens/mainScreens/virements_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => VirementProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        )
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
          primaryColor: const Color.fromARGB(255, 26, 188, 156),
          colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color.fromARGB(255, 44, 53, 64)),
          //accentColor: Color.fromARGB(255, 44, 53, 64),
        ),
        home: /* const AccueilScreen(), */  const HomeScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          AccueilScreen.routeName: (ctx) => const AccueilScreen(),
          CompteCartesScreen.routeName: (ctx) => const CompteCartesScreen(),
          PiloterMonEpargneScreen.routeName: (ctx) =>
              const PiloterMonEpargneScreen(),
          VirementsScreen.routeName: (ctx) => const VirementsScreen(),
          PaimenetMobileScreen.routeName: (ctx) => const PaimenetMobileScreen(),
          OffresScreen.routeName: (ctx) => const OffresScreen(),
          RIBScreen.routeName: (ctx) => const RIBScreen(),
          ContacterConseillerScreen.routeName: (ctx) =>
              const ContacterConseillerScreen(),
          BourseScreen.routeName: (ctx) => const BourseScreen(),
          EmpreinteCarboneScreen.routeName: (ctx) =>
              const EmpreinteCarboneScreen(),
          AssuranceScreen.routeName: (ctx) => const AssuranceScreen(),
          SuiviDemandeScreen.routeName: (ctx) => const SuiviDemandeScreen(),
          ParrainageScreen.routeName: (ctx) => const ParrainageScreen(),
          AstucesScreen.routeName: (ctx) => const AstucesScreen(),
          AideScreen.routeName: (ctx) => const AideScreen(),
          SecuriteScreen.routeName: (ctx) => const SecuriteScreen(),
          BeneficaireDetail.routeName: (ctx) => const BeneficaireDetail(),
          BeneficaireAddOne.routeName: (ctx) => const BeneficaireAddOne(),
          VirementBenefaicaireList.routeName: (ctx) =>
              const VirementBenefaicaireList(),
          SlelectAcountDistination.routeName: (ctx) =>
              const SlelectAcountDistination(),
          CompteDeChequeScreen.routeName: (ctx) => const CompteDeChequeScreen(),
          DownloadRIB.routeName: (ctx) => const DownloadRIB(),
          ProfilScreen.routeName: (ctx) => const ProfilScreen(),
          OffresLesCartes.routeName: (ctx) => const OffresLesCartes(),
          DetailsVisaCards.routeName: (ctx) => const DetailsVisaCards(),
          CardInDetail.routeName: (ctx) => const CardInDetail(),
          //CompteCartes.routeName: (ctx) => const CompteCartes(),
          // RIBChequesDocuments.routeName: (ctx) => const RIBChequesDocuments(),
          // InfiniteVisaCard.routeName: (ctx) => const InfiniteVisaCard(),
          // CartCryptogrammeDynmq.routeName: (ctx) => const CartCryptogrammeDynmq(),
          // PremierVisaCard.routeName: (ctx) => const PremierVisaCard(),
        },
      ),
    );
  }
}
