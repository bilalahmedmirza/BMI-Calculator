import "package:flutter/material.dart";

class ContentWidget extends StatelessWidget {
  const ContentWidget(
      {super.key, required this.iconData, required this.gender});

  final IconData iconData;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 75),
        const SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: const TextStyle(
            color: Color(0xFF8D8E98),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}