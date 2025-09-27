import 'package:app_texi_passenger/l10n/generated/l10n.dart';
import 'package:flutter/widgets.dart';


extension LocalizationExtension on BuildContext {
  AppLocalizations get intl => AppLocalizations.of(this);
}