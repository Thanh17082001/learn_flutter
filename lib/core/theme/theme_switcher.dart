import 'package:flutter/material.dart';

class ThemeSwitcher extends InheritedWidget {
  final ThemeMode themeMode;
  final Function(bool) toggleTheme;

  const ThemeSwitcher({
    super.key,
    required this.themeMode,
    required this.toggleTheme,
    required super.child,
  });

  static ThemeSwitcher of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>()!;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) =>
      oldWidget.themeMode != themeMode;
}
