import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final Color bColor; // New parameter for background color
  final VoidCallback onPressed;

  const IconButtonWidget({
    required this.iconPath,
    this.iconColor = Colors.white,
    required this.bColor, // Updated constructor
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bColor, // Use backgroundColor parameter here
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: IconButton(
          onPressed: onPressed,
          icon: ImageIcon(
            AssetImage(iconPath),
            color: iconColor,
          ),
        ),
      ),
    );
  }
}





//  color: Color(0xff5842A9),
      