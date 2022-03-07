import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'colors.dart';

final ThemeData _kBriftTheme = _buildBriftTheme();

ThemeData _buildBriftTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kBriftPink100,
      onPrimary: kBriftBrown900,
      secondary: kBriftBrown900,
      error: kBriftErrorRed,
    ),
    textTheme: _buildBriftTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kBriftPink100,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kBriftBrown900,
        ),
      ),
      border: OutlineInputBorder(),
    ),
  );
}

TextTheme _buildBriftTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kBriftBrown900,
        bodyColor: kBriftBrown900,
      );
}

class BriftApp extends StatelessWidget {
  const BriftApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Brift",
      home: const HomePage(),
      theme: _kBriftTheme,
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}
