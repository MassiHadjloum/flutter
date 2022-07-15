import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/helpers/shared_prefs.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParametresProvider with ChangeNotifier {
  final List<Map<String, Object>> _listSize = [
    {'size': 18.0, 'checked': false},
    {'size': 20.0, 'checked': false},
    {'size': 24.0, 'checked': false},
    {'size': 26.0, 'checked': false},
  ];

  final List<List<Map<String, Object>>> _listColor = [
    [
      {'color': whitingcolor, 'checked': false},
      {'color': secondaryColor, 'checked': false}
    ],
    /*  [
      {'color': const Color.fromARGB(240, 251, 197, 49), 'checked': false},
      {'color': const Color.fromARGB(240, 140, 122, 230), 'checked': false},
    ], */
    [
      {'color': const Color.fromARGB(240, 39, 60, 117), 'checked': false},
      {'color': const Color.fromARGB(240, 232, 65, 24), 'checked': false}
    ]
  ];
  final List<List<Map<String, Object>>> _listColorBackground = [
    [
      {'color': whitingcolor, 'checked': false},
      {'color': secondaryColor, 'checked': false}
    ],
    /* [
      {'color': const Color.fromARGB(240, 251, 197, 49), 'checked': false},
      {'color': const Color.fromARGB(240, 140, 122, 230), 'checked': false},
    ], */
    [
      {'color': const Color.fromARGB(240, 39, 60, 117), 'checked': false},
      {'color': const Color.fromARGB(240, 232, 65, 24), 'checked': false}
    ]
  ];

  final List<Map<String, Object>> _listScrollmode = [
    {
      'icon': 'assets/images/scrollx.png',
      'checked': false,
      'axis': 'horizontal'
    },
    {'icon': 'assets/images/scrolly.png', 'checked': false, 'axis': 'vertical'}
  ];
  final List<Map<String, Object>> _listMenuType = [
    {'icon': 'assets/images/grid.png', 'checked': false, 'type': 'grid'},
    {'icon': 'assets/images/menu.png', 'checked': false, 'type': 'list'}
  ];

  var _size = 18.0;
  var _color = secondaryColor;
  var _scrollDirection = 'vertical';
  var _menuType = "grid";
  var _backgroundColor = whitingcolor;
  var _nightmode = false;

  //final _listparam = SavePreferences.getRefsParamAsMap();

  final listParams = {
    "nightmode": false,
    "size": 18,
    "color": secondaryColor,
    "scrollDirection": 'vertical',
    "menuType": "grid",
    "backgroundColor": whitingcolor,
  };

  // check if any of parameters is changed
  bool checkChangesParameters() {
    var change = true;
    listParams
        .forEach((key, value) => change &= value == Data.defaultParams[key]);
    return !change;
  }

  void _initialize(dynamic list, String? type, dynamic getter) {
    for (var element in list) {
      element.update('checked', (value) => value = element[type] == getter);
    }
  }

  void _initializeMatrix(dynamic list, String? mode, dynamic getter) {
    list.forEach((item) {
      item.forEach((subItem) {
        subItem.update('checked', (value) => value = subItem[mode] == getter);
      });
    });
  }

  void changeParamsList(dynamic list) {
    for (var element in list) {
      element.update('checked', (value) => value = false);
    }
  }

  void changeParamsMatrix(dynamic list) {
    list.forEach((item) {
      item.forEach((subItem) {
        subItem.update('checked', (value) => value = false);
      });
    });
  }

  void initializeParams() {
    _initialize(_listSize, 'size', getSize);
    _initialize(_listScrollmode, 'axis', getScrollDirection);
    _initializeMatrix(_listColor, 'color', getColor);
    _initializeMatrix(_listColorBackground, 'color', getBackgroungColor);
    _initialize(_listMenuType, 'type', getMenuType);
  }

  void resetParamsToDefault() {
    SavePreferences.setPrefsString(listParams['size'].toString(), 'size');
    SavePreferences.setPrefsString(
        listParams['scrollDirection'] as String, 'scrollDirection');
    SavePreferences.setPrefsString(listParams['color'].toString(), 'color');
    SavePreferences.setPrefsString(
        listParams['backgroundColor'].toString(), 'backgroundColor');
    SavePreferences.setPrefsString(
        listParams['menuType'] as String, 'menuType');
    initializeParams();
    /*  _initialize(_listSize, 'size', listParams['size']);
    _initialize(_listScrollmode, 'axis', listParams['scrollDirection']);
    _initializeMatrix(_listColor, 'color', listParams['color']);
    _initializeMatrix(_listColorBackground, 'color', listParams['backgroundColor']);
    _initialize(_listMenuType, 'type', listParams['menuType']); */
  }

  List<String> getInitialParamsValue() {
    return [
      SavePreferences.getPrefsString('size'),
      SavePreferences.getPrefsString('color'),
      SavePreferences.getPrefsString('scrollDirection'),
      SavePreferences.getPrefsString('menuType'),
      SavePreferences.getPrefsString('backgroundColor')
    ];
  }

  void cancelSaveParams() {}

  List<Map<String, Object>> get getListSize {
    return _listSize;
  }

  List<List<Map<String, Object>>> get getListColor {
    return _listColor;
  }

  List<List<Map<String, Object>>> get getListColorBackgound {
    return _listColorBackground;
  }

  List<Map<String, Object>> get getListScrollMode {
    return _listScrollmode;
  }

  List<Map<String, Object>> get getListMenuType {
    return _listMenuType;
  }

  double get getSize {
    final size = SavePreferences.getPrefsString('size');
    return size != '' ? double.parse(size) : _size;
  }

  Color get getColor {
    final color = SavePreferences.getPrefsString('color');
    return color != '' ? Color(int.parse(color.substring(6, 16))) : _color;
  }

  String get getScrollDirection {
    final scroll = SavePreferences.getPrefsString('scrollDirection');
    return scroll != '' ? scroll : _scrollDirection;
  }

  String get getMenuType {
    final menu = SavePreferences.getPrefsString('menuType');
    return menu != '' ? menu : _menuType; // _listparam['menuType'] as String;
  }

  Color get getBackgroungColor {
    final color = SavePreferences.getPrefsString('backgroundColor');
    return color != ''
        ? Color(int.parse((color).substring(6, 16)))
        : _backgroundColor;
  }

  void checkedRadio(int index) {
    final check = _listSize[index]['checked'] as bool;
    changeParamsList(_listSize);
    _listSize[index].update('checked', (checked) => checked = !check);
    _size = _listSize[index]['size'] as double;
    //listParams.update('size', (value) => value = _size);
    SavePreferences.setPrefsString(_size.toString(), 'size');
    notifyListeners();
  }

  void checkedRadioScrolling(int index) {
    final check = _listScrollmode[index]['checked'] as bool;
    changeParamsList(_listScrollmode);
    _listScrollmode[index].update('checked', (checked) => checked = !check);
    _scrollDirection = _listScrollmode[index]['axis'] as String;
    //listParams.update('scrollDirection', (value) => value = _scrollDirection);
    SavePreferences.setPrefsString(_scrollDirection, 'scrollDirection');
    notifyListeners();
  }

  void checkedRadioMenuType(int index) {
   
    final check = _listMenuType[index]['checked'] as bool;
    changeParamsList(_listMenuType);
    _listMenuType[index].update('checked', (checked) => checked = !check);
    _menuType = _listMenuType[index]['type'] as String;
    SavePreferences.setPrefsString(_menuType, 'menuType');
    //listParams.update('menuType', (value) => value = _menuType);
    notifyListeners();
  }

  void checkedRadioColor(int indexI, int indexJ) {
    final check = _listColor[indexI][indexJ]['checked'] as bool;
    changeParamsMatrix(_listColor);
    _listColor[indexI][indexJ].update('checked', (checked) => checked = !check);
    _color = _listColor[indexI][indexJ]['color'] as Color;
    //listParams.update('color', (value) => value = _color);
    SavePreferences.setPrefsString(_color.toString(), 'color');
    notifyListeners();
  }

  void checkedRadioBackgoundColor(int indexI, int indexJ) {
    final check = _listColorBackground[indexI][indexJ]['checked'] as bool;
    changeParamsMatrix(_listColorBackground);
    _listColorBackground[indexI][indexJ]
        .update('checked', (checked) => checked = !check);
    _backgroundColor = _listColorBackground[indexI][indexJ]['color'] as Color;
    SavePreferences.setPrefsString(
        _backgroundColor.toString(), 'backgroundColor');
    //listParams.update('backgroundColor', (value) => value = _backgroundColor);
    notifyListeners();
  }

  void saveParams() {
    SavePreferences.setPrefsString(_size.toString(), 'size');
    SavePreferences.setPrefsString(_scrollDirection, 'scrollDirection');
    SavePreferences.setPrefsString(_menuType, 'menuType');
    SavePreferences.setPrefsString(_color.toString(), 'color');
    SavePreferences.setPrefsString(
        _backgroundColor.toString(), 'backgroundColor');
    //SavePreferences.setRefsParam(listParams);
    notifyListeners();
  }

  bool get getNightMode {
    return SavePreferences.getNightMode();
  }

  void activeateNightMode(bool val) {
    _nightmode = val;
    SavePreferences.setNightMode(val);
    notifyListeners();
  }

  int _allTirars = 0;

  void initializeAllTikrars(List<Dikr> adkar) {
    _allTirars = adkar
        .map((e) => e.tikrar)
        .reduce((value, element) => value += element);
  }

  int get getAllTikrars {
    return _allTirars;
  }

  void reduceTikrarsByOne(){
    _allTirars = _allTirars - 1;
    notifyListeners(); 
  }
}
