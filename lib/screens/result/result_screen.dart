import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_today/blocs/quiz/quiz_bloc.dart';
import 'package:mood_today/blocs/quiz/quiz_state.dart';
import 'package:mood_today/l10n/intl_localizations.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.title});
  final String title;

 @override
 State<StatefulWidget> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        right: true,
        left: true,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: BlocBuilder<QuizBloc, QuizState>(builder: (context, state) =>
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  AppLocalizations.of(context)!.yourResult,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(16)),
                  Text(AppLocalizations.of(context)!.quizCompletionMessage(10),
                    style: TextStyle(fontSize: 22),),

                  Padding(padding: EdgeInsets.all(16)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.backToHomeButton),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}