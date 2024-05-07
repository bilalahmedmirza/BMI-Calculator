import 'package:flutter/material.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.message, required this.onTap});

  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 12),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}