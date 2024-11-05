import 'package:flutter/material.dart';
import 'package:school/constants/color.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
          suffixIcon: const Icon(
            Icons.mic,
            color: kPrimaryColor,
            size: 26,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Search your topic",
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          isDense: true),
    );
  }
}
