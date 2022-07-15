import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = ITEMS_DRAWER;
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, idx) => InkWell(
                  splashColor: primaryColor,
                  onTap: () => Navigator.of(context)
                      .pushNamed(items[idx]['routeName'] as String),
                  child: ListTile(
                    leading: Icon(items[idx]['icon'] as IconData),
                    title: Text(items[idx]['title'] as String),
                  ),
                ),
                itemCount: items.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
