import 'package:flutter/material.dart';

class PreferenceDetail extends StatelessWidget {
  final IconData icon;
  final String text;

  const PreferenceDetail({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          this.icon,
          color: Colors.deepPurple,
          size: 50,
        ),
        Text(this.text),
      ],
    );
  }
}
