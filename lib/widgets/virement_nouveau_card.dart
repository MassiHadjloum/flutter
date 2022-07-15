import 'package:bnparisbas/models/beneficaires.dart';
import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/screens/crossScreens/select_acount_distination.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class VirementNouveauCard extends StatelessWidget {
  final Beneficaires beneficaire;
  const VirementNouveauCard({
    Key? key,
    required this.beneficaire,
  }) : super(key: key);

  Widget _buildCard(
      BuildContext context, bool applicable, List<Widget> children) {
    return Card(
      child: InkWell(
        onTap: applicable
            ? () {
                Navigator.of(context)
                    .pushNamed(SlelectAcountDistination.routeName);
              }
            : null,
        splashColor: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...children,
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> children, double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget _buildContainer(BuildContext context, Widget child) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: child,
    );
  }

  Widget _buildText(String text, double size, Color color, bool bold) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  String splitString(String source) {
    return source
        .split('')
        .mapIndexed((idx, elem) => idx % 4 == 0 ? elem = " $elem" : elem)
        .join('');
  }

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<AuthProvider>(context, listen: false).getUser['user'];
    return Column(
      children: <Widget>[
        _buildCard(context, false, [
          _buildContainer(
            context,
            _buildText("DEPUIS LE COMPTE", 15, Colors.white, true),
          ),
          _buildRow([
            _buildText("Compte de chèques", 16, Colors.black, true),
            _buildText("${user['sold']} €", 19, Colors.black, true)
          ], 10),
          _buildRow([
            _buildText(
                " ${user['IBAN'].substring(16, 27).replaceRange(0, 7, "**** **** ")} ",
                14,
                Colors.grey,
                false),
            _buildText(
                "Prévisionnel:  ${user['sold']} €", 14, Colors.grey, false),
          ], 10),
        ]),
        _buildCard(context, true, [
          _buildContainer(
              context,
              _buildRow([
                _buildText("VERS LE COMPTE", 15, Colors.white, true),
                const Icon(Icons.format_list_bulleted_rounded,
                    color: Colors.white),
              ], 0)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildText(beneficaire.name, 16, Colors.black, true),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildText(
                splitString(beneficaire
                    .IBAN), //.substring(16, 24).replaceRange(0, 4, "****"),
                14,
                Colors.grey,
                false),
          ),
        ]),
      ],
    );
  }
}
