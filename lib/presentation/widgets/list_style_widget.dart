import 'package:flutter/material.dart';

class ListStyle extends StatelessWidget {
  const ListStyle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16.0),
      color: Colors.blue[100],
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
