import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: const Image(
        image: AssetImage('assets/scroll-1.png'),
        alignment: Alignment.topCenter,
        height: double.infinity,
      ),
    );
  }
}
