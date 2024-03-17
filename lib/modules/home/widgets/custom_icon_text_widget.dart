import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final String iconAssetPath;
  final String text;
  final double hight;
  final double widht;

  const IconWithText({
    required this.iconAssetPath,
    required this.text,
    required this.hight,
    required this.widht,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: hight,
          width: widht,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 242, 236, 236), // Set the color as needed
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            iconAssetPath,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
