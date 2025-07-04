import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding xung quanh
      width: double.infinity,
      height:
          MediaQuery.of(context).size.height * 0.2, // 👉 20% chiều cao màn hình
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, // Màu nền
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Column(
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  '3.000.000 VND',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 30.0), // Khoảng cách giữa các dòng
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Income',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '1.000.000 VND',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            top: BorderSide(
                              color: Color.fromARGB(255, 180, 180, 180),
                              width: 0.9,
                            ),
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 180, 180, 180),
                              width: 0.9,
                            ),
                            left: BorderSide(
                              color: Color.fromARGB(255, 180, 180, 180),
                              width: 0.9,
                            ),
                            right: BorderSide(
                              color: Color.fromARGB(255, 180, 180, 180),
                              width: 0.9,
                            ),
                          )),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.arrowsRotate,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          size: 20.0,
                        ),
                      ),
                    ), // Mũi tên chỉ sang phải
                
                    Column(
                      children: [
                        Text(
                          'Expense',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '1.000.000 VND',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
