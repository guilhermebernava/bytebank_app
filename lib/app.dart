import 'package:bytebank/modules/home/home_page.dart';
import 'package:bytebank/modules/splash/splash_page.dart';
import 'package:bytebank/shared/theme/appColor.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: AppColor.greenLogo),
      title: "Byte Bank",
      initialRoute: "/splash",
      routes: {
        "/home": (context) => const Home(),
        "/splash": (context) => SplashPage(),
      },
    );
  }
}
