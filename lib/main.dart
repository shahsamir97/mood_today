import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mood_today/blocs/quiz/quiz_bloc.dart';
import 'package:mood_today/blocs/quiz/quiz_state.dart';
import 'package:mood_today/l10n/intl_localizations.dart';
import 'package:mood_today/screens/home/home_screen.dart';
import 'package:mood_today/screens/result/result_screen.dart';

import 'blocs/quiz/quiz_event.dart';

void main() {
  runApp(BlocProvider(create: (_) => QuizBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('bn', 'BD'),
      ],
      locale: Locale('bn', 'BD'),
      home: BlocListener<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state.isQuizCompleted) {
            context.read<QuizBloc>().add(ResetQuizEvent());

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ResultScreen(title: 'Result Screen'),
              ),
            );
          } else if(state == QuizState.initial()) {

          }
        },
        child: const HomeScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
