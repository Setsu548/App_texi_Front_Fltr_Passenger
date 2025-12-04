import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/link_text_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/star_rating_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TravelRatingView extends HookWidget {
  const TravelRatingView({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Center(
          child: TitleText(context.intl.titleHowWasYourTrip),
        ),
        SizedBox(height: 20),
        Center(
          child: StarRating(
            onRatingChanged: (newRating) {},
          ),
        ),
        SizedBox(height: 20),
        LabelText(context.intl.labelAdditionalCommentsOptional),
        SizedBox(height: 10),
        TextField(
          maxLines: 5, 
          decoration: InputDecoration(
            hintText: context.intl.hintTellUsMoreAboutExperience,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
        SizedBox(height: 30),
        PrimaryButton(text: context.intl.btnSubmitRating, onPressed: (){
          appRouter.pushReplacement('/travel/travel_request');
        }),
        SizedBox(height: 30),
        Center(child: LinkTextSecondary(context.intl.linkSkipForNow, onTap: (){}))
      ],
    );
  }
}