import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';

class ProfileIdentityTile extends StatelessWidget {
  const ProfileIdentityTile({
    super.key,
    required this.name,
    required this.idValue,
    this.idLabel = 'IDTX',
    this.avatarImage,            
    this.avatarRadius = 36,
    this.ringColor,
    this.onCopy,                  
  });

  final String name;
  final String idValue;
  final String idLabel;
  final ImageProvider? avatarImage;
  final double avatarRadius;
  final Color? ringColor;
  final VoidCallback? onCopy;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ringColor ?? lightColorScheme.secondaryContainer,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: avatarRadius,
            backgroundColor: lightColorScheme.secondary,
            backgroundImage: avatarImage,
            child: avatarImage == null
                ? Icon(Icons.person, color: lightColorScheme.secondary, size: avatarRadius)
                : null,
          ),
        ),
        SizedBox(height: 12),
        BodyText(
          name,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LabelText('$idLabel:'),
            SizedBox(width: 15),
            LabelText(idValue),
            SizedBox(width: 5),
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: onCopy ??
                  () async {
                    await Clipboard.setData(ClipboardData(text: idValue));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('ID copiado')),
                    );
                  },
              child: Icon(Icons.copy_rounded,
              size: 18, color: lightColorScheme.onSurface),
            ),
          ],
        ),
      ],
    );
  }
}
