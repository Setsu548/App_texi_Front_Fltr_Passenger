import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';

import '../../theme/main_theme.dart';

class AppPin extends HookWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final FocusNode? focusNode;
  final bool closeKeyboardWhenCompleted;
  final Function(String)? onChange;
  final Function(String)? onComplete;
  final bool error;
  final String? errorLabel;

  const AppPin({
    super.key,
    required this.controller,
    this.autoFocus = false,
    this.focusNode,
    this.closeKeyboardWhenCompleted = true,
    this.onChange,
    this.onComplete,
    this.error = false,
    this.errorLabel,
  });
  @override
  Widget build(BuildContext context) {
    PinTheme normalDefaultTheme = PinTheme(
      width: 60,
      height: 70,
      textStyle: Theme.of(context).textTheme.displaySmall,
      decoration: BoxDecoration(
        color: lightColorScheme.secondary,
        border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    PinTheme errorDefaultTheme = PinTheme(
      width: 60,
      height: 70,
      textStyle: Theme.of(context).textTheme.displaySmall,
      decoration: BoxDecoration(
        color: lightColorScheme.secondary,
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    PinTheme normalFocusedTheme = PinTheme(
      width: 65,
      height: 75,
      textStyle: Theme.of(context).textTheme.displaySmall,
      decoration: BoxDecoration(
        color: lightColorScheme.secondary,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceTint, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    PinTheme errorFocusedTheme = PinTheme(
      width: 65,
      height: 75,
      textStyle: Theme.of(context).textTheme.displaySmall,
      decoration: BoxDecoration(
        color: lightColorScheme.secondary,
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 75,
            child: Pinput(
              controller: controller,
              toolbarEnabled: false,
              length: 4,
              obscureText: true,
              focusNode: focusNode,
              autofocus: autoFocus,
              closeKeyboardWhenCompleted: closeKeyboardWhenCompleted,
              onTap: () => controller.clear(),
              onChanged: onChange,
              onCompleted: onComplete,
              obscuringWidget: FaIcon(
                FontAwesomeIcons.asterisk,
                color: Theme.of(context).colorScheme.surfaceTint,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              defaultPinTheme: !error ? normalDefaultTheme : errorDefaultTheme,
              focusedPinTheme: !error ? normalFocusedTheme : errorFocusedTheme,
            ),
          ),
          error
              ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    errorLabel ?? context.intl.labelPinNotValid,
                    style:
                        Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
