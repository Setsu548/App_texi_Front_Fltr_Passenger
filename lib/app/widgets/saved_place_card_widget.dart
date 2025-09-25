import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';
import '../widgets/card_on_surface_widget.dart';

class SavedPlaceCard extends StatelessWidget {
  const SavedPlaceCard({
    super.key,
    required this.title,                 
    required this.address,              
    required this.onRequestRide,         
    this.isFavorite = true,
    this.onToggleFavorite,
    this.leadingIcon = Icons.apartment,  
    this.buttonText,
  });

  final String title;
  final String address;
  final VoidCallback onRequestRide;
  final bool isFavorite;
  final VoidCallback? onToggleFavorite;
  final IconData leadingIcon;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return CardOnSurface(
      backgroundColor: lightColorScheme.secondary,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      padding: EdgeInsets.all(20),
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(leadingIcon, size: 18, color: lightColorScheme.surfaceVariant),
                    SizedBox(width: 8),
                    BodyText(title),
                  ],
                ),
                InkWell(
                  onTap: onToggleFavorite,
                  borderRadius: BorderRadius.circular(16),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: Icon(
                    isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    color: lightColorScheme.surfaceVariant,
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            LabelText(
              address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        PrimaryButton(text:buttonText ?? context.intl.btnSavedPlaceCardRequestRide, onPressed: onRequestRide)
      ],
    );
  }
}
