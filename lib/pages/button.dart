// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  Button({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
