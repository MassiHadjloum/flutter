import 'package:bnparisbas/screens/crossScreens/profile_screen.dart';
import 'package:flutter/material.dart';

class DrawerProfile extends StatelessWidget {
  const DrawerProfile({Key? key}) : super(key: key);

  Widget _buildText(String text, double size, bool bold) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProfilScreen.routeName);
      },
      splashColor: Colors.black, // Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
         Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              //b oxShadow: [BoxShadow(color: Colors.blueGrey, offset: Offset.zero)],
              image: DecorationImage(
                  image: AssetImage("assets/images/bnp_logo1.jpeg")),
              //border: Border.all(width: 2, color: Colors.white),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildText("M. HADJLOUM", 19, true),
              _buildText("Profil et paramètre", 14, false),
            ],
          )
        ],
      ),
    );
  }
}
