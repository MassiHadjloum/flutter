import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:adkar_app/providers/dikr_provider.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:adkar_app/widgets/my_alertdialoge_fr.dart';
import 'package:adkar_app/widgets/slivers_adkar_screenbody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdkarYawm extends StatefulWidget {
  static const routeName = '/adkar_yawm';
  const AdkarYawm({Key? key}) : super(key: key);

  @override
  State<AdkarYawm> createState() => _AdkarYawmState();
}

class _AdkarYawmState extends State<AdkarYawm> {
  var _init = false;
  List<Dikr> _adkar = [];
  
  dynamic args;
  var title = "";
  var imageUrl = "";

  prepareListDikr(String mode) {
    switch (mode) {
      case "أذكار الصباح":
        _adkar = [...Data.adkarsabah];
       
        break;
      case "أذكار المساء":
        _adkar = [...Data.adkarmassa];
       
        break;
      case "أذكار الإستيقاظ":
        _adkar = [...Data.adkaristiqadh];
        
        break;
      case "أذكار النوم":
        _adkar = [...Data.adkarnawm];
       
        break;
      case "أذكار بعد الصلاة":
        _adkar = [...Data.adkarsalat];
        
        break;
      case "أذكار الآذان":
        _adkar = [...Data.adkaradan];
        break;
      case "أذكار المسجد":
        _adkar = [...Data.adkarmasjid];
        break;
      case "أذكار الوضوء":
        _adkar = [...Data.adkarwodho];
        break;
      case "أذكار المنزل":
        _adkar = [...Data.adkarmanzil];
        break;
      case "أذكار الطعام":
        _adkar = List<Dikr>.from(Data.adkartaam);
        break;
      case "أذكار الخلاء":
        _adkar = [...Data.adkarkhala];
        break;
      case "أذكار الصلاة":
        _adkar = [...Data.adkarsalatt];
        break;
      case "أذكار السفر":
        _adkar = [...Data.adkarsafar];
        break;
      case "أذكار الحج":
        _adkar = [...Data.adkarhaj];
        break;
      case "أذكار متفرقة":
        _adkar = [...Data.adkarOkhra];
        break;
    }
  }

  @override
  void didChangeDependencies() {
    if (!_init) {
      args = ModalRoute.of(context)!.settings.arguments as Map;
      title = args["title"]!;
      imageUrl = args["imageUrl"]!;
      prepareListDikr(title);
      _init = true;
    }
    super.didChangeDependencies();
  }

  Future<bool?> _buildDialogConfirmation(
    BuildContext context,
    Color textColor,
    bool isNightMode,
  ) async {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => MyAlertDialogue(
        ctx: ctx,
        textDialogue: "لم تنتهي بعد، هل تريد الخروج ؟",
        textColor: textColor,
        isNightMode: isNightMode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
   // final scrollDirection = provider.getScrollDirection;
    //final mediaQuery = MediaQuery.of(context).size;
    provider.initializeAllTikrars(_adkar);

    return WillPopScope(
      onWillPop: () async {
        var pop;
        if (provider.getAllTikrars > 0) {
          pop = await _buildDialogConfirmation(context, textColor, isNightMode);
          Provider.of<DikrProvider>(context, listen: false).hide(false);
        } else {
          pop = false;
        }
        return pop ?? false;
      },
      child: Scaffold(
        appBar: MyAppBar(title: title),
        backgroundColor:  provider.getNightMode ? secondaryColor : whitingcolor,
        //drawer: const MyDrawer(),
        body: SliversAdkarScreenBody(
          adkar: _adkar,
        
          title: title,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}


 
/* 
  /*  Widget _buildItem(Dikr item, int index, Animation<double> animation) {
    return DikrItem(
      dikr: item, //_adkar[idx],
      animation: animation,
      onDeleteItem: () => removeItem(index),
    );
  }

  void removeItem(int idx) {
    final currentdikr = _adkar.removeAt(idx);
    _listkey.currentState!.removeItem(
      idx,
      (context, animation) => _buildItem(currentdikr, idx, animation),
      duration: const Duration(milliseconds: 1100),
    );
    if (_adkar.length == 0) {
      Timer(const Duration(milliseconds: 1100), () {
        Navigator.of(context).pushNamed(AdkarGridBtns.routeName);
      });
    }
  } */

  /* Widget _buildMessage() {
    final idx = Random().nextInt(_messages.length);
    return !_hideMsg
        ? Align(
            alignment: Alignment.topCenter,
            child: MessageForNina(message: _messages[idx]),
          )
        : Container();
  } */

  /* void hideMessage() {
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          _hideMsg = true;
        });
      }
    });
  } */


Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.orange[100 * (index % 9)],
                child: Text('orange $index'),
              );
Column(
              children: <Widget>[
                scrollDirection == Axis.vertical
                    ? Expanded(
                        child: AnimatedList(
                          //scrollDirection: Axis.horizontal, //provider.getScrollDirection,
                          key: _listkey,
                          initialItemCount: _adkar.length,
                          itemBuilder: (ctx, idx, animation) =>
                              _buildItem(_adkar[idx], idx, animation),
                        ), 
                      )
                    : Expanded(
                        child: AnimatedList(
                          scrollDirection: Axis.horizontal,
                          key: _listkey,
                          initialItemCount: _adkar.length,
                          itemBuilder: (ctx, idx, animation) =>
                              _buildItem(_adkar[idx], idx, animation),
                        ),
                      ),
              ],
            ),


Consumer<DikrProvider>(
              builder: (ctx, dikrprovider, ch) {
                //_adkar = dikrprovider.getAdkarSabahList;
                return AnimatedList(
                  key: _listkey,
                  itemBuilder: (ctx, idx, animation) => DikrItem(
                    dikr: _adkar[idx], //_adkar[idx],
                    animation: animation,
                    onDeleteItem: () =>
                        removeItem(ctx, _adkar[idx].id, idx, _adkar, dikrprovider),
                  ),
                  initialItemCount: _adkar.length,
                );
              },
            ),
*/