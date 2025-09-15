// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'intl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get startButton => '開始';

  @override
  String get nextButton => '次へ';

  @override
  String get backToHomeButton => 'ホームに戻る';

  @override
  String get homeScreenTitle => 'Mood Todayへようこそ';

  @override
  String get homeScreenBodyText => '気分を追跡し、改善するための日常のパートナー。より幸せな自分への旅を始めましょう！';

  @override
  String get selectAnswerError => '続行するには回答を選択してください。';

  @override
  String get yourResult => 'あなたの結果';

  @override
  String quizCompletionMessage(int score) {
    return 'クイズが完了しました！こちらがあなたの結果です：$score';
  }

  @override
  String get chooseLanguage => '言語を選択';
}
