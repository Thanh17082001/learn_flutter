import 'package:flutter/material.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';

class InputForm extends StatefulWidget {
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
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context, ) {
      bool _obscureText = true;
    return  TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
        validator: widget.validator,
      decoration:   InputDecoration(
        
        labelText: widget.labelText,
        hintText: widget.hintText,
       contentPadding: const EdgeInsets.only(top: 20,bottom: 20,left: 30,right: 10),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Color.fromARGB(255, 180, 180, 180), width: 0.9),
        ),
        focusedBorder: const  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red, width: 0.9),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        
      ),
    );
  }
}