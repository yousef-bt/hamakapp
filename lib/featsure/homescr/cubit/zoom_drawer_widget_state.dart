part of 'zoom_drawer_widget_cubit.dart';

@immutable
class ZoomDrawerWidgetCubit extends Cubit<ZoomDrawerWidgetState> {
  ZoomDrawerWidgetCubit() : super(ZoomDrawerWidgetState.initial());

  void selectMenuItem(MenuItemData item) {
    emit(state.copyWith(currentItem: item));
  }

  void drawerState(bool theState) {
    emit(state.copyWith(isDrawerOpen: theState));
    print(" @@@@@@@@@@@@@@@@@ this after cubit  ${state.isDrawerOpen}");
  }
}
