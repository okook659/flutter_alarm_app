import 'package:flutter/material.dart';

class AlarmItem extends StatelessWidget {
  final String text;
  const AlarmItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      ),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(text,
        style: const TextStyle(
          fontSize: 50,
        ),
        ),
      ),
    );
  }
}
