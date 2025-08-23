import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';

class SmallTextSecondary extends StatelessWidget {
  final String text;

  const SmallTextSecondary(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        color: lightColorScheme.secondary
      )
    );
  }
}