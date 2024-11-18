import 'package:boost/core/configs/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class AppBoost extends StatelessWidget {
  const AppBoost({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Memozen Boost',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'), // Vietnamese
        Locale('en', 'US'), // English
      ],
      locale: const Locale('vi'),
    );
  }
}
