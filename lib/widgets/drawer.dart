import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/widgets/drawer_profile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  final String? title;
  final double? offset;
  const MyDrawer({Key? key, this.title, this.offset}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget _buildContainer(
      [Widget? child, double? height, double? padding, Color? color]) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: padding!),
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blueGrey),
        color: color,
      ),
      child: child,
    );
  }

  var controller = ScrollController();

  void _scroll(double? position) {
    controller.jumpTo(position!);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.offset != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        _scroll(widget.offset);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //_scroll(100.1);
    final _itemsDrawer = itemsDrawer;
    return Drawer(
      child: Column(
        children: <Widget>[
          _buildContainer(
              const DrawerProfile(), 130, 20, Theme.of(context).primaryColor),
          SingleChildScrollView(
            //controller: controller,
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.amber)),
              margin: const EdgeInsets.only(top: 0),
              padding: const EdgeInsets.only(top: 0),
              height: MediaQuery.of(context).size.height * .725,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemBuilder: (ctx, idx) => Ink(
                              color:
                                  widget.title == _itemsDrawer[idx]['routeName']
                                      ? Colors.black12
                                      : null,
                              child: ListTile(
                                leading:
                                    Icon(_itemsDrawer[idx]['icon'] as IconData),
                                title: Text(
                                  _itemsDrawer[idx]['title'] as String,
                                  style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      _itemsDrawer[idx]['routeName'] as String,
                                      arguments: <String, Object?>{
                                        
                                          'offset': controller.offset,
                                          'beneficaire': null,
                                          
                                      });
                                },
                                selected: widget.title ==
                                        _itemsDrawer[idx]['routeName']
                                    ? true
                                    : false,
                                selectedColor: Theme.of(context).primaryColor,
                              ),
                            ),
                        itemCount: itemsDrawer.length),
                  ),
                ],
              ),
            ),
          ),
          _buildContainer(
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.logout_rounded, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Me déconnecter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'OpenSans'),
                  )
                ]),
            60,
            1,
            Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
