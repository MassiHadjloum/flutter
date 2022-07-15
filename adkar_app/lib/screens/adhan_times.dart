import 'package:adkar_app/constants/data.dart';
//import 'package:adkar_app/providers/salat_times_provider.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
//import 'package:location/location.dart';
//import 'package:provider/provider.dart';

class AdhanTimes extends StatefulWidget {
  static const routeName = "/adhan_times";
  const AdhanTimes({Key? key}) : super(key: key);

  @override
  State<AdhanTimes> createState() => _AdhanTimesState();
}

class _AdhanTimesState extends State<AdhanTimes> {
  @override
  Widget build(BuildContext context) {
   
    //final providertimes = Provider.of<TimesSalatProvider>(context);
    // print("location ${providertimes.getLocation}");
    //providertimes.printTimer();
    return Scaffold(
      appBar: const MyAppBar(title: "mawaqit"),
      backgroundColor: whitingcolor,
      body: Container(
        color: secondcolor,
        height: 300,
        width: double.infinity,
        child: Column(

          children: const  [
          Text("salatgggggg")
          ],
        ),
      ),
    );
  }
}
