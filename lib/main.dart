import 'package:flutter/material.dart';
import 'package:flutter_product_list/pages/home_page.dart';
import 'package:flutter_product_list/pages/settings_page.dart';
import 'package:flutter_product_list/pages/voucher_page.dart';
import 'package:flutter_product_list/pages/wallet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: 'Voucher',backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label:  'Wallet',backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings',backgroundColor: Colors.black)
      ],
      currentIndex: _selectedIndex,
      onTap: onItemTap,
      selectedItemColor: Colors.amberAccent,),
    );
  }
}
