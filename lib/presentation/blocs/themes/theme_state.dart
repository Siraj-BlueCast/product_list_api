import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class DarkThemeState extends ThemeState {
  final ThemeData themeData;
  const DarkThemeState(this.themeData);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}

class LightThemeState extends ThemeState {
  final ThemeData themeData;
  const LightThemeState(this.themeData);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}