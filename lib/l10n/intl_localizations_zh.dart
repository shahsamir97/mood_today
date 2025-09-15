// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'intl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get startButton => '开始';

  @override
  String get nextButton => '下一个';

  @override
  String get backToHomeButton => '返回主页';

  @override
  String get homeScreenTitle => '欢迎使用今日心情';

  @override
  String get homeScreenBodyText => '您追踪和改善心情的日常伴侣。开始您通往更快乐自我的旅程！';

  @override
  String get selectAnswerError => '请选择一个答案后继续。';

  @override
  String get yourResult => '您的结果';

  @override
  String quizCompletionMessage(int score) {
    return '您已完成问卷！这是您的结果：$score';
  }

  @override
  String get chooseLanguage => '选择语言';
}
