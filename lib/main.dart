import 'package:flutter/material.dart';
import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/screens/home_screen/home_screen.dart';
import 'package:flutter_score_app/screens/setting_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlayerModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        routes: {
          '/screens/home_screen': (context) => HomeScreen(
                minutes: 30,
              ),
          '/screens/setting_screen': (context) => SettingScreen(),
        },
        initialRoute: '/screens/home_screen',
      ),
    );
  }
}
