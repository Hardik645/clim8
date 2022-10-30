import 'package:flutter/material.dart';
import 'home_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        // brightness: Brightness.light,
        primaryColor: Colors.green[800],
        fontFamily: 'RobotoCondensed',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF454545)),
          headline2: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              color: Color(0xFF454545)),
          headline3: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF454545)),
        ),
      )
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}
