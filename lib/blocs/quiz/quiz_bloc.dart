import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_today/blocs/quiz/quiz_event.dart';
import 'package:mood_today/blocs/quiz/quiz_state.dart';
import 'package:mood_today/services/gemini_service.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GeminiService _geminiService = GeminiService();

  QuizBloc() : super(QuizState.initial()) {
    on<NextQuestionEvent>(_onNextQuestion);
    on<SelectAnswerEvent>(_onSelectAnswer);
    on<ResetQuizEvent>(_onResetQuiz);
    on<OnLanguageChangeEvent>(_onLanguageChange);
    on<LoadQuestionsEvent>(_onLoadQuestions);
    on<AnalyzeMoodEvent>(_onAnalyzeMood);
  }

  void _onNextQuestion(NextQuestionEvent event, Emitter<QuizState> emit) async {
    if (state.selectedAnswer.isEmpty) {
      emit(state.copyWith(showError: true));
      return;
    }

    // Store the current question-answer pair
    List<QuestionAnswer> updatedAnswers = List.from(state.questionAnswers);
    updatedAnswers.add(QuestionAnswer(
      question: state.totalQuestions[state.currentQuestionIndex],
      answer: state.selectedAnswer,
    ));

    if (state.currentQuestionIndex < state.totalQuestions.length - 1) {
      emit(state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        questionAnswers: updatedAnswers,
        selectedAnswer: "",
        showError: false,
      ));

      if (state.currentQuestionIndex == state.totalQuestions.length - 2) {
        emit(state.copyWith(buttonText: "Submit"));
      }
    } else {
      // Quiz completed - analyze mood
      emit(state.copyWith(
        questionAnswers: updatedAnswers,
        isAnalyzingMood: true,
      ));

      // Analyze mood with Gemini
      try {
        final moodAnalysis = await _geminiService.analyzeMood(updatedAnswers);
        emit(state.copyWith(
          isQuizCompleted: true,
          isAnalyzingMood: false,
          moodAnalysis: moodAnalysis,
        ));
      } catch (e) {
        emit(state.copyWith(
          isQuizCompleted: true,
          isAnalyzingMood: false,
        ));
      }
    }
  }

  void _onSelectAnswer(SelectAnswerEvent event, Emitter<QuizState> emit) {
    emit(
        state.copyWith(selectedAnswer: event.selectedAnswer, showError: false));
  }

  void _onResetQuiz(ResetQuizEvent event, Emitter<QuizState> emit) {
    emit(QuizState.initial());
  }

  void _onLanguageChange(OnLanguageChangeEvent event, Emitter<QuizState> emit) {
    emit(state.copyWith(selectedLocale: event.locale));
  }

  void _onLoadQuestions(LoadQuestionsEvent event,
      Emitter<QuizState> emit) async {
    emit(state.copyWith(isLoadingQuestions: true));

    try {
      final quizData = await _geminiService.generateMoodQuiz(questionCount: 5);
      emit(state.copyWith(
        quizData: quizData,
        isLoadingQuestions: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoadingQuestions: false));
    }
  }

  void _onAnalyzeMood(AnalyzeMoodEvent event, Emitter<QuizState> emit) async {
    emit(state.copyWith(isAnalyzingMood: true));

    try {
      final moodAnalysis = await _geminiService.analyzeMood(
          state.questionAnswers);
      emit(state.copyWith(
        moodAnalysis: moodAnalysis,
        isAnalyzingMood: false,
      ));
    } catch (e) {
      emit(state.copyWith(isAnalyzingMood: false));
    }
  }
}