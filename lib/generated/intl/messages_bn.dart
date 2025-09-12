// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a bn locale. All the
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
  String get localeName => 'bn';

  static String m0(score) => "আপনি কুইজ সম্পন্ন করেছেন! এখানে আপনার ফলাফল:";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "backToHomeButton": MessageLookupByLibrary.simpleMessage("হোমে ফিরে যান"),
    "homeScreenBodyText": MessageLookupByLibrary.simpleMessage(
      "আপনার দৈনন্দিন সঙ্গী মেজাজ ট্র্যাক এবং উন্নত করার জন্য। আরও সুখী আপনি হওয়ার যাত্রা শুরু করুন!",
    ),
    "homeScreenTitle": MessageLookupByLibrary.simpleMessage(
      "মুড টুডে-তে স্বাগতম",
    ),
    "nextButton": MessageLookupByLibrary.simpleMessage("পরবর্তী"),
    "quizCompletionMessage": m0,
    "selectAnswerError": MessageLookupByLibrary.simpleMessage(
      "আগে উত্তর নির্বাচন করুন তারপর এগিয়ে যান।",
    ),
    "startButton": MessageLookupByLibrary.simpleMessage("শুরু"),
    "yourResult": MessageLookupByLibrary.simpleMessage("আপনার ফলাফল"),
  };
}
