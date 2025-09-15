import 'dart:ui';

class QuizState {
  final int currentQuestionIndex;
  final Map<String, String> selectedQuestionAnswers;
  final bool isQuizCompleted;
  final String buttonText;
  final bool showError;
  final isAnswerSelected;
  final String selectedAnswer;
  final Locale selectedLocale;

  final supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('bn'),
    Locale('fr'),
  ];

  final List totalQuestions = [
    "How was your day?",
    "How do you feel today?",
    "Rate your mood",
    "How satisfied are you with your day?",
    "How was your overall experience today?"
  ];

  final List answerOptions = [
    "Very Bad",
    "Bad",
    "Neutral",
    "Good",
    "Very Good"
  ];

  factory QuizState.initial() {
    return QuizState(0, {}, false, "Next", false, false, "", Locale('en') );
  }

  QuizState copyWith({
      int? currentQuestionIndex,
      Map<String, String>? selectedAnswers,
      bool? isQuizCompleted,
      String? buttonText,
     bool? showError,
      String? selectedAnswer,
    Locale? selectedLocale,
    }) {
      return QuizState(
        currentQuestionIndex ?? this.currentQuestionIndex,
        selectedQuestionAnswers,
        isQuizCompleted ?? this.isQuizCompleted,
        buttonText ?? this.buttonText,
        showError ?? this.showError,
        isAnswerSelected,
        selectedAnswer ?? this.selectedAnswer,
        selectedLocale ?? this.selectedLocale
      );
    }

  QuizState(this.currentQuestionIndex,
      this.selectedQuestionAnswers,
      this.isQuizCompleted,
      this.buttonText,
      this.showError,
      this.isAnswerSelected,
      this.selectedAnswer,
      this.selectedLocale
      );
}
