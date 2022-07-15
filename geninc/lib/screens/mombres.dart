import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/model/person.dart';
import 'package:geninc/widgets/appbar.dart';
import 'package:geninc/widgets/my_drawer.dart';
import 'package:geninc/widgets/search.dart';
import 'package:geninc/widgets/single_person.dart';

class Members extends StatefulWidget {
  static const routeName = '/members';
  const Members({Key? key}) : super(key: key);

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  final _controller = TextEditingController();
  late List<Person> personnes_list;

  @override
  void initState() {
    personnes_list = personnes;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void searchPerson(String name) {
    List<Person> list = [];
    if (name != "") {
      list = personnes
          .where((pr) => pr.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
      setState(() {
        personnes_list = list;
      });
    } else {
      setState(() {
        personnes_list = personnes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Mombres',
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'personne',

                  contentPadding: const EdgeInsets.all(2),
                  //fillColor: primaryColor,
                  focusColor: primaryColor,
                  hoverColor: primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: primaryColor, width: 1),
                  ),
                ),
                onChanged: (value) => searchPerson(value),
              ),
            ),
            Container(
              height: 700, //media.height * .9,
              child: ListView.builder(
                itemBuilder: (ctx, idx) =>
                    SinglePerson(person: personnes_list[idx]),
                itemCount: personnes_list.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
