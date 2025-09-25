import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';

class DoubleIconButton extends StatelessWidget {
  final IconData leadingIcon;   
  final String title;           
  final String description;    
  final IconData trailingIcon;  
  final Color? buttonColor;
  final VoidCallback onTap;     

  const DoubleIconButton({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.description,
    required this.trailingIcon,
    this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;
    return ElevatedButton(
      style: baseStyle?.copyWith(
          foregroundColor: MaterialStateProperty.all(lightColorScheme.surfaceTint),
          backgroundColor: MaterialStateProperty.all(lightColorScheme.secondary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              side: BorderSide(
                color: buttonColor ?? lightColorScheme.primary,
                width: 2,
              )
            ),
          )
        ),
      onPressed: onTap,
      child: Row(
        children: [
          Icon(leadingIcon, color: buttonColor ?? lightColorScheme.primary, size: 25),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BodyText(title),
                LabelText(description)
              ],
            ),
          ),

          SizedBox(width: 20),
          CircleAvatar(
            backgroundColor: buttonColor ?? lightColorScheme.primary,
            radius: 22,
            child: Icon(
              trailingIcon,
              color: lightColorScheme.onPrimary,
              size: 24,
            ),
          ),        
        ],
      ),
    );
  }
}
