// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final TypeItem? typeItem;

  MenuItem({required this.title, required this.icon, this.typeItem});
}

enum TypeItem {
  VIREMENT,
  RIB,
  CHEQUIER,
  TRIEROP,
  POINTEROP,
  CATEGOROP,
  LIBELLESET,
  LOGOUT
}

class MenuItems {
  static final List<MenuItem> itemsList = [
    MenuItem(
        title: "Faire un virement",
        icon: Icons.compare_arrows_rounded,
        typeItem: TypeItem.VIREMENT),
    MenuItem(
        title: "Télécharger un RIB",
        icon: Icons.upload_file_rounded,
        typeItem: TypeItem.RIB),
    MenuItem(
        title: "Commander un chéquier",
        icon: Icons.chat,
        typeItem: TypeItem.CHEQUIER),
    MenuItem(
        title: "Trier mes opération",
        icon: Icons.sort_rounded,
        typeItem: TypeItem.TRIEROP),
    MenuItem(
        title: "Pointer des opération",
        icon: Icons.edit_notifications_rounded,
        typeItem: TypeItem.POINTEROP),
    MenuItem(
        title: "Catégoriser des opération",
        icon: Icons.auto_fix_normal_rounded,
        typeItem: TypeItem.CATEGOROP),
    MenuItem(
        title: "Modifier la libellé du compte",
        icon: Icons.edit,
        typeItem: TypeItem.LIBELLESET),
    MenuItem(
        title: "Me déconnecter",
        icon: Icons.power_settings_new_rounded,
        typeItem: TypeItem.LOGOUT),
  ];

  

}
