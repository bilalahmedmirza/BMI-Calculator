import "package:flutter/material.dart";

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.clr, this.cardChild});

  final Color clr;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}