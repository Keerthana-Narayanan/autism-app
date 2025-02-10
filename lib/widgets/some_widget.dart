import 'package:flutter/material.dart';

class SomeWidget extends StatelessWidget {
  final List<String> data;

  const SomeWidget({super.key, required this.data}); 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((name) => Text(name)).toList(),
    );
  }
}
