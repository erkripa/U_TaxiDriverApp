import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:u_taxi/authentication/car_info_screen.dart';
import 'package:u_taxi/authentication/login_screen.dart';
import 'package:u_taxi/authentication/signup_screen.dart';
import 'package:u_taxi/mainScreen/main_screen.dart';
import 'package:u_taxi/splashScreen/splash_screen.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp(
    settingsController: settingsController,
    child: MaterialApp(
      title: "Drivers App",
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      // onGenerateTitle: (BuildContext context) =>
      //     AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SignUpScreen.routeName:
                return const SignUpScreen();
              case LoginScreen.routeName:
                return const LoginScreen();
              case CarInfoScreen.routeName:
                return const CarInfoScreen();
              case MainScreen.routName:
                return const MainScreen();
              default:
                return const MySplashScreen();
            }
          },
        );
      },
    ),
  ));
}
