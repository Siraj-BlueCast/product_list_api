import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_list/dependency_injection/dependency_injection.dart';
import 'package:flutter_product_list/core/my_colors.dart';
import 'package:flutter_product_list/presentation/blocs/products/product_bloc.dart';
import 'package:flutter_product_list/presentation/blocs/themes/theme_bloc.dart';
import 'package:flutter_product_list/presentation/blocs/themes/theme_state.dart';
import 'package:flutter_product_list/presentation/pages/home_page.dart';
import 'package:flutter_product_list/presentation/pages/settings_page.dart';
import 'package:flutter_product_list/presentation/pages/voucher_page.dart';
import 'package:flutter_product_list/presentation/pages/wallet_page.dart';

void main() {
 setUpDI();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => getIt<ProductBloc>(),),
        BlocProvider(create: (context) => ThemeBloc(),)
      ],
  
        child:  BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {  
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state is  DarkThemeState ? ThemeSetup.darkTheme : ThemeSetup.lightTheme,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
          }
        ),
     
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> selectedPage = [
    HomePage(),
    VoucherPage(),
    WalletPage(),
    SettingsPage()
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: selectedPage[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(items:  [
        BottomNavigationBarItem(icon: const Icon(Icons.home),label: 'Home',backgroundColor: Theme.of(context).extension<MyColors>()?.navBarBG),
        BottomNavigationBarItem(icon: const Icon(Icons.confirmation_num), label: 'Voucher',backgroundColor: Theme.of(context).extension<MyColors>()?.navBarBG),
        BottomNavigationBarItem(icon: const Icon(Icons.account_balance_wallet), label:  'Wallet',backgroundColor: Theme.of(context).extension<MyColors>()?.navBarBG),
        BottomNavigationBarItem(icon: const Icon(Icons.settings),label: 'Settings',backgroundColor: Theme.of(context).extension<MyColors>()?.navBarBG)
      ],
      currentIndex: _selectedIndex,
      onTap: onItemTap,
      selectedItemColor: Theme.of(context).extension<MyColors>()?.navBarSelectedItem,
      unselectedItemColor: Theme.of(context).extension<MyColors>()?.navBarUnSelectdItem,),
    );
  }
}
