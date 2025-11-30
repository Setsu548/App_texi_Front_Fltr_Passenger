import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../app/app_router.dart';
import '../../app/widgets/body_text_widget.dart';
import '../../app/widgets/loading_dialog.dart';
import '../../app/widgets/primary_button_widget.dart';
import '../bloc/login_bloc.dart';

class SecurityLoginView extends HookWidget {
  const SecurityLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = useTextEditingController(text: '');
    final dialCode = useState<String?>(null);
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        BodyText(context.intl.bodyMsgSendAccessCode),
        const SizedBox(height: 20),
        InternationalPhoneNumberInput(
          textFieldController: userNameController,
          onInputChanged: (PhoneNumber number) {
              dialCode.value = number.dialCode ?? '';
              print('📞 Número completo: ${dialCode.value}');
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DROPDOWN,
          ),
          initialValue: PhoneNumber(isoCode: 'BO'),
          inputDecoration: InputDecoration(
            hintText: context.intl.hintEnterYourNumber,
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(
                text: context.intl.buttonRequestCode, 
                onPressed: () {
                  if (userNameController.text != '') {
                      context.read<LoginBloc>().add(LoginEvent.loginInit(
                        userName: userNameController.text, 
                        password: dialCode.value!,
                        befor: (res){
                          showLoadingDialog(context);
                        },
                        success: (res){
                          hideLoadingDialog(context);
                          appRouter.push('/security/account_verification');
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
                  }else{
                    showErrorDialog(
                      context,
                      Icons.warning,
                      'Se requiere ingresar tu número.',
                    );
                  }
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