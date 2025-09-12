import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_today/l10n/intl_localizations.dart';
import '../../blocs/quiz/quiz_bloc.dart';
import '../../blocs/quiz/quiz_event.dart';
import '../../blocs/quiz/quiz_state.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        right: true,
        left: true,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  state.totalQuestions[state.currentQuestionIndex],
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RadioGroup<String>(
                      groupValue: state.selectedAnswer,
                      onChanged: (String? value) {
                        context.read<QuizBloc>().add(
                          SelectAnswerEvent(value ?? ""),
                        );
                      },
                      child: Column(
                        children: state.answerOptions.map((option) {
                          return ListTile(
                            title: Text(option),
                            leading: Radio<String>(value: option),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(16)),
                if (state.showError)
                  Text(
                    AppLocalizations.of(context)!.selectAnswerError,
                    style: TextStyle(color: Colors.red),
                  ),
                Padding(padding: EdgeInsets.all(16)),
                ElevatedButton(
                  onPressed: () {
                    context.read<QuizBloc>().add(NextQuestionEvent());
                  },
                  child: Text(state.buttonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
