import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String name;
  const CustomButton({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue[500],
          size: 25,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.blue[400]),
        )
      ],
    );
  }
}
