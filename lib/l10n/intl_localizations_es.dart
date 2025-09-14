// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'intl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get startButton => 'Iniciar';

  @override
  String get nextButton => 'Siguiente';

  @override
  String get backToHomeButton => 'Volver al inicio';

  @override
  String get homeScreenTitle => 'Bienvenido a Mood Today';

  @override
  String get homeScreenBodyText =>
      'Tu compañero diario para seguir y mejorar tu estado de ánimo. ¡Comienza tu viaje hacia una versión más feliz de ti!';

  @override
  String get selectAnswerError =>
      'Por favor, seleccione una respuesta antes de continuar.';

  @override
  String get yourResult => 'Tu resultado';

  @override
  String quizCompletionMessage(int score) {
    return '¡Has completado el cuestionario! Aquí están tus resultados: $score';
  }

  @override
  String get chooseLanguage => 'Elegir idioma';
}
