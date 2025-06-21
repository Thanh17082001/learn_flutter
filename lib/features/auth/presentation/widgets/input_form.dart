import 'package:flutter/material.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';

class InputForm extends StatelessWidget {
   final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool errorIput;

  const InputForm({
    super.key,
    required this.labelText,
    this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.errorIput = false,
  });

  @override
  Widget build(BuildContext context, ) {
    return  TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
        validator: validator,
      decoration:   InputDecoration(
        labelText: labelText,
        hintText: hintText,
       contentPadding: const EdgeInsets.only(top: 20,bottom: 20,left: 30,right: 10),
        enabledBorder: const OutlineInputBorder(
          
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Color.fromARGB(255, 95, 95, 95), width: 1.0),
        ),
        focusedBorder: const  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        
      ),
    );
  }
}