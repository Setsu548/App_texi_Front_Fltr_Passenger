import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/secondary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/selectable_reason_item_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CancelTripView extends HookWidget {
  const CancelTripView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final selectedIndex = useState<int?>(null);

    final reasons = [
      'El conductor está tardando demasiado',
      'Cambie de opinion',
      'Pedi el viaje por error',
      'El conductor me pidio cancelar',
      'Otro motivo',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleCancelTripView),
        LabelText(context.intl.bodyCancelTripReasonIntro),
        SizedBox(height: 20),
        BodyText(context.intl.bodyCancelTripQuestion),
        SizedBox(height: 10),
        Column(
          children: List.generate(reasons.length, (i) {
            final selected = selectedIndex.value == i;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: SelectableReasonItem(
                text: reasons[i],
                isSelected: selected,
                onTap: () => selectedIndex.value = i,
              ),
            );
          }),
        ),
        SizedBox(height: 10),
        LabelText(context.intl.labelCancelTripAddCommentOptional),
        SizedBox(height: 10),
        TextField(
          maxLines: 5, 
          decoration: InputDecoration(
            hintText: context.intl.hintCancelTripAddComment,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
        SizedBox(height: 10),
        LabelText(context.intl.labelCancelTripReasonVisibleTo),
        SizedBox(height: 20),
        PrimaryButton(
          text: context.intl.btnCancelTripConfirm, 
          onPressed: (){}
        ),
        SizedBox(height: 20),
        SecondaryButton(
          text: context.intl.btnBack, 
          onPressed: (){
          appRouter.push('/travel/driver_tracking');
          }
        ),
      ],
    );
  }
}