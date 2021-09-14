// @dart=2.9
/*
Copyright 2018 Square Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:flutter/material.dart';
import 'screens/authorize_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/manual_authorize_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(ExampleApp());

/// The root of this example app
class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: _buildTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/authorize': (context) => AuthorizeScreen(),
          '/authorize/manual': (context) => ManualAuthorizeScreen(),
          '/checkout': (context) => CheckoutScreen(),
        },
      );
}

// override default theme
ThemeData _buildTheme() {
  var base = ThemeData.light();
  return base.copyWith(
    backgroundColor: Color.fromRGBO(64, 135, 225, 1.0),
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: Color.fromRGBO(64, 135, 225, 1.0),
    buttonTheme: ButtonThemeData(
      height: 64.0,
    ),
    hintColor: Colors.transparent,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
        button: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        )),
  );
}
