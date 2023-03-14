import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {super.key,
      required this.icon,
      required this.onTap,
      this.color,
      this.size});
  final VoidCallback onTap;
  final Icon icon;
  Color? color = Colors.black;
  double? size = 30;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      iconSize: size,
      icon: icon,
      onPressed: onTap,
    );
  }
}
