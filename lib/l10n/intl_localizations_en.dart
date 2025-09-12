// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'intl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get startButton => 'Start';

  @override
  String get nextButton => 'Next';

  @override
  String get backToHomeButton => 'Back to Home';

  @override
  String get homeScreenTitle => 'Welcome to Mood Today';

  @override
  String get homeScreenBodyText =>
      'Your daily companion for tracking and enhancing your mood. Start your journey towards a happier you!';

  @override
  String get selectAnswerError => 'Please select an answer to proceed.';

  @override
  String get yourResult => 'Your Result';

  @override
  String quizCompletionMessage(int score) {
    return 'You have completed the quiz! Here are your result: $score';
  }
}
