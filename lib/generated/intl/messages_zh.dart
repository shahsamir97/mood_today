// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(score) => "您已完成问卷！这是您的结果：${score}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "backToHomeButton": MessageLookupByLibrary.simpleMessage("返回主页"),
    "chooseLanguage": MessageLookupByLibrary.simpleMessage("选择语言"),
    "homeScreenBodyText": MessageLookupByLibrary.simpleMessage(
      "您追踪和改善心情的日常伴侣。开始您通往更快乐自我的旅程！",
    ),
    "homeScreenTitle": MessageLookupByLibrary.simpleMessage("欢迎使用今日心情"),
    "nextButton": MessageLookupByLibrary.simpleMessage("下一个"),
    "quizCompletionMessage": m0,
    "selectAnswerError": MessageLookupByLibrary.simpleMessage("请选择一个答案后继续。"),
    "startButton": MessageLookupByLibrary.simpleMessage("开始"),
    "yourResult": MessageLookupByLibrary.simpleMessage("您的结果"),
  };
}
