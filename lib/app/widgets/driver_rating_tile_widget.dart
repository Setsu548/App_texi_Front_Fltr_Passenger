import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';

class DriverRatingTile extends StatelessWidget {
  const DriverRatingTile({
    super.key,
    required this.name,
    required this.rating,          
    this.avatarImage,            
    this.onTap,
  });

  final String name;
  final double rating;
  final ImageProvider? avatarImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: lightColorScheme.onSurface.withOpacity(.1),
          backgroundImage: avatarImage,
          child: avatarImage == null
              ? Icon(Icons.person, size: 20, color: lightColorScheme.onSurface)
              : null,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(name, maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.star_rounded, size: 16, color: lightColorScheme.surfaceVariant),
                  SizedBox(width: 4),
                  LabelText(rating.toStringAsFixed(1)),
                ],
              ),
            ],
          ),
        ),
      ],
    );

    return onTap == null
        ? content
        : InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            child: Padding(padding: const EdgeInsets.all(4), child: content),
          );
  }
}
