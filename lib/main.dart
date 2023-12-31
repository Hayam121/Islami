import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/splash_screen.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/sura_details/sura_details_screen.dart';
import 'package:provider/provider.dart';

import 'hadeth_details/hadeth_details.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: const MyApplication()));
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(settingsProvider.languageCode),
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetailsScreen.routeName: (_) => const SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
