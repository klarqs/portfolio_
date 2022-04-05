import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lots_/app/utils/colors.dart';
import 'package:lots_/app/utils/ui/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: CustomColors.primaryColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: Color(0xFF212121),
    ),
    backgroundColor: const Color(0xFF212121),
    scaffoldBackgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: CustomColors.accentColor,
    cardColor: CustomColors.accentColor,
    canvasColor: CustomColors.accentColor,
    cardTheme: const CardTheme(
      color: CustomColors.accentColor,
    ),
    dialogBackgroundColor: CustomColors.accentColor,
    appBarTheme: const AppBarTheme(color: Colors.white),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  ThemeData _themeData = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: CustomColors.accentColor,
    cardColor: CustomColors.accentColor,
    canvasColor: CustomColors.accentColor,
    cardTheme: const CardTheme(
      color: CustomColors.accentColor,
    ),
    dialogBackgroundColor: CustomColors.accentColor,
    appBarTheme: const AppBarTheme(color: Colors.white),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      if (kDebugMode) {
        print('value read from storage: ' + value.toString());
      }
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        if (kDebugMode) {
          print('setting dark theme');
        }
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
