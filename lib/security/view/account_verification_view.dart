
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/security/models/send_code_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/app_router.dart';
import '../../app/widgets/app_pin.dart';
import '../../app/widgets/body_text_widget.dart';
import '../../app/widgets/label_text_widget.dart';
import '../../app/widgets/link_text_primary_widget.dart';
import '../../app/widgets/loading_dialog.dart';
import '../../app/widgets/primary_button_widget.dart';
import '../../app/widgets/title_text_widget.dart';
import '../../theme/main_theme.dart';
import '../bloc/login_bloc.dart';

class AccountVerificationView extends HookWidget {
  const AccountVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final pinController = useTextEditingController();
    final pinFocusNode = useFocusNode();
    final pinError = useState(false);
    final pinErrorLabel = useState('');

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 40),
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
            PrimaryButton(text: context.intl.btnVerify, 
            onPressed: () {
              final pin = pinController.text;
              if (pin.isEmpty) {
                pinError.value = true;
                pinErrorLabel.value = "Ingresa tu PIN";
                pinFocusNode.requestFocus();
                return;
              }
              pinError.value = false;
              final sendCode = SendCode(
                brand: '', 
                ip: '', 
                os: '', 
                model: '', 
                phone_number: '', 
                verification_code: int.parse(pinController.text) 
              );
              context.read<LoginBloc>().add(LoginEvent.sendCode(
                  sendCode: sendCode, 
                  befor: (res){
                    showLoadingDialog(context);
                  },
                  success: (res){
                    hideLoadingDialog(context);
                    if (!state.isVerified! && state.status == 'pending'  ) {
                      appRouter.push('/security/profile_data');
                    }else{
                      appRouter.go('/travel/travel_request');
                    }
                  },
                  error: (err){
                    hideLoadingDialog(context);
                    showErrorDialog(
                      context,
                      Icons.error_outline,
                      err['details'] ?? 'Error desconocido',
                      title: err['message'] ?? 'Error',
                    );
                  }
                )
              );
              
            }),
            SizedBox(height: 25),
            LabelText(context.intl.labelDidNotReceiveCode),
            SizedBox(height: 10),
            LinkTextPrimary(context.intl.linkResendCode, onTap: (){},),
          ],
        );
      },
    );
  }
}