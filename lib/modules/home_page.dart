import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bytebank"),
        backgroundColor: Colors.cyan,
      ),
      body: const Center(
          child: Text(
        "HELLO WORLD",
        style: TextStyle(fontSize: 52),
      )),
    );
  }
}
