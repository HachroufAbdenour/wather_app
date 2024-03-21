import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback? onTap;
  CustomRow({required this.leftText, required this.rightText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
           onTap: onTap,
          child: Text(
            rightText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          
        ),
      ],
    );
  }
}
