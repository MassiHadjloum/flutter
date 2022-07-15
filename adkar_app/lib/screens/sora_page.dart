import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as qoran;

class SoraPage extends StatelessWidget {
  static const routeName = "/sora_page";
  const SoraPage({Key? key}) : super(key: key);

  Widget _buildInfoSora(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final soraidx = ModalRoute.of(context)!.settings.arguments as int;
    final ayat = qoran.getVerseCount(soraidx);
    final place =
        qoran.getPlaceOfRevelation(soraidx) == "Makkah" ? "مكية" : "مدنية";
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    //final background = isNightMode ? Colors.black87 : secondcolor;

    return Scaffold(
      appBar: AppBar(
        /* flexibleSpace: const Image(
          image: AssetImage('assets/images/surah-header-bg.png'),
          fit: BoxFit.fill,
        ), */
        title: Text("سورة ${qoran.getSurahNameArabic(soraidx)}"),
        actions: [
          _buildInfoSora(place),
          const VerticalDivider(
            width: 1,
            color: whitingcolor,
            endIndent: 10,
            indent: 10,
          ),
          _buildInfoSora("$ayat أيات"),
          const SizedBox(width: 20),
        ],
        backgroundColor: secondaryColor,
      ),
      backgroundColor: isNightMode ? secondaryColor : qoranmenuColor,
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            /* decoration: BoxDecoration(
              border: Border.all(width: 2, color: primaryColor),
              borderRadius: BorderRadius.circular(25),
              color:  background,
            ), */
            child: AyatSora(
              ayat: ayat,
              soraidx: soraidx,
              textColor: textColor,
            )),
      ),
    );
  }
}

class AyatSora extends StatelessWidget {
  const AyatSora({
    Key? key,
    required this.ayat,
    required this.soraidx,
    required this.textColor,
  }) : super(key: key);

  final int ayat;
  final int soraidx;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final isNight = Provider.of<ParametresProvider>(context).getNightMode;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            qoran.basmala,
            style: TextStyle(
                fontSize: 30,
                color: isNight ? sky[1] : secondaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          child: RichText(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '',
              children: <TextSpan>[
                for (var i = 0; i < ayat; i++) ...{
                  TextSpan(
                    text: qoran.getVerse(soraidx, i + 1, verseEndSymbol: false),
                    style: TextStyle(
                        fontFamily: 'Qoran2',
                        fontSize: 22,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: qoran.getVerseEndSymbol(i + 1),
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: opacityPrimaryColor,
                    ),
                  ),
                },
              ],
            ),
          ),
        ),
      ],
    );
  }
}
