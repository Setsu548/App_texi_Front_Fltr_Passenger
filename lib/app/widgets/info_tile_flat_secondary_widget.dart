import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';

class InfoTileFlatSecondary extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? colorIcon;

  const InfoTileFlatSecondary({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.colorIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: colorIcon ?? lightColorScheme.secondaryContainer,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(title),
              BodyText(description),
            ],
          ),
        ),
      ],
    );
  }
}
