import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';

class DriverInfo extends StatelessWidget {
  final String personName;
  final String vehicleName;
  final String licensePlate;
  final String avatarUrl;
  final double rating;

  const DriverInfo({
    super.key,
    required this.personName,
    required this.vehicleName,
    required this.licensePlate,
    required this.avatarUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(avatarUrl),
          backgroundColor: lightColorScheme.secondary, 
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(personName),
              SizedBox(height: 4),
              BodyText(vehicleName),
              LabelText(licensePlate),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star, color: lightColorScheme.surfaceVariant, size: 20),
                  SizedBox(width: 4),
                  LabelText('$rating')
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
