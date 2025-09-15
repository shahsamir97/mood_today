//create a class called QuizEvent with an abstract class where there will be different events for the quiz. One event for switching to the next question, one event for selecting an answer, and one event for last question reached.
import 'dart:ui';

abstract class QuizEvent {}

class NextQuestionEvent extends QuizEvent {}

class SelectAnswerEvent extends QuizEvent {
  final String selectedAnswer;

  SelectAnswerEvent(this.selectedAnswer);
}

class ResetQuizEvent extends QuizEvent {}

class OnLanguageChangeEvent extends QuizEvent {
  final Locale locale;

  OnLanguageChangeEvent(this.locale);
}

class LoadQuestionsEvent extends QuizEvent {}

class AnalyzeMoodEvent extends QuizEvent {}
