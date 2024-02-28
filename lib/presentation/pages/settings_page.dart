import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_list/presentation/blocs/themes/theme_bloc.dart';
import 'package:flutter_product_list/presentation/blocs/themes/theme_event.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Settings'),),
      body:  Row(children: [const Text('Change Theme'),
      Switch(value: isLightTheme , onChanged: (value){
        setState(() {
          isLightTheme = value;
        });

        if (value) {
          BlocProvider.of<ThemeBloc>(context).add(ChangeDarkThemeEvent());
        }else{
         
           BlocProvider.of<ThemeBloc>(context).add(ChangeLightThemeEvent());
        }
      })]),
    );
  }
}

bool isLightTheme = false;

  void toggleTheme() {
     isLightTheme = !isLightTheme;
  }