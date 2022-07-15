import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AdkarYawm extends StatelessWidget {
  const AdkarYawm({ Key? key }) : super(key: key);
  static const routeName = '/adkar_yawm';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
        final provider = Provider.of<ParametresProvider>(context);

    return Scaffold(
      //appBar: MyAppBar(title: title),
      backgroundColor: provider.getNightMode ? secondaryColor : whitingcolor,
      //drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: secondcolor,
            automaticallyImplyLeading: false,
            expandedHeight: 160,// mediaQuery.height * .2,
            //floating: true,
            //pinned: false,
            /* flexibleSpace: FlexibleSpaceBar(
              background: imageUrl != ""
                  ? Stack(
                      children: <Widget>[
                        Image.asset(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          //height: 160,
                        ),
                        const Text(
                          "bbbbbb",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : null,
            ), */
          ),
          SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              height: mediaQuery.height * .8,
              //child:  const AdkarYawmm(),
            ),
            childCount: 10,
            
          ),
        ),
        ],
      ),
    );
  }
}