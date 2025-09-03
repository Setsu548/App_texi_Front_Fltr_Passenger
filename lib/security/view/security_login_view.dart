import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../app/app_router.dart';
import '../../app/widgets/body_text_widget.dart';
import '../../app/widgets/primary_button_widget.dart';

class SecurityLoginView extends HookWidget {
  const SecurityLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        BodyText(context.intl.bodyMsgSendAccessCode),
        const SizedBox(height: 20),
        InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DROPDOWN,
          ),
          initialValue: PhoneNumber(isoCode: 'BO'),
          textFieldController: TextEditingController(),
          inputDecoration: InputDecoration(
            hintText: context.intl.hintEnterYourNumber,
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(
                text: context.intl.buttonRequestCode, 
                onPressed: () {
                  appRouter.push('/security/account_verification');
                }
              ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: (){
          appRouter.push('/demo');
        }, child: Text('Demo'))
      ],),
    );
  }
}