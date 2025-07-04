import 'package:flutter/material.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchInput({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Tìm kiếm...',
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
    bool isLoading = false;
    void _onSearchPressed() {
    setState(() {
      isLoading = true;
    });

    // Giả lập gọi API trong 2 giây
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // chiều cao
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
          fontSize: 16.0,
        ),
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).inputDecorationTheme.hintStyle?.color ??
                Colors.grey,
          ),
         suffixIcon: isLoading
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.search, size: 30, color: Colors.black),
                onPressed: _onSearchPressed,
              ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1.5,
              color: Theme.of(context)
                      .inputDecorationTheme
                      .border
                      ?.borderSide
                      .color ??
                  Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1.5,
              color: Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder
                      ?.borderSide
                      .color ??
                  Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1.5,
              color: Theme.of(context)
                      .inputDecorationTheme
                      .focusedBorder
                      ?.borderSide
                      .color ??
                  Colors.blue,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1.5,
      
              color: Theme.of(context)
                      .inputDecorationTheme
                      .errorBorder
                      ?.borderSide
                      .color ??
                  Colors.red,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor ??
              Colors.grey.shade100,
        ),
      ),
    );
  }
}
