import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es'),
    Locale('en')
  ];

  /// No description provided for @login.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get login;

  /// No description provided for @register.
  ///
  /// In es, this message translates to:
  /// **'Registrarse'**
  String get register;

  /// No description provided for @title.
  ///
  /// In es, this message translates to:
  /// **'Título'**
  String get title;

  /// No description provided for @description.
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get description;

  /// No description provided for @date.
  ///
  /// In es, this message translates to:
  /// **'Fecha programada'**
  String get date;

  /// No description provided for @enableNotifications.
  ///
  /// In es, this message translates to:
  /// **'Habilitar notificaciones'**
  String get enableNotifications;

  /// No description provided for @save.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get save;

  /// No description provided for @password.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get password;

  /// No description provided for @noCurrentTasks.
  ///
  /// In es, this message translates to:
  /// **'Aun no tienes tareas'**
  String get noCurrentTasks;

  /// No description provided for @searchByTitle.
  ///
  /// In es, this message translates to:
  /// **'Buscar por título'**
  String get searchByTitle;

  /// No description provided for @language.
  ///
  /// In es, this message translates to:
  /// **'Idiomas'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In es, this message translates to:
  /// **'Temas'**
  String get theme;

  /// No description provided for @completedTasks.
  ///
  /// In es, this message translates to:
  /// **'Completadas'**
  String get completedTasks;

  /// No description provided for @userNotFound.
  ///
  /// In es, this message translates to:
  /// **'Usuario no encontrado'**
  String get userNotFound;

  /// No description provided for @incorrectPassword.
  ///
  /// In es, this message translates to:
  /// **'Contraseña incorrecta'**
  String get incorrectPassword;

  /// No description provided for @invalidEmailToRegister.
  ///
  /// In es, this message translates to:
  /// **'Correo inválido para registrarse'**
  String get invalidEmailToRegister;

  /// No description provided for @owner.
  ///
  /// In es, this message translates to:
  /// **'Propietario'**
  String get owner;

  /// No description provided for @other.
  ///
  /// In es, this message translates to:
  /// **'Otro'**
  String get other;

  /// No description provided for @anUnexpectedErrorOccurred.
  ///
  /// In es, this message translates to:
  /// **'Ocurrió un error inesperado'**
  String get anUnexpectedErrorOccurred;

  /// No description provided for @toggleThemeMode.
  ///
  /// In es, this message translates to:
  /// **'Modo Oscuro'**
  String get toggleThemeMode;

  /// No description provided for @name.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get name;

  /// No description provided for @lastName.
  ///
  /// In es, this message translates to:
  /// **'Apellido'**
  String get lastName;

  /// No description provided for @profile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// No description provided for @logout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get logout;

  /// No description provided for @dashboard.
  ///
  /// In es, this message translates to:
  /// **'Información general'**
  String get dashboard;

  /// No description provided for @users.
  ///
  /// In es, this message translates to:
  /// **'Usuarios'**
  String get users;

  /// No description provided for @taskResume.
  ///
  /// In es, this message translates to:
  /// **'Resumen de tareas'**
  String get taskResume;

  /// No description provided for @pendingTasks.
  ///
  /// In es, this message translates to:
  /// **'Pendientes'**
  String get pendingTasks;

  /// No description provided for @connectionError.
  ///
  /// In es, this message translates to:
  /// **'Problemas de conexión'**
  String get connectionError;

  /// No description provided for @connectionErrorDetail.
  ///
  /// In es, this message translates to:
  /// **'Al parecer tenemos problemas para conectarnos a la red, por favor inténtalo de nuevo'**
  String get connectionErrorDetail;

  /// No description provided for @retry.
  ///
  /// In es, this message translates to:
  /// **'Volver a intentar'**
  String get retry;

  /// No description provided for @theme_gallery.
  ///
  /// In es, this message translates to:
  /// **'Galería de temas'**
  String get theme_gallery;

  /// No description provided for @lang.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get lang;

  /// No description provided for @english.
  ///
  /// In es, this message translates to:
  /// **'Inglés'**
  String get english;

  /// No description provided for @spanish.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get spanish;

  /// No description provided for @tutorial_0.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido a la aplicación de tareas de Seek\nEn esta aplicación podrás gestionar tus tareas de forma sencilla y rápida.\n\n En la parte superior izquierda encontrarás un menú con opciones de configuración. En la parte inferior derecha encontrarás un botón para añadir nuevas tareas'**
  String get tutorial_0;

  /// No description provided for @tutorial_1.
  ///
  /// In es, this message translates to:
  /// **'Las tareas pueden programarse en una fecha y hora específica presionando el campo correspondiente. Puedes seleccionar el color que quieres tenga tu tarea o dejar que se asigne uno automáticamente. Al habilitar notificaciones la aplicación te recordará de la tarea.\n Recuerda guardar los cambios antes de salir.'**
  String get tutorial_1;

  /// No description provided for @tutorial_2.
  ///
  /// In es, this message translates to:
  /// **'En la pantalla principal encontrarás un listado con todas tus tareas. Tienes botones para eliminarlas y completarlas. Puedes editar una tarea al tocar en ella.\nEl boton de filtro te permite ver solo las tareas pendientes o todas las tareas. Por defecto se muestran solo las tareas pendientes.'**
  String get tutorial_2;

  /// No description provided for @tutorial_3.
  ///
  /// In es, this message translates to:
  /// **'El boton de fijar en la esquina izquierda de cada tarea te permite marcar una tarea como importante manteniendola en la parte superior de la lista. Puedes desfijarla en cualquier momento tocando el mismo botón. De igual manera, en la barra de búsqueda puedes filtrar tus tareas por título.'**
  String get tutorial_3;

  /// No description provided for @tutorial_4.
  ///
  /// In es, this message translates to:
  /// **'Al completar una tarea esta desaparecerá de la lista principal, puedes tocar en el botón de filtro para ver todas las tares y en estas tareas completadas puedes descompletarlas o eliminarlas si es necesario.'**
  String get tutorial_4;

  /// No description provided for @tutorial_5.
  ///
  /// In es, this message translates to:
  /// **'En último lugar, al tocar en el botón de menu en la parte superior izquierda puedes cambiar el idioma de la aplicación y seleccionar entre distintos temas de color muy interesantes.\n\n¡Listo! Ahora ya puedes empezar a gestionar tus tareas de forma eficiente. ¡Que disfrutes la aplicación!'**
  String get tutorial_5;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
