// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Start`
  String get startButton {
    return Intl.message('Start', name: 'startButton', desc: '', args: []);
  }

  /// `Next`
  String get nextButton {
    return Intl.message('Next', name: 'nextButton', desc: '', args: []);
  }

  /// `Back to Home`
  String get backToHomeButton {
    return Intl.message(
      'Back to Home',
      name: 'backToHomeButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Mood Today`
  String get homeScreenTitle {
    return Intl.message(
      'Welcome to Mood Today',
      name: 'homeScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your daily companion for tracking and enhancing your mood. Start your journey towards a happier you!`
  String get homeScreenBodyText {
    return Intl.message(
      'Your daily companion for tracking and enhancing your mood. Start your journey towards a happier you!',
      name: 'homeScreenBodyText',
      desc: '',
      args: [],
    );
  }

  /// `Please select an answer to proceed.`
  String get selectAnswerError {
    return Intl.message(
      'Please select an answer to proceed.',
      name: 'selectAnswerError',
      desc: '',
      args: [],
    );
  }

  /// `Your Result`
  String get yourResult {
    return Intl.message('Your Result', name: 'yourResult', desc: '', args: []);
  }

  /// `You have completed the quiz! Here are your result: {score}`
  String quizCompletionMessage(int score) {
    return Intl.message(
      'You have completed the quiz! Here are your result: $score',
      name: 'quizCompletionMessage',
      desc: 'Message shown after completing quiz with score',
      args: [score],
    );
  }

  /// `Choose language`
  String get chooseLanguage {
    return Intl.message(
      'Choose language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
