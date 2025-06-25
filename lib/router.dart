import 'package:flutter/material.dart';
import 'package:learn_flutter/lib/presentation/main/pages/main_scaffold.dart';
import 'features/auth/presentation/pages/login_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginPage(),
  '/home': (context) => const MainPage(),
  // Thêm route khác nếu cần
};
