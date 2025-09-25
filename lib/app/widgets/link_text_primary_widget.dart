import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';

class LinkTextPrimary extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onTap;

  const LinkTextPrimary(
    this.text, {
    this.color,
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.labelLarge;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: baseStyle?.copyWith(
          color: color ?? lightColorScheme.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
