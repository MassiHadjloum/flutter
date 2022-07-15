import 'dart:async';
import 'dart:math';

import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:adkar_app/providers/dikr_provider.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/adkar_btn_grid.dart';
import 'package:adkar_app/widgets/dirk_item.dart';
import 'package:adkar_app/widgets/my_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliversAdkarScreenBody extends StatefulWidget {
  final List<Dikr> adkar;
  
  final String title;
  final String imageUrl;

  const SliversAdkarScreenBody({
    Key? key,
    required this.adkar,
    
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _SliversAdkarScreenBodyState createState() => _SliversAdkarScreenBodyState();
}

class _SliversAdkarScreenBodyState extends State<SliversAdkarScreenBody> {
  final _listkey = GlobalKey<AnimatedListState>();
  var _hideMsg = false;

  Widget _buildItem(Dikr item, int index, Animation<double> animation) {
    return DikrItem(
      dikr: item, //widget.adkar[idx],
      animation: animation,
      onDeleteItem: () => removeItem(index),
    );
  }

  void removeItem(int idx) {
    final currentdikr = widget.adkar.removeAt(idx);
    _listkey.currentState!.removeItem(
      idx,
      (context, animation) => _buildItem(currentdikr, idx, animation),
      duration: const Duration(milliseconds: 1100),
    );
    if (widget.adkar.length == 0) {
      Timer(const Duration(milliseconds: 1100), () {
        Navigator.of(context).pushNamed(AdkarGridBtns.routeName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final scrollDirection = provider.getScrollDirection;
    final mediaQuery = MediaQuery.of(context).size;
    final idx = Random().nextInt(Data.msgScreens.length);


    print(idx);
    return CustomScrollView(
      slivers: [
        if ( widget.imageUrl != '')
          MySliverAppBar(
            
            title: Data.msgScreens[idx],
            imageUrl: widget.imageUrl,
            hideMsg: _hideMsg,
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              //height: mediaQuery.height * .7,
              child: scrollDirection == 'vertical'
                  ? AnimatedList(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      key: _listkey,
                      initialItemCount: widget.adkar.length,
                      itemBuilder: (ctx, idx, animation) =>
                          _buildItem(widget.adkar[idx], idx, animation),
                    )
                  : SizedBox(
                      height: mediaQuery.height * .75,
                      child: AnimatedList(
                        scrollDirection: Axis.horizontal,
                        key: _listkey,
                        initialItemCount: widget.adkar.length,
                        itemBuilder: (ctx, idx, animation) =>
                            _buildItem(widget.adkar[idx], idx, animation),
                      ),
                    ),
            ),
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
