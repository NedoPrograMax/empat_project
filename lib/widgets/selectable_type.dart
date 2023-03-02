import 'package:flutter/material.dart';

class SelectableType extends StatelessWidget {
  const SelectableType({
    super.key,
    required this.borderColor,
    required this.label,
    required this.onPressed,
  });
  final Color borderColor;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
