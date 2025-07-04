import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';
import 'package:learn_flutter/core/theme/theme_switcher.dart';
import 'package:learn_flutter/features/home/presentation/widget/header-homepage.dart';
import 'package:learn_flutter/features/home/presentation/widget/search-input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSeach = false;

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).textTheme.bodyLarge?.color);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Cài đặt")),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              title: Text(
                'Chế độ tối',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                ThemeSwitcher.of(context).themeMode == ThemeMode.dark
                    ? 'Đang bật chế độ tối'
                    : 'Đang bật chế độ sáng',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              value: ThemeSwitcher.of(context).themeMode == ThemeMode.dark,
              onChanged: (bool isDarkMode) {
                ThemeSwitcher.of(context).toggleTheme(isDarkMode);
              },
              secondary: Icon(
                ThemeSwitcher.of(context).themeMode == ThemeMode.dark
                    ? FontAwesomeIcons.moon
                    : FontAwesomeIcons.sun,
                color: Theme.of(context).colorScheme.secondary,
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0), // Slide in from the right
                end: Offset.zero,
              ).animate(animation),
              child: SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                child: child,
              ),
            );
          },
          // search input or title
          child: !isSeach
              ? const Text(
                  'MyMoney',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Montserrat',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    fontVariations: <FontVariation>[
                      FontVariation('wght', 450),
                    ],
                  ),
                )
              : const SearchInput(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            // ignore: deprecated_member_use
            icon: Icon(
              !isSeach ? FontAwesomeIcons.search : FontAwesomeIcons.xmark,
              size: 20,
            ),
            style: const ButtonStyle(
              iconColor: WidgetStatePropertyAll<Color>(AppColors.textPrimary),
            ),
            onPressed: () {
              setState(() {
                isSeach = !isSeach;
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          HeaderHomePage(),
          SizedBox(height: 20),
          Text(
            'Welcome to MyMoney',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action when button is pressed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Floating Action Button Pressed')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
