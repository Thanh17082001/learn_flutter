import 'package:flutter/material.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';
import 'package:learn_flutter/core/theme/theme_switcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learn_flutter/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  di.init();

  // Load theme từ SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDarkMode') ?? true;

  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatefulWidget {
  final bool isDark;

  const MyApp({super.key, required this.isDark});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void _toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light, // hoặc Brightness.dark
        scaffoldBackgroundColor: Colors.white, // Màu nền toàn app
        primaryColor: AppColors.textPrimary, // Màu chủ đạo
iconTheme:  const IconThemeData(
          color: Colors.black, // Màu icon mặc định
        ),
        appBarTheme:  AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.surface, // Màu text và icon trong AppBar
          elevation: 0,
        ),

        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey), // Hint text
          labelStyle: TextStyle(color: Colors.black), // Label text
          border: OutlineInputBorder(),
        ),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black), // Màu chữ mặc định
        ),



        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.orange,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
       
      routes: appRoutes,
      initialRoute: '/login',
      builder: (context, child) {
        return ThemeSwitcher(
          themeMode: _themeMode,
          toggleTheme: _toggleTheme,
          child: child!,
        );
      },
    );
  }
}


