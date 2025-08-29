import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';

class CardTertiary extends StatelessWidget {
  final List<Widget> children;

  const CardTertiary({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        color: lightColorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}