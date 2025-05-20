import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MenuItemData extends Equatable {
  final String text;
  final IconData icon;

  const MenuItemData({required this.text, required this.icon});

  @override
  List<Object?> get props => [text]; 
}

class MenuItems {
  static const map = MenuItemData(text: "Home", icon: Icons.home);
  static const search = MenuItemData(text: "search", icon: Icons.search);
  static const program =
      MenuItemData(text: "program", icon: Icons.dataset_outlined);

  static const all = <MenuItemData>[map, search, program];
}
