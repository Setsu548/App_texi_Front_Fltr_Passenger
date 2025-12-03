import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  const IconTextButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: lightColorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
            border: BoxBorder.all(
              color: lightColorScheme.secondaryContainer,
              width: 2
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: iconColor ?? lightColorScheme.onSurface, ),
              SizedBox(width: 20),
              Expanded(   // 👈 NECESARIO PARA TEXTO LARGO EN UN ROW
                child: BodyText(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  color: lightColorScheme.secondaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
