import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String title;
  final Widget? otherChild;
  const HeaderImage({
    Key? key,
    required this.title,
    this.otherChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //alignment: Alignment.center,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      child: Stack( 
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            /*  borderRadius: const BorderRadius.only(
              bottomLeft: Radius.elliptical(60, 30),
              bottomRight: Radius.elliptical(60, 30),
            ), 
            */
            child: Image.asset("assets/images/islamic-bg2.jpg", width: double.infinity, fit: BoxFit.fill,),
          ), 
          Align(
            child : otherChild ?? Container(height: 40,)),        
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
