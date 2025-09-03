import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @labelLaborCategory.
  ///
  /// In es, this message translates to:
  /// **'Categoría laboral'**
  String get labelLaborCategory;

  /// No description provided for @labelInitialAdvisor.
  ///
  /// In es, this message translates to:
  /// **'Asesor inicial'**
  String get labelInitialAdvisor;

  /// No description provided for @commonCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar Viaje'**
  String get commonCancel;

  /// No description provided for @labelFastestSafestTravel.
  ///
  /// In es, this message translates to:
  /// **'La forma más rapida y segura de viajar'**
  String get labelFastestSafestTravel;

  /// No description provided for @bodyMsgSendAccessCode.
  ///
  /// In es, this message translates to:
  /// **'TE ENVIAREMOS UN CÓDIGO DE ACCESO'**
  String get bodyMsgSendAccessCode;

  /// No description provided for @hintEnterYourNumber.
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu número'**
  String get hintEnterYourNumber;

  /// No description provided for @buttonRequestCode.
  ///
  /// In es, this message translates to:
  /// **'Solicitar código'**
  String get buttonRequestCode;

  /// No description provided for @titleAccountVerification.
  ///
  /// In es, this message translates to:
  /// **'Verificación de cuenta'**
  String get titleAccountVerification;

  /// No description provided for @bodyEnterVerificationCode.
  ///
  /// In es, this message translates to:
  /// **'Ingresa el código de verificación que enviaremos a tu WhatsApp'**
  String get bodyEnterVerificationCode;

  /// No description provided for @btnVerify.
  ///
  /// In es, this message translates to:
  /// **'Verificar'**
  String get btnVerify;

  /// No description provided for @labelDidNotReceiveCode.
  ///
  /// In es, this message translates to:
  /// **'¿No recibiste el código?'**
  String get labelDidNotReceiveCode;

  /// No description provided for @linkResendCode.
  ///
  /// In es, this message translates to:
  /// **'Reenviar código'**
  String get linkResendCode;

  /// No description provided for @titleProfileInformation.
  ///
  /// In es, this message translates to:
  /// **'Información de Perfil'**
  String get titleProfileInformation;

  /// No description provided for @bodyPleaseEnterYourData.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa tus datos.'**
  String get bodyPleaseEnterYourData;

  /// No description provided for @labelFullNameRequired.
  ///
  /// In es, this message translates to:
  /// **'Nombre Completo*'**
  String get labelFullNameRequired;

  /// No description provided for @hintFullNameExample.
  ///
  /// In es, this message translates to:
  /// **'Ej. Juan Perez Rodriguez'**
  String get hintFullNameExample;

  /// No description provided for @labelPhoneNumberRequired.
  ///
  /// In es, this message translates to:
  /// **'Número de teléfono*'**
  String get labelPhoneNumberRequired;

  /// No description provided for @btnContinue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get btnContinue;

  /// No description provided for @bodyContinueAcceptsPrefix.
  ///
  /// In es, this message translates to:
  /// **'Al continuar aceptas los '**
  String get bodyContinueAcceptsPrefix;

  /// No description provided for @linkTermsConditions.
  ///
  /// In es, this message translates to:
  /// **'términos, condiciones'**
  String get linkTermsConditions;

  /// No description provided for @bodyAndConnector.
  ///
  /// In es, this message translates to:
  /// **' y '**
  String get bodyAndConnector;

  /// No description provided for @linkPrivacyPolicy.
  ///
  /// In es, this message translates to:
  /// **'política de privacidad'**
  String get linkPrivacyPolicy;

  /// No description provided for @titleRequestTrip.
  ///
  /// In es, this message translates to:
  /// **'Solicitar Viaje'**
  String get titleRequestTrip;

  /// No description provided for @labelDestination.
  ///
  /// In es, this message translates to:
  /// **'Destino'**
  String get labelDestination;

  /// No description provided for @labelSavedDestinations.
  ///
  /// In es, this message translates to:
  /// **'Destinos Guardados'**
  String get labelSavedDestinations;

  /// No description provided for @titleSelectYourVehicle.
  ///
  /// In es, this message translates to:
  /// **'Selecciona tu vehículo'**
  String get titleSelectYourVehicle;

  /// No description provided for @btnRequestTaxiNow.
  ///
  /// In es, this message translates to:
  /// **'Solicitar taxi ahora'**
  String get btnRequestTaxiNow;

  /// No description provided for @titleRequestVehicleFromOperator.
  ///
  /// In es, this message translates to:
  /// **'Solicita un vehículo a la Operadora'**
  String get titleRequestVehicleFromOperator;

  /// No description provided for @titleCallTexiOperator.
  ///
  /// In es, this message translates to:
  /// **'Llamar Operador TEXI'**
  String get titleCallTexiOperator;

  /// No description provided for @descTexiCentral.
  ///
  /// In es, this message translates to:
  /// **'Central TEXI'**
  String get descTexiCentral;

  /// No description provided for @titleSelectYourDestination.
  ///
  /// In es, this message translates to:
  /// **'Selecciona tu destino'**
  String get titleSelectYourDestination;

  /// No description provided for @hintEnterYourAddress.
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu dirección'**
  String get hintEnterYourAddress;

  /// No description provided for @titleRealTimeTracking.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento en tiempo real'**
  String get titleRealTimeTracking;

  /// No description provided for @labelDriverOnTheWay.
  ///
  /// In es, this message translates to:
  /// **'Tu conductor está en camino'**
  String get labelDriverOnTheWay;

  /// No description provided for @labelEstimatedArrivalTime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo estimado de llegada'**
  String get labelEstimatedArrivalTime;

  /// No description provided for @rightTextOnTheWay.
  ///
  /// In es, this message translates to:
  /// **'En camino'**
  String get rightTextOnTheWay;

  /// No description provided for @bodyTripDetails.
  ///
  /// In es, this message translates to:
  /// **'Detalles del viaje'**
  String get bodyTripDetails;

  /// No description provided for @labelOrigin.
  ///
  /// In es, this message translates to:
  /// **'Origen'**
  String get labelOrigin;

  /// No description provided for @titleTripInProgress.
  ///
  /// In es, this message translates to:
  /// **'Viaje en curso'**
  String get titleTripInProgress;

  /// No description provided for @labelEstimatedDistance.
  ///
  /// In es, this message translates to:
  /// **'Distancia estimada'**
  String get labelEstimatedDistance;

  /// No description provided for @labelEstimatedTime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo estimado'**
  String get labelEstimatedTime;

  /// No description provided for @labelFare.
  ///
  /// In es, this message translates to:
  /// **'Tarifa'**
  String get labelFare;

  /// No description provided for @btnSafeTrip.
  ///
  /// In es, this message translates to:
  /// **'Viaje seguro'**
  String get btnSafeTrip;

  /// No description provided for @titleTripSafety.
  ///
  /// In es, this message translates to:
  /// **'Seguridad en viaje'**
  String get titleTripSafety;

  /// No description provided for @labelShareLocationAndEmergency.
  ///
  /// In es, this message translates to:
  /// **'Comparte tu ubicación y acude a contactos de emergencia'**
  String get labelShareLocationAndEmergency;

  /// No description provided for @titleFrequentContacts.
  ///
  /// In es, this message translates to:
  /// **'Contactos frecuentes'**
  String get titleFrequentContacts;

  /// No description provided for @btnShareRealTimeLocation.
  ///
  /// In es, this message translates to:
  /// **'Compartir ubicación en tiempo real'**
  String get btnShareRealTimeLocation;

  /// No description provided for @titleEmergencyContacts.
  ///
  /// In es, this message translates to:
  /// **'Contactos de emergencia'**
  String get titleEmergencyContacts;

  /// No description provided for @titleTexi.
  ///
  /// In es, this message translates to:
  /// **'TEXI'**
  String get titleTexi;

  /// No description provided for @descTexiCustomerService.
  ///
  /// In es, this message translates to:
  /// **'Atención al cliente'**
  String get descTexiCustomerService;

  /// No description provided for @titleTechnicalSupport.
  ///
  /// In es, this message translates to:
  /// **'Soporte técnico'**
  String get titleTechnicalSupport;

  /// No description provided for @descCallTechnicalSupport.
  ///
  /// In es, this message translates to:
  /// **'Llama soporte técnico'**
  String get descCallTechnicalSupport;

  /// No description provided for @titleEmergencies.
  ///
  /// In es, this message translates to:
  /// **'EMERGENCIAS'**
  String get titleEmergencies;

  /// No description provided for @descCallEmergencies.
  ///
  /// In es, this message translates to:
  /// **'Llamar emergencias'**
  String get descCallEmergencies;

  /// No description provided for @btnBack.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get btnBack;

  /// No description provided for @titleHowWasYourTrip.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo fue tu viaje?'**
  String get titleHowWasYourTrip;

  /// No description provided for @labelAdditionalCommentsOptional.
  ///
  /// In es, this message translates to:
  /// **'Comentarios adicionales (opcional)'**
  String get labelAdditionalCommentsOptional;

  /// No description provided for @hintTellUsMoreAboutExperience.
  ///
  /// In es, this message translates to:
  /// **'Cuéntanos más sobre tu experiencia...'**
  String get hintTellUsMoreAboutExperience;

  /// No description provided for @btnSubmitRating.
  ///
  /// In es, this message translates to:
  /// **'Enviar calificación'**
  String get btnSubmitRating;

  /// No description provided for @linkSkipForNow.
  ///
  /// In es, this message translates to:
  /// **'Omitir por ahora'**
  String get linkSkipForNow;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
