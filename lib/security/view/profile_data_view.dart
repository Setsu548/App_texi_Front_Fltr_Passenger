import 'dart:convert';
import 'dart:io';

import 'package:app_texi_passenger/security/models/users_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/app_router.dart';
import '../../app/widgets/body_text_widget.dart';
import '../../app/widgets/card_secondary_widget.dart';
import '../../app/widgets/labeled_text_field_widget.dart';
import '../../app/widgets/loading_dialog.dart';
import '../../app/widgets/primary_button_widget.dart';
import '../../app/widgets/title_text_widget.dart';
import '../../l10n/l10n_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/widgets/profile_image_picker.dart';
import '../../theme/main_theme.dart';
import '../bloc/login_bloc.dart';

class ProfileDataView extends HookWidget {
  const ProfileDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePhoto = useState<XFile?>(null);
    final nameController = useTextEditingController(text: '');
    final phoneNumberController = useTextEditingController(text: context.read<LoginBloc>().state.userName);
    final form = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController(text: '');
    
    return Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(context.intl.titleProfileInformation),
          SizedBox(height: 10),
          BodyText(context.intl.bodyPleaseEnterYourData),
          SizedBox(height: 30),
          CardSecondary(
            children: [
              LabeledTextField(
                label: context.intl.labelFullNameRequired, 
                hint: context.intl.hintFullNameExample,
                controller: nameController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabeledTextField(
                controller: emailController,
                label: context.intl.labeledTextFieldEmail,
                colorLabel: lightColorScheme.surface, 
                hint: context.intl.labeledTextFieldEmailHint,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabeledTextField(
                label: context.intl.labelPhoneNumberRequired, 
                hint: '7777777',
                prefixText: '+591',
                controller: phoneNumberController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: ProfileImagePicker(
              onPhotoCaptured: (file) {
                print("Imagen seleccionada: ${file.path}");
                profilePhoto.value = file;
              },
            ),
          ),
          SizedBox(height: 30),
          PrimaryButton(
            text: context.intl.btnContinue, 
            onPressed: () async {
              if (form.currentState != null && form.currentState!.validate()) {
                  if (profilePhoto.value != null) {
                    final base64ProfileFront = await convertXFileToBase64(profilePhoto.value);
                    final users = Users(
                      brand: '', 
                      email: emailController.text, 
                      alias_name: nameController.text, 
                      ip: '', model: '', 
                      os: '', 
                      profile_picture: base64ProfileFront!, 
                      user_name: phoneNumberController.text);
                    // appRouter.go('/travel/travel_request');
                    context.read<LoginBloc>().add(LoginEvent.users(
                        users: users, 
                        befor: (res){
                          showLoadingDialog(context);
                        },
                        success: (res){
                          hideLoadingDialog(context);
                          appRouter.go('/travel/travel_request');
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
                  } else {
                      showErrorDialog(
                        context,
                        Icons.warning,
                        'No se ha tomado la foto',
                      );
                  }
              }
            }
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(text: context.intl.bodyContinueAcceptsPrefix),
                TextSpan(
                  text: context.intl.linkTermsConditions,
                  style: TextStyle(color: lightColorScheme.surfaceVariant),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(text: context.intl.bodyAndConnector),
                TextSpan(
                  text: context.intl.linkPrivacyPolicy,
                  style: TextStyle(color: lightColorScheme.surfaceVariant),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
  Future<String?> convertXFileToBase64(XFile? file) async {
    if (file == null) return null;
    final bytes = await File(file.path).readAsBytes();
    return base64Encode(bytes);
  }
}