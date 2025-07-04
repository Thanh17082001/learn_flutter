import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';
import 'package:learn_flutter/features/home/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<TabItem> items = const [
    TabItem(
      icon: FontAwesomeIcons.house,
      title: 'Home',
    ),
    TabItem(
      icon: FontAwesomeIcons.store,
      title: 'Shop',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'Wishlist',
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    TabItem(
      icon: Icons.account_box,
      title: 'Profile',
    ),
  ];
  List<Widget> pages = [
    HomePage(),
    Scaffold(
      appBar:
          AppBar(automaticallyImplyLeading: false, title: Text('Shop Page')),
      body: Center(child: Text('Shop Page')),
    ),
    Center(child: Text('Wishlist Page')),
    Center(child: Text('Cart Page')),
    Center(child: Text('Profile Page')),
  ];
  int visit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: visit,
          children: pages,
        ),
        bottomNavigationBar: BottomBarDivider(
          items: items,
          top: 20,
          color: Theme.of(context).colorScheme.onSurface,
          colorSelected: Colors.yellow,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          indexSelected: visit,
          iconSize: 20,
          bottom: 30,
          onTap: (int index) => setState(() {
            visit = index;
          }),
        ));
  }
}
