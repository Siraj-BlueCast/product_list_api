import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_list/core/my_colors.dart';
import 'package:flutter_product_list/presentation/blocs/themes/theme_event.dart';
import 'package:flutter_product_list/presentation/blocs/themes/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState(ThemeData.light())) {
    on<ChangeLightThemeEvent>((event, emit) {
      emit(LightThemeState(ThemeSetup.lightTheme));
    });

    on<ChangeDarkThemeEvent>((event, emit) {
      emit(DarkThemeState(ThemeSetup.darkTheme));
    });
  }
  
}