import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';

class LabeledDropdown<T> extends HookWidget {
  final String label;
  final String hint;
  final Color? colorLabel;
  final Color? focusedBorder;
  final Color? background;
  final List<DropdownMenuItem<T>> items;

  const LabeledDropdown({
    super.key,
    required this.label,
    required this.hint,
    this.colorLabel,
    this.focusedBorder,
    this.background,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {

    final selectedValue = useState<T?>(null);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label),
          SizedBox(height: 6),
          DropdownButtonFormField<T>(
            value: selectedValue.value,
            onChanged: (val) => selectedValue.value = val, 
            items: items,
            hint: BodyText(hint, color: lightColorScheme.secondaryContainer,),
            decoration: InputDecoration(
              hintText: hint,
              fillColor: background ?? lightColorScheme.surfaceTint,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: lightColorScheme.outline),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: lightColorScheme.outline),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: lightColorScheme.outline,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: lightColorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: lightColorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusedBorder ?? lightColorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colorLabel ?? lightColorScheme.secondaryContainer
            ),
            dropdownColor: background ?? lightColorScheme.surfaceTint,
          ),
        ],
      ),
    );
  }
}
