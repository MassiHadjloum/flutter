import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';

class IncrementTasbih extends StatelessWidget {
  final Function increment;
  const IncrementTasbih({
    Key? key,
    required this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => increment(),
      splashColor: primaryColor,
      child: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          border: Border.all(width: 7, color: secondaryColor),
          borderRadius:  BorderRadius.circular(300),// .all(Radius.elliptical(300, 310)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: Image.asset(
            "assets/images/mousabih.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

