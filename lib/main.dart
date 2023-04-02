import 'package:flutter/material.dart';
import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/generated/codegen_loader.g.dart';
import 'package:flutter_score_app/screens/home_screen/home_screen.dart';
import 'package:flutter_score_app/screens/setting_screen/setting_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlayerModel(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
