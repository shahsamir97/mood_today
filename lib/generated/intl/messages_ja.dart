// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(score) => "クイズが完了しました！こちらがあなたの結果です：${score}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "backToHomeButton": MessageLookupByLibrary.simpleMessage("ホームに戻る"),
    "chooseLanguage": MessageLookupByLibrary.simpleMessage("言語を選択"),
    "homeScreenBodyText": MessageLookupByLibrary.simpleMessage(
      "気分を追跡し、改善するための日常のパートナー。より幸せな自分への旅を始めましょう！",
    ),
    "homeScreenTitle": MessageLookupByLibrary.simpleMessage("Mood Todayへようこそ"),
    "nextButton": MessageLookupByLibrary.simpleMessage("次へ"),
    "quizCompletionMessage": m0,
    "selectAnswerError": MessageLookupByLibrary.simpleMessage(
      "続行するには回答を選択してください。",
    ),
    "startButton": MessageLookupByLibrary.simpleMessage("開始"),
    "yourResult": MessageLookupByLibrary.simpleMessage("あなたの結果"),
  };
}
