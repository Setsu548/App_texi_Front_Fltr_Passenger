import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const BodyText(
    this.text, {
    this.textAlign = TextAlign.start,
    this.maxLines,         
    this.overflow,  
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: color,
        
      ),
      textAlign: textAlign,
      softWrap: true,
      maxLines: maxLines,       
      overflow: overflow, 
    );
  }
}