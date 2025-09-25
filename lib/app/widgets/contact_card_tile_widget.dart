import 'package:app_texi_passenger/app/widgets/card_on_surface_widget.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';

class ContactCardTile extends StatelessWidget {
  const ContactCardTile({
    super.key,
    required this.name,
    required this.idText,      
    required this.phoneText,   
    this.onEdit,
    this.onDelete,
  });

  final String name;
  final String idText;
  final String phoneText;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return CardOnSurface(
      padding: EdgeInsetsGeometry.all(20),
      backgroundColor: lightColorScheme.secondary,
      children: [
        Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(name),
                SizedBox(height: 10),
                LabelText('ID: $idText'),
                LabelText(phoneText),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: onEdit,
                borderRadius: BorderRadius.circular(8),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                child: Icon(Icons.edit_rounded,
                    size: 25, color: lightColorScheme.onSurface),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(8),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                child: Icon(Icons.delete_rounded,
                    size: 25, color: lightColorScheme.onSurface),
              ),
            ],
          ),
        ],
      ),
      ],
    );
  }
}
