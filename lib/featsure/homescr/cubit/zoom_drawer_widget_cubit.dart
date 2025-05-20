// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hamakapp/featsure/homescr/pages/homepage.dart';
import 'package:hamakapp/featsure/homescr/widget/moudle/custum_Zoom_Drawer_mudel.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'zoom_drawer_widget_state.dart';

class ZoomDrawerWidgetState extends Equatable {
  final MenuItemData currentItem;
  final bool isDrawerOpen;

  const ZoomDrawerWidgetState(
      {required this.currentItem, required this.isDrawerOpen});

  factory ZoomDrawerWidgetState.initial() =>
      ZoomDrawerWidgetState(currentItem: MenuItems.map, isDrawerOpen: false);

  ZoomDrawerWidgetState copyWith(
      {MenuItemData? currentItem, bool? isDrawerOpen}) {
    return ZoomDrawerWidgetState(
        currentItem: currentItem ?? this.currentItem,
        isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen);
  }

  List<Object?> get props => [currentItem, isDrawerOpen];
}
