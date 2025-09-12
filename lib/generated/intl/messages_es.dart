// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(score) =>
      "¡Has completado el cuestionario! Aquí están tus resultados: ${score}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "backToHomeButton": MessageLookupByLibrary.simpleMessage(
      "Volver al inicio",
    ),
    "homeScreenBodyText": MessageLookupByLibrary.simpleMessage(
      "Tu compañero diario para seguir y mejorar tu estado de ánimo. ¡Comienza tu viaje hacia una versión más feliz de ti!",
    ),
    "homeScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Bienvenido a Mood Today",
    ),
    "nextButton": MessageLookupByLibrary.simpleMessage("Siguiente"),
    "quizCompletionMessage": m0,
    "selectAnswerError": MessageLookupByLibrary.simpleMessage(
      "Por favor, seleccione una respuesta antes de continuar.",
    ),
    "startButton": MessageLookupByLibrary.simpleMessage("Iniciar"),
    "yourResult": MessageLookupByLibrary.simpleMessage("Tu resultado"),
  };
}
