import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DouaeScreen extends StatelessWidget {
  static const routeName = "adiya_menu/douae";
  DouaeScreen({Key? key}) : super(key: key);

  var _adiya = [];

  prepareListDouae(String mode) {
    switch (mode) {
      case "أدعية النبي صلى الله عليه وسلم":
        _adiya = [...Data.douaenabiy];
        break;
      case "الأدعية القرآنية":
        _adiya = [...Data.douaeqoran];
        break;
      case "أدعية الأنبياء":
        _adiya = [...Data.douaenabiy];

        break;
      case "دعاء ختم القرآن الكريم":
        _adiya = [...Data.khatmqoran];
        break;
      case "أدعية للميت":
        _adiya = [...Data.douaemoutawafa];
        break;
      case "أدعية بعد التشهد الأخير وقبل السلام":
        _adiya = [...Data.douaesalat];
        break;
      case "دعاء القنوت":
        _adiya = [...Data.douaqonout];
        break;
      case "أدعية أخرى":
        _adiya = [...Data.adiyaokhra];
        break;
      case "فضل الدعاء":
        _adiya = [...Data.fadhldouae];
        break;
      case "فضل الذكر":
        _adiya = [...Data.fadhldikr];
        break;
      case "فضائل السور":
        _adiya = [...Data.fadhlsowar];
        break;
      case "فضائل القرآن":
        _adiya = [...Data.fadhlqoran];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    final size = provider.getSize;
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    final title = ModalRoute.of(context)!.settings.arguments as String;
    prepareListDouae(title);
    return Scaffold(
      appBar: MyAppBar(title: title),
      backgroundColor: isNightMode ? secondaryColor : whitingcolor,
      body: Column(children: [
        Expanded(
          //height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemBuilder: (ctx, idx) => Column(
                    children: [
                      if (_adiya[idx].basmala != null)
                        Container(
                          margin: const EdgeInsets.only(top: 5, right: 10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            _adiya[idx].basmala,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: size, color: Colors.red),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10, top: 5),
                        margin: const EdgeInsets.only(bottom: 5),
                        alignment: Alignment.centerRight,
                        child: Text(
                          _adiya[idx].name,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: size, color: textColor),
                        ),
                      ),
                      if (_adiya[idx].faida != null)
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 5),
                          alignment: Alignment.centerRight,
                          child: Text(
                            _adiya[idx].faida,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: size - (size * .25),
                                color: primaryColor),
                          ),
                        ),
                      const Divider(
                        height: 2,
                        indent: 10,
                        endIndent: 10,
                        color: primaryColor,
                      )
                    ],
                  ),
              itemCount: _adiya.length),
        ),
      ]),
    );
  }
}

/**
 * 
 * adiya
                .map((item) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            item.name,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        const Divider(height: 2, indent: 10, endIndent: 10, color: primaryColor,),
                      ],
                    ))
                .toList(),
 * 
 * 
 */