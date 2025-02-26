// import 'package:ecommerce_app/core/styles/color_manager.dart';
// import 'package:ecommerce_app/core/utils/cache_manager.dart';
// import 'package:flutter/material.dart';

// class ThemeManager {
//   // Notifier to switch between themes
//   static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
//     ThemeMode.system,
//   );

//   // Initialize theme based on saved preference
//   static Future<void> initTheme() async {
//     String? savedTheme = CacheManager.loadThemeMode();
//     themeNotifier.value = _getThemeModeFromString(savedTheme);
//   }

//   // Convert string to ThemeMode
//   static ThemeMode _getThemeModeFromString(String? theme) {
//     switch (theme) {
//       case 'light':
//         return ThemeMode.light;
//       case 'dark':
//         return ThemeMode.dark;
//       case 'system':
//       default:
//         return ThemeMode.system;
//     }
//   }

//   // Save and set theme mode
//   static Future<void> setThemeMode(ThemeMode mode) async {
//     themeNotifier.value = mode;
//     await CacheManager.saveThemeMode(mode.toString().split('.').last);
//   }

//   static Future<void> toggleTheme() async {
//     themeNotifier.value == ThemeMode.light
//         ? await setThemeMode(ThemeMode.dark)
//         : await setThemeMode(ThemeMode.light);
//   }

//   // Light Theme
//   static ThemeData get lightMode => ThemeData(
//     pageTransitionsTheme: const PageTransitionsTheme(
//       builders: {
//         TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
//         TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
//       },
//     ),
//     colorScheme: const ColorScheme.light(
//       primary: AppColor.primary,
//       background: AppColor.background,
//       secondary: AppColor.secondary,
//       tertiary: AppColor.tertiary,
//       outline: AppColor.gray,
//       outlineVariant: AppColor.background,
//     ),
//     scaffoldBackgroundColor: Colors.white,
//     cardColor: Colors.white,
//     iconTheme: const IconThemeData(color: Colors.black54),
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.transparent,
//       foregroundColor: Colors.black,
//       centerTitle: true,
//       elevation: 0,
//     ),
//     useMaterial3: true,
//   );

//   // Dark Theme
//   static ThemeData get darkMode => ThemeData(
//     pageTransitionsTheme: const PageTransitionsTheme(
//       builders: {
//         TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
//         TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
//       },
//     ),
//     colorScheme: ColorScheme.dark(
//       primary: AppColor.primary,
//       background: AppColor.background,
//       secondary: AppColor.secondary,
//       tertiary: AppColor.tertiary,
//       outline: AppColor.gray,
//       outlineVariant: AppColor.background,
//     ),
//     scaffoldBackgroundColor: Colors.grey.shade900,
//     cardColor: AppColor.secondary,
//     iconTheme: const IconThemeData(color: AppColor.primary),
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.transparent,
//       foregroundColor: AppColor.background,
//       centerTitle: true,
//       elevation: 0,
//     ),

//     useMaterial3: true,
//   );
// }
