import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';

class LanguageOption {
  final String code; 
  final String label;  
  const LanguageOption(this.code, this.label);
}

class LanguageDropdownPill extends StatelessWidget {
  const LanguageDropdownPill({
    super.key,
    required this.options,
    required this.value,          
    required this.onChanged,   
    this.radius = 14,
    this.bgColor,
    this.borderColor,
    this.textColor,
    this.iconColor,
  });

  final List<LanguageOption> options;
  final String value;
  final ValueChanged<String> onChanged;

  final double radius;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final current =
        options.firstWhere((o) => o.code == value, orElse: () => options.first);

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: PopupMenuButton<LanguageOption>(
        tooltip: '',
        position: PopupMenuPosition.under,
        color: lightColorScheme.secondary,
        onSelected: (opt) => onChanged(opt.code),
        itemBuilder: (ctx) => options.map((o) => PopupMenuItem(
          value: o,
          child: Row(
            children: [
              if (o.code == value)
                Icon(Icons.check, size: 18, color: lightColorScheme.primary)
              else
                SizedBox(width: 18),
              SizedBox(width: 8),
              BodyText(o.label),
            ],
          ),
        )).toList(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: bgColor ?? lightColorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor ?? lightColorScheme.onSurface),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BodyText(current.label, color: textColor ?? lightColorScheme.onSurface),
              SizedBox(width: 6),
              Icon(Icons.arrow_drop_down_rounded,
                  size: 18, color: iconColor ?? lightColorScheme.onSurface),
            ],
          ),
        ),
      ),
    );
  }
}
