// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hamakapp/featsure/homescr/pages/homepage.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'zoom_drawer_widget_state.dart';

class ZoomDrawerWidgetState extends Equatable {
  final MenuItemData currentItem;

  const ZoomDrawerWidgetState({required this.currentItem});

  factory ZoomDrawerWidgetState.initial() =>
      ZoomDrawerWidgetState(currentItem: MenuItems.map);

  ZoomDrawerWidgetState copyWith({MenuItemData? currentItem}) {
    return ZoomDrawerWidgetState(
      currentItem: currentItem ?? this.currentItem,
    );
  }

  List<Object?> get props => [currentItem];
}
