import 'package:flutter/material.dart';
import '../../control/Tag.dart';

class PuceTag extends StatelessWidget {
  final Tag tag;
  const PuceTag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        tag.getNom,
      ),
    );
  }
}
