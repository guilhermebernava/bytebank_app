import 'package:bytebank/modules/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Byte Bank",
      home: const Home(),
      routes: {"/home": (context) => const Home()},
    );
  }
}
