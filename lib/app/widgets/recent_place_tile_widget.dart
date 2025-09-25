import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';

class RecentPlaceTile extends StatelessWidget {
  const RecentPlaceTile({
    super.key,
    required this.title,           
    required this.address,      
    this.statusColor, 
    this.onTap,
    this.showCardDecoration = true, 
  });

  final String title;
  final String address;
  final Color? statusColor;
  final VoidCallback? onTap;
  final bool showCardDecoration;

  @override
  Widget build(BuildContext context) {

    final content = Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightColorScheme.secondaryContainer,
          ),
          child: Icon(Icons.schedule_rounded, size: 20, color: lightColorScheme.onSurface),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              LabelText(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );

    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: showCardDecoration
            ? BoxDecoration(
                color: lightColorScheme.secondary,
              )
            : null,
        child: content,
      ),
    );
  }
}
