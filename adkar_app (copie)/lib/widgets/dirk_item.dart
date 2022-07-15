import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/dikr_item_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DikrItem extends StatelessWidget {
  final Dikr dikr;
  final Animation<double>? animation;
  final VoidCallback? onDeleteItem;

  const DikrItem({
    Key? key,
    required this.dikr,
    this.animation,
    required this.onDeleteItem,
  }) : super(key: key);

  Widget _buildContainerCard(
    bool isNightMode,
    Color backgroungColor,
    double width,
    Widget child,
  ) {
    return Container(
      width: width,
     decoration: BoxDecoration(
      color: isNightMode ? Colors.black87 : backgroungColor,
      ),
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    final size = provider.getSize;
    final scrollDirection = provider.getScrollDirection;
    final color = provider.getColor;
    final backgroungColor = provider.getBackgroungColor;
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : color;
    final mediaQuery = MediaQuery.of(context).size;
    return scrollDirection == 'horizontal'
        ? SlideTransition(
            textDirection: TextDirection.ltr,
            transformHitTests: false,
            key: ValueKey(/* widget. */dikr.id),
            position: Tween<Offset>(
                    begin: const Offset(-1, 0), end: const Offset(0, 0))
                .animate(
              /* widget. */animation!,
            ),
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              /* shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ), */
              child: _buildContainerCard(
                isNightMode,
                backgroungColor,
                mediaQuery.width - 20,
                DikrBodyItem(
                    dikr: /* widget. */dikr,
                    onDeleteItem: /* widget. */onDeleteItem!,
                    size: size,
                    textColor: textColor),
                //_buildCardContent(size, textColor),
              ),
            ),
          )
        : Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
           /*  shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ), */
            child: _buildContainerCard(
              isNightMode,
              backgroungColor,
              mediaQuery.width - 20,
              scrollDirection == 'vertical'
                  ? SizeTransition(
                      sizeFactor: /* widget. */animation!,
                      child: DikrBodyItem(
                          dikr: /* widget. */dikr,
                          onDeleteItem:  /* widget. */onDeleteItem!,
                          size: size,
                          textColor: textColor),
                      //_buildCardContent(size, textColor),
                    )
                  : DikrBodyItem(
                      dikr: /* widget. */dikr,
                      onDeleteItem: /* widget. */onDeleteItem!,
                      size: size,
                      textColor: textColor),
              // _buildCardContent(size, textColor),
            ),
          );
  }
}
