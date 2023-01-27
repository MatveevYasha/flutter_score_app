import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/player_model.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/setting_screen.dart';
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
          '/screens/home_screen': (context) => HomeScreen(),
          '/screens/setting_screen': (context) => SettingScreen(),
        },
        initialRoute: '/screens/home_screen',
      ),
    );
  }
}
