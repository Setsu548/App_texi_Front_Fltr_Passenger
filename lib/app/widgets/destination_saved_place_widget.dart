import 'package:flutter/material.dart';
import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';

class DestinationSavedPlace extends StatelessWidget {
  const DestinationSavedPlace({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.fullWidth = true,
    this.selectedBg,
    this.unselectedBg,
    this.selectedBorder,
    this.unselectedBorder,
    this.selectedTextColor,
    this.unselectedTextColor,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool fullWidth;

  final Color? selectedBg;
  final Color? unselectedBg;
  final Color? selectedBorder;
  final Color? unselectedBorder;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;

  @override
  Widget build(BuildContext context) {
    final bg = isSelected
        ? (selectedBg ?? lightColorScheme.primary)
        : (unselectedBg ?? lightColorScheme.secondaryContainer);
    final tx = isSelected
        ? (selectedTextColor ?? lightColorScheme.surface)
        : (unselectedTextColor ?? lightColorScheme.onSurface);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: BodyText(text, color: tx)),
      ),
    );
  }
}
