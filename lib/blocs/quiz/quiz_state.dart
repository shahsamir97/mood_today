import 'dart:ui';
import 'package:mood_today/services/gemini_service.dart';

class QuizState {
  final int currentQuestionIndex;
  final List<QuestionAnswer> questionAnswers;
  final bool isQuizCompleted;
  final String buttonText;
  final bool showError;
  final isAnswerSelected;
  final String selectedAnswer;
  final Locale selectedLocale;
  final QuizData? quizData;
  final bool isLoadingQuestions;
  final bool isAnalyzingMood;
  final MoodAnalysis? moodAnalysis;

  final supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('bn'),
    Locale('fr'),
    Locale('zh'),
    Locale('ja'),
  ];

  List<String> get totalQuestions {
    if (quizData != null && quizData!.questions.isNotEmpty) {
      return quizData!.questions.map((q) => q.question).toList();
    }
    return [
      "How was your day?",
      "How do you feel today?",
      "Rate your mood",
      "How satisfied are you with your day?",
      "How was your overall experience today?"
    ];
  }

  List<String> get answerOptions {
    if (quizData != null &&
        quizData!.questions.isNotEmpty &&
        currentQuestionIndex < quizData!.questions.length) {
      return quizData!.questions[currentQuestionIndex].options;
    }
    return [
      "Very Bad",
      "Bad",
      "Neutral",
      "Good",
      "Very Good"
    ];
  }

  factory QuizState.initial() {
    return QuizState(
      0,
      [],
      false,
      "Next",
      false,
      false,
      "",
      Locale('en'),
      null,
      false,
      false,
      null,
    );
  }

  QuizState copyWith({
    int? currentQuestionIndex,
    List<QuestionAnswer>? questionAnswers,
    bool? isQuizCompleted,
    String? buttonText,
    bool? showError,
    String? selectedAnswer,
    Locale? selectedLocale,
    QuizData? quizData,
    bool? isLoadingQuestions,
    bool? isAnalyzingMood,
    MoodAnalysis? moodAnalysis,
  }) {
    return QuizState(
      currentQuestionIndex ?? this.currentQuestionIndex,
      questionAnswers ?? this.questionAnswers,
      isQuizCompleted ?? this.isQuizCompleted,
      buttonText ?? this.buttonText,
      showError ?? this.showError,
      isAnswerSelected,
      selectedAnswer ?? this.selectedAnswer,
      selectedLocale ?? this.selectedLocale,
      quizData ?? this.quizData,
      isLoadingQuestions ?? this.isLoadingQuestions,
      isAnalyzingMood ?? this.isAnalyzingMood,
      moodAnalysis ?? this.moodAnalysis,
    );
  }

  QuizState(
    this.currentQuestionIndex,
    this.questionAnswers,
    this.isQuizCompleted,
    this.buttonText,
    this.showError,
    this.isAnswerSelected,
    this.selectedAnswer,
    this.selectedLocale,
    this.quizData,
    this.isLoadingQuestions,
    this.isAnalyzingMood,
    this.moodAnalysis,
  );
}
