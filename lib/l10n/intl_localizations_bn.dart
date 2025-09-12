// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'intl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get startButton => 'শুরু';

  @override
  String get nextButton => 'পরবর্তী';

  @override
  String get backToHomeButton => 'হোমে ফিরে যান';

  @override
  String get homeScreenTitle => 'মুড টুডে-তে স্বাগতম';

  @override
  String get homeScreenBodyText =>
      'আপনার দৈনন্দিন সঙ্গী মেজাজ ট্র্যাক এবং উন্নত করার জন্য। আরও সুখী আপনি হওয়ার যাত্রা শুরু করুন!';

  @override
  String get selectAnswerError => 'আগে উত্তর নির্বাচন করুন তারপর এগিয়ে যান।';

  @override
  String get yourResult => 'আপনার ফলাফল';

  @override
  String quizCompletionMessage(int score) {
    return 'আপনি কুইজ সম্পন্ন করেছেন! এখানে আপনার ফলাফল:';
  }
}
