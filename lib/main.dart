import 'package:agro_app/screens/screens.login/login.dart';
import 'package:agro_app/shared/animation/custom.animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 10)
      return 1;
    else
      return 2;
  };

Map<int, Widget> op = {1: MyApp(), 2: MyApp()};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {;
    return MaterialApp(
      home:  CustomSplash(
        imagePath: 'imagens/logo_agro.png',
        backGroundColor: Colors.lightGreenAccent[400],
        animationEffect: 'zoom-in',
        logoSize: 200,
        home: PaginaLogin(),
        customFunction: duringSplash,
        duration: 2500,
        type: CustomSplashType.StaticDuration,
        outputAndHome: op,
    ),
    );
  }
}


