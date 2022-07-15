import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({ Key? key }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _controller = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: const EdgeInsets.all(15),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Ville',

                contentPadding: const EdgeInsets.all(2),
                //fillColor: primaryColor,
                focusColor: primaryColor,
                hoverColor: primaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: primaryColor, width: 1),
                ),
              ),
              //onChanged: (value) => searchVille(value),
            ),
          );
  }
}