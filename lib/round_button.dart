import "package:flutter/material.dart";

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPress});

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(
        height: 45,
        width: 45,
      ),
      elevation: 10,
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}