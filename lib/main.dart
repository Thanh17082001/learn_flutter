import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'injection.dart' as di;
import 'features/auth/presentation/pages/login_page.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   /// Load dotenv trước DI
  await dotenv.load(fileName: ".env");
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.white, // 👉 Set nền mặc định của Scaffold
        primaryColor: Colors.white, // 👉 Màu chủ đạo (nếu cần)
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // 👉 Nền AppBar
          foregroundColor: Colors.black, // 👉 Màu icon/text trong AppBar
          elevation: 0, // 👉 Loại bỏ bóng AppBar (nếu muốn phẳng)
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black, // 👉 Màu text chính, icon...
          secondary: Colors.blue, // 👉 Màu phụ, ví dụ nút bấm
        ),
      ),
      home: LoginPage(),
    );
  }
}
