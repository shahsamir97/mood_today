import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_today/blocs/quiz/quiz_event.dart';
import 'package:mood_today/blocs/quiz/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {

  QuizBloc() : super(QuizState.initial()) {
    on<NextQuestionEvent>(_onNextQuestion);
    on<SelectAnswerEvent>(_onSelectAnswer);
    on<ResetQuizEvent>(_onResetQuiz);
    on<OnLanguageChangeEvent>(_onLanguageChange);
  }

  void _onNextQuestion(NextQuestionEvent event, Emitter<QuizState> emit) {
    if (state.selectedAnswer.isEmpty) {
      emit(state.copyWith(showError: true));
      return;
    }

    if (state.currentQuestionIndex < state.totalQuestions.length - 1) {
      emit(state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex + 1,
          selectedAnswer: "",
          showError: false
      ),
      );

      if (state.currentQuestionIndex == state.totalQuestions.length - 1) {
        emit(state.copyWith(buttonText: "Submit"));
      }
    } else {
      emit(state.copyWith(isQuizCompleted: true));
    }
  }

  void _onSelectAnswer(SelectAnswerEvent event, Emitter<QuizState> emit) {
    emit(state.copyWith(selectedAnswer: event.selectedAnswer));
  }

  void _onResetQuiz(ResetQuizEvent event, Emitter<QuizState> emit) {
    emit(QuizState.initial());
  }

  void _onLanguageChange(OnLanguageChangeEvent event, Emitter<QuizState> emit) {
    emit(state.copyWith(selectedLocale: event.locale));
  }
}