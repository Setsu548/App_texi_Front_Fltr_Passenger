import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class PrimaryVariantButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Color? backgroundColor;          
  final Color? foregroundColor;          
  final Color? borderColor;             
  final double borderWidth;              
  final double radius;                   
  final bool expand;                    

  const PrimaryVariantButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth = 2,
    this.radius = 8,
    this.expand = true,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;

    final style = (baseStyle ?? const ButtonStyle()).copyWith(
      backgroundColor: MaterialStateProperty.all(
        backgroundColor ?? lightColorScheme.primary,
      ),
      foregroundColor: MaterialStateProperty.all(
        foregroundColor ?? lightColorScheme.onPrimary,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: borderWidth)
              : BorderSide.none,
        ),
      ),
    );

    final btn = ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(text),
    );

    return expand ? SizedBox(width: double.infinity, child: btn) : btn;
  }
}
