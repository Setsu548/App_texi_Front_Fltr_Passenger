import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class SearchPlaceField extends StatelessWidget {
  const SearchPlaceField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.hintText,
    this.readOnly = false,
    this.radius = 12,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.hintColor,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

  final String? hintText;
  final bool readOnly;
  final double radius;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      readOnly: readOnly,
      onTap: onTap,
      style: TextStyle(color: scheme.onSurface),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: backgroundColor ?? lightColorScheme.secondary,
        hintText: hintText ?? context.intl.hintSearchPlaceField,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          size: 20,
          color: iconColor ?? scheme.onSurface,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor ?? lightColorScheme.onSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: lightColorScheme.primary, width: 1.5),
        ),
      ),
    );
  }
}
