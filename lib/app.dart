import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yoji',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.shipporiMinchoTextTheme(
          ThemeData.dark().textTheme,
        ),
        cupertinoOverrideTheme: const CupertinoThemeData().copyWith(
          barBackgroundColor: Colors.black,
          textTheme: const CupertinoTextThemeData().copyWith(
            navLargeTitleTextStyle: GoogleFonts.shipporiMincho(
                textStyle:
                    const CupertinoTextThemeData().navLargeTitleTextStyle),
            navTitleTextStyle: GoogleFonts.shipporiMincho(
                textStyle: const CupertinoTextThemeData().navTitleTextStyle),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
