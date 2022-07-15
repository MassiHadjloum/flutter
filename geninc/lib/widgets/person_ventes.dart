import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';

class PersonVentes extends StatefulWidget {
  final Map<String, Object> ventes;
  const PersonVentes({
    required this.ventes,
    Key? key,
  }) : super(key: key);

  @override
  _PersonVentesState createState() => _PersonVentesState();
}

class _PersonVentesState extends State<PersonVentes> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      //height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("jour: ${widget.ventes['day']}"),
          SizedBox(
            width: 70,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '${widget.ventes['ventes']}',

                contentPadding: const EdgeInsets.all(2),
                //fillColor: primaryColor,
                focusColor: primaryColor,
                hoverColor: primaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: primaryColor, width: 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
