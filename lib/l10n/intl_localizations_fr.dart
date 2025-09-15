// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'intl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get startButton => 'Commencer';

  @override
  String get nextButton => 'Suivant';

  @override
  String get backToHomeButton => 'Retour à l\'accueil';

  @override
  String get homeScreenTitle => 'Bienvenue dans Mood Today';

  @override
  String get homeScreenBodyText =>
      'Votre compagnon quotidien pour suivre et améliorer votre humeur. Commencez votre voyage vers une version plus heureuse de vous-même !';

  @override
  String get selectAnswerError =>
      'Veuillez sélectionner une réponse pour continuer.';

  @override
  String get yourResult => 'Votre résultat';

  @override
  String quizCompletionMessage(int score) {
    return 'Vous avez terminé le quiz ! Voici votre résultat : $score';
  }

  @override
  String get chooseLanguage => 'Choisir la langue';
}
