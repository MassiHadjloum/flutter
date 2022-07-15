// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/model/ville.dart';
import 'package:geninc/providers/terrain_provider.dart';
import 'package:geninc/widgets/row_list_ville.dart';
import 'package:geninc/widgets/ville.dart';
import 'package:provider/provider.dart';

class TabVille extends StatefulWidget {
  final String statut_terrain;
  const TabVille({Key? key, required this.statut_terrain}) : super(key: key);

  @override
  State<TabVille> createState() => _TabVilleState();
}

class _TabVilleState extends State<TabVille> {
  final _controller = TextEditingController();
  List<List<Ville>>? villes;

  @override
  void initState() {
    switch (widget.statut_terrain) {
      case ALL:
        villes = listVille(ALL); // [VILLES]; //  VILLES;
        break;
      case EN_COUR_DE_VISITE:
        villes = listVille(EN_COUR_DE_VISITE);
        break;
      case VISITEE:
        villes = listVille(VISITEE);
        break;
    }
    super.initState();
  }

  List<List<Ville>> prepareHoleList() {
    List<List<Ville>> list = [];
    VILLES.sort((a, b) => a.compare(a, b));
    //print(VILLES);
    int start, end;
    const alpha = 'ABCDEFJHIGKLMNOPQRSTUVWXYZ';
    alpha.split('').forEach((e) {
      start = VILLES.indexWhere((ville) => ville.name[0] == e);
      end = VILLES.lastIndexWhere((ville) => ville.name[0] == e);
      if (start != -1 && end != -1) {
        print("$start, $end, $e, ");
        list.add(VILLES.sublist(start, end + 1));
      }
    });
    return list;
  }


  List<List<Ville>> listVille(String filter) {
    //return VILLES.where((vl) => vl.statut == filter).toList();
    List<List<Ville>> list = [];
    list = prepareHoleList();
    if (filter == ALL) {
      return list;
    }
    list.forEach((el_list) 
    { 
      el_list = el_list.where((vl) => vl.statut == filter).toList();
    },);

    return list;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void searchVille(String name) {
    if (name != "") {
      List<List<Ville>> list = [];
      list = villes!
          .where(
              (list) => list[0].name[0].toLowerCase() == name[0].toLowerCase())
          .toList();
      list.forEach((vl_list) {
        vl_list = vl_list.where((ville) => ville.name.contains(name)).toList();
      });
      print("$name $list");

      setState(() {
        villes = list;
      });
    } else {
      setState(() {
        villes = villes;
      });
    }
  }

  void vill() {
    VILLES.sort((a, b) => a.compare(a, b));
    //print(VILLES);
    var list = [];
    int start, end;
    const alpha = 'ABCDEFJHIGKLMNOPQRSTUVWXYZ';
    alpha.split('').forEach((e) {
      start = VILLES.indexWhere((ville) => ville.name[0] == e);
      end = VILLES.lastIndexWhere((ville) => ville.name[0] == e);
      if (start != -1 && end != -1) {
        print("$start, $end, $e, ");
        list.add(VILLES.sublist(start, end + 1));
      }
      // VILLES.indexWhere((ville) => ville.name[0] == e),
      //VILLES.lastIndexWhere((ville) => ville.name[0] == e),
      //));
    });
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    //vill();
    print(villes);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
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
              onChanged: (value) => searchVille(value),
            ),
          ),
          Container(
            height: 1000,
            child: ListView(
              children: villes!.where((e) => e.isNotEmpty).map(
                (el) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                    padding: const EdgeInsets.only(top: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                      /* gradient: const LinearGradient(
                          colors: [Colors.cyan, Colors.blueGrey],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          //stops: [0.4, 0.7],
                          tileMode: TileMode.repeated,
                        ), */
                    ),
                    child: RowListVille(list: el),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
/* 

 List<Map<String, List<Ville>>> search;
    final alpha = name[0].toUpperCase();
    print("alpha $alpha");
    if (name == "") {
      search = HOLELIST;
    } else {
      search = HOLELIST.where((map) {
        final input = name.toLowerCase();
        return map.keys.first == name[0].toUpperCase();
      }).toList();
      print(search);

      final lis = search[0];

      lis[alpha]!.where((vl) => vl.name.contains(name)).toList();
      //search[0][alpha] = lis;
      print("liss ${search[0]}");
      print("liss ${lis}");
      //search[0].update(alpha, (value) => value = lis[alpha]!);
      /* map.update(
          name[0].toUpperCase(),
          (value) {
            print("$name $value");
            return value.where((vl) => vl.name.contains(name)).toList();
          },
        ); */
      // });
      //print(search);
    }

    /* HOLELIST.map((map) =>
        map.values.first
            .where((ville) {
              return
                ville.name.toLowerCase().contains(name.toLowerCase()) &&
                ville.statut == widget.statut_terrain;
            }).toList();
        }
    });  */

    //return map.keys.first == name[0] && map.values.contains(list);// ville.name.toLowerCase().contains(input) &&
    //ville.statut == widget.statut_terrain;
    //.toList();
    /* setState(() {
      villes = search;
    }); */


ListView(
                  children: HOLELIST
                      .where((e) => e.values.first.isNotEmpty)
                      .map((el) => Text('${el.keys.first} '))
                      .toList())


                      List<List<Ville>>? listVille(String filter) {
    //return VILLES.where((vl) => vl.statut == filter).toList();
    List<List<Ville>> list = [];
     VILLES.sort((a, b) => a.compare(a, b));
    //print(VILLES);
    int start, end;
    const alpha = 'ABCDEFJHIGKLMNOPQRSTUVWXYZ';
    alpha.split('').forEach((e) {
      start = VILLES.indexWhere((ville) => ville.name[0] == e);
      end = VILLES.lastIndexWhere((ville) => ville.name[0] == e);
      if (start != -1 && end != -1) {
      print("$start, $end, $e, ");
        list.add(VILLES.sublist(start, end+1));
      
   /*  List<Map<String, List<Ville>>> list = [];
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    alphabet.split('').forEach((alpha) {
      list.add({alpha: []});
    });
    HOLELIST.forEach((map) {
      final alpha = map.keys.first;
      int idx = list.indexWhere((element) => element.keys.first == alpha);
      list[idx].update(alpha, (value) {
        value.addAll(
            map.values.first.where((vl) => vl.statut == filter).toList());
        return value;
      }); // addAll(map.values.first.where((vl) => vl.statut == filter).toList());
    }); */
    return list;
    /*  return HOLELIST
        .where((maplist) => maplist.values.first
            .where((element) => (vl) => vl.statut == filter))
        .toList();
    return list.map((mapList) {
      mapList.values.first.where((vl) => vl.statut == filter).toList();
    }).toList(); */
    /* .where((vl) => vl.values.first.where(
        (element) =>
          element.statut == filter
    ) ).toList(); */
  }

 */
