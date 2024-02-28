import 'package:flutter/material.dart';

class ThemeSetup {
  static ThemeData get lightTheme =>
      ThemeData.light().copyWith(extensions: <ThemeExtension<dynamic>>[
        MyColors(
            navBarSelectedItem: Colors.blue,
            navBarUnSelectdItem: Colors.black,
            discountPercentage: Colors.green,
            navBarBG: Colors.white)
      ]);

 static ThemeData get darkTheme =>
      ThemeData.dark().copyWith(extensions: <ThemeExtension<dynamic>>[
        MyColors(
            navBarSelectedItem: Colors.amberAccent,
            navBarUnSelectdItem: Colors.white,
            discountPercentage: Colors.orange,
            navBarBG: Colors.black)
      ]);

}

// ThemeData getAppTheme(bool isDarkTheme) {
//   return ThemeData(
//     extensions: <ThemeExtension<MyColors>>[
//       MyColors(
//           navBarSelectedItem:
//               isDarkTheme ? Colors.amberAccent : Colors.blueAccent,
//           discountPercentage: isDarkTheme ? Colors.orange : Colors.green,
//           navBarBG: isDarkTheme ? Colors.black : Colors.white,
//           navBarUnSelectdItem: isDarkTheme ?  Colors.white : Colors.black)
//     ],
//     scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
//     textTheme: const TextTheme(
//       titleSmall: TextStyle(fontSize: 12) ,
//     )..apply(bodyColor: isDarkTheme ? Colors.white : Colors.black),
//     // textTheme: Theme.of(context)
//     //     .textTheme
//     //     .copyWith(
//     //         titleSmall:
//     //             Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12))
//     //     .apply(bodyColor: isDarkTheme ? Colors.white : Colors.black),
//     appBarTheme: AppBarTheme(
//         backgroundColor: isDarkTheme ? Colors.black : Colors.white,
//         iconTheme:
//             IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54)),
//   );
// }

class MyColors extends ThemeExtension<MyColors> {
  MyColors(
      {required this.navBarSelectedItem,
      required this.navBarUnSelectdItem,
      required this.discountPercentage,
      required this.navBarBG});

  final Color? navBarBG;
  final Color? navBarSelectedItem;
  final Color? navBarUnSelectdItem;
  final Color? discountPercentage;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? navBarBG,
    Color? navBarSelectedItem,
    Color? navBarUnSelectdItem,
    Color? discountPercentage,
  }) {
    return MyColors(
        navBarSelectedItem: navBarSelectedItem ?? this.navBarSelectedItem,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        navBarBG: navBarBG ?? this.navBarBG,
        navBarUnSelectdItem: navBarUnSelectdItem ?? this.navBarUnSelectdItem);
  }

  @override
  ThemeExtension<MyColors> lerp(
      covariant ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
        navBarSelectedItem:
            Color.lerp(navBarSelectedItem, other.navBarSelectedItem, t),
        discountPercentage:
            Color.lerp(discountPercentage, other.discountPercentage, t),
        navBarBG: Color.lerp(navBarBG, other.navBarBG, t),
        navBarUnSelectdItem:
            Color.lerp(navBarUnSelectdItem, other.navBarUnSelectdItem, t));
  }
}
