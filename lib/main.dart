import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/helper/on_generate_routes.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/features/splash/presintation/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  // final authRepo = AuthRepository(apiService: FirebaseService());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefs.init();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale("ar"),
      title: 'FruitHub',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.primary),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
      ),
      home: SplashScreen(),
      onGenerateRoute: OnGeneraRouteGenerator.generateRoute,
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
