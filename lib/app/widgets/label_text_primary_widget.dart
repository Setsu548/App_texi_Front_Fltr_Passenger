import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';

class LabelTextPrimary extends StatelessWidget {
  final String text;

  const LabelTextPrimary(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.labelLarge;

    return Text(
      text,
      style: baseStyle?.copyWith(
        color: lightColorScheme.primary, 
      ),
    );
  }
}