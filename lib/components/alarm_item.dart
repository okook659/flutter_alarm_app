import 'package:flutter/material.dart';

class AlarmItem extends StatelessWidget {
  final String text;
  const AlarmItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }
}
