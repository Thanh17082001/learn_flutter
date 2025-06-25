import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
  
      child:  Column(
        children: [
          const Text(
            'Hoặc đăng nhập bằng',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 117, 117, 117),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            children:<Widget> [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const  Icon(FontAwesomeIcons.facebook, color: Colors.white, size: 30)
                  ),
              ),
               const SizedBox(width: 20),
          
                Expanded(
                  child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const  Icon(FontAwesomeIcons.google, color: Colors.white, size: 30)),
                ),
             
            ],
          ),
        ],
      ),
    );
  }
}
