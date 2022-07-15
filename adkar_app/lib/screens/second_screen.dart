import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/constants/index_msg.dart';
import 'package:adkar_app/constants/reuse_components.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  void goNext(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const MyHomePage(),
      ),
    );
  }

  var message = "";
  var image = "";
  void displayMessage() {
    switch (whichMessageToDisplayHijri()) {
      case TypeMessageHijri.RAMADHAN:
        message = RAMADHAN;
        image = "assets/images/ramadhan.png";
        break;
      case TypeMessageHijri.FIN_RAMADHAN:
        message = FIN_RAMADHAN;
        image = "assets/images/ramadhan.png";
        break;
      case TypeMessageHijri.AAID_FITRE:
        message = AAID_FITRE;
        image = "assets/images/eid.png";
        break;
      case TypeMessageHijri.MIDDLE_CHAWWAL:
        message = MIDDLE_CHAWWAL;
        image = "assets/images/ic_launcher/mipmap-xxhdpi/ic_launcher.png";
        break;
      case TypeMessageHijri.ONE_8_DOU_LHIJA:
        message = ONE_8_DOU_LHIJA;
        image = "assets/images/ic_launcher/mipmap-xxhdpi/ic_launcher.png";
        break;
      case TypeMessageHijri.NINE_DOU_LHIJA:
        message = NINE_DOU_LHIJA;
        image = "assets/images/ic_launcher/mipmap-xxhdpi/ic_launcher.png";
        break;
      case TypeMessageHijri.AAIDE_ADHA:
        message = AAIDE_ADHA;
        image = "assets/images/eid.png";
        break;
      case TypeMessageHijri.MIDDLE_EVERY_MOUNTH:
        message = MIDDLE_EVERY_MOUNTH;
        image = "assets/images/ic_launcher/mipmap-xxhdpi/ic_launcher.png";

        break;
      case TypeMessageHijri.LAST_DOU_LHIJA:
        message = LAST_DOU_LHIJA;
        image = "assets/images/sanahijri.png";

        break;
      case TypeMessageHijri.NOTHING:
        message = "";
        

        break;
    }

    switch (whichMessageToDisplayMiladi()) {
      case TypeMessageMiladi.YENNAYER:
        message = "$message \n\n $YENNAYER";
        image = "assets/images/bonneannee.png";

        break;
      case TypeMessageMiladi.FIN_DECEMBRE:
        message = "$message \n\n $FIN_DECEMBRE";
        image = "assets/images/bonneannee.png";

        break;
      case TypeMessageMiladi.AMULI:
        message = "$message \n\n $AMULI";
        image = "assets/images/amuli.png";

        break;
      case TypeMessageMiladi.NOTHING:
        message = message;
        //image = "assets/images/logoapp.png";

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    displayMessage();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        //margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          gradient: getliniarGradiantTwo(darkergridiant),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                height: mediaquery.height * .3,
                width: mediaquery.width * .5, 

              ),
              SizedBox(height: mediaquery.height * .1),
              Card(
                elevation: 4,
                child: Container(
                  width: mediaquery.width * .9,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goNext(context),
        child: const Icon(Icons.arrow_forward_outlined),
        backgroundColor: primaryColor,
      ),
    );
  }
}
