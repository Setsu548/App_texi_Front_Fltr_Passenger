import 'package:app_texi_passenger/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';

class TripReceiptTile extends StatelessWidget {
  const TripReceiptTile({
    super.key,
    required this.id,                 
    required this.title,              
    required this.dateTimeText,       
    required this.driverName,         
    required this.priceText,         
    this.statusText,
    this.statusColor,
    this.onTap,
  });

  final String id;
  final String title;
  final String dateTimeText;
  final String driverName;
  final String priceText;
  final String? statusText;
  final Color? statusColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    return CardOnSurface(
      padding: EdgeInsetsGeometry.all(20),
      backgroundColor: lightColorScheme.secondary,
      children: [
        InkWell(
          onTap: onTap,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelText('ID: #$id'),
                  BodyText(priceText, color: lightColorScheme.surfaceVariant),
                ],
              ),
              SizedBox(height: 10),
              BodyText(title),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.schedule_rounded, size: 20, color: lightColorScheme.onSurface),
                  SizedBox(width: 10),
                  LabelText(dateTimeText),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.person_rounded, size: 20, color: lightColorScheme.onSurface),
                  SizedBox(width: 10),
                  Expanded(child: LabelText(driverName)),
                  Container(
                    padding:EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusColor ?? lightColorScheme.surfaceDim,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: LabelText(statusText ?? context.intl.statusTripCompleted),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
