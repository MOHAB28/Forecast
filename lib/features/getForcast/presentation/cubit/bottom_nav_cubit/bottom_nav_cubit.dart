import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/layout/home/home_view.dart';
import '../../pages/layout/next_forcast/next_forcast_view.dart';
import '../../pages/layout/search/search_view.dart';

abstract class BottomNavStates {}

class BottomNavInitial extends BottomNavStates {}

class BottomNavChangeHome extends BottomNavStates {}

class BotomNavCubit extends Cubit<BottomNavStates> {
  BotomNavCubit() : super(BottomNavInitial());

  static BotomNavCubit get(context, {bool listen = true}) =>
      BlocProvider.of(context, listen: listen);

  int currentIndex = 0;
  List<Widget> screens = const [
    HomeView(),
    SearchView(),
    NextForcastView(),
  ];
  void changeCurrentIndex (int index) {
    currentIndex = index;
    emit(BottomNavChangeHome());
  }
}
