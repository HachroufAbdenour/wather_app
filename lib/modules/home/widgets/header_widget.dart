
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String? cityName;
  final String formattedDateTime;

  const HeaderWidget({
    required this.cityName,
    required this.formattedDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'City: $cityName',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            formattedDateTime,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}