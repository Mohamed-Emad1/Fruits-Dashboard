import 'package:flutter/material.dart';

void buildSucessSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 63, 215, 69),
      content: Text(text),
    ),
  );
}
