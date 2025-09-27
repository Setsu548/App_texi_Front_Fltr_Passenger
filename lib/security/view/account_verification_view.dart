
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/app_router.dart';
import '../../app/widgets/app_pin.dart';
import '../../app/widgets/body_text_widget.dart';
import '../../app/widgets/label_text_widget.dart';
import '../../app/widgets/link_text_primary_widget.dart';
import '../../app/widgets/primary_button_widget.dart';
import '../../app/widgets/title_text_widget.dart';
import '../../theme/main_theme.dart';

class AccountVerificationView extends HookWidget {
  const AccountVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final pinController = useTextEditingController();
    final pinFocusNode = useFocusNode();
    final pinError = useState(false);
    final pinErrorLabel = useState('');

    return Column(
      children: [
        const SizedBox(height: 40),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(20), 
              decoration: BoxDecoration(
                color: lightColorScheme.primary,
                shape: BoxShape.circle, 
              ),
              child: Icon(
                Icons.shield,
                size: 48, 
                color: lightColorScheme.surface, 
              ),
            ),
            SizedBox(height: 25),
            TitleText(context.intl.titleAccountVerification),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: BodyText(context.intl.bodyEnterVerificationCode, textAlign: TextAlign.center,),
            ),
            SizedBox(height: 25),
            AppPin(
                controller: pinController,
                focusNode: pinFocusNode,
                closeKeyboardWhenCompleted: false,
                error: pinError.value,
                errorLabel: pinErrorLabel.value,
                onChange: (value) {
                },
                onComplete: (value) {
                },
              ),
            SizedBox(height: 25),
            PrimaryButton(text: context.intl.btnVerify, onPressed: () {
              appRouter.push('/security/profile_data');
            }),
            SizedBox(height: 25),
            LabelText(context.intl.labelDidNotReceiveCode),
            SizedBox(height: 10),
            LinkTextPrimary(context.intl.linkResendCode, onTap: (){},)
          ],
        ),
      ],
    );
  }
}