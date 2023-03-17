import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
  });
  final VoidCallback onTap;
  final Icon icon;
  Color? color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      iconSize: 30,
      icon: icon,
      onPressed: onTap,
    );
  }
}
