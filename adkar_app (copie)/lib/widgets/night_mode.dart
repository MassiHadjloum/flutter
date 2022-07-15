import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/divider.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

class NightMode extends StatefulWidget {
  const NightMode({Key? key}) : super(key: key);

  @override
  State<NightMode> createState() => _NightModeState();
}

class _NightModeState extends State<NightMode> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  Widget _buildSwitch(dynamic provider) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15.0),
      width: 155,
      height: 70,
      child: LiteRollingSwitch(
        colorOn: opacityPrimaryColor,
        colorOff: secondaryColor,
        textOff: "قاتم",
        textOn: "فاتح",
        textSize: 12.0,
        iconOn: Icons.nightlight_round,
        iconOff: Icons.wb_sunny_rounded,
        value: provider.getNightMode,
        onChanged: (value) {
          provider.activeateNightMode(value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final mediaquery = MediaQuery.of(context).size;
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    return SizedBox(
      child: Column(
        children: <Widget>[
          const MyDivider(),
          _buildSwitch(provider),
        ],
      ),
    );
  }
}
