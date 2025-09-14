import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_today/blocs/quiz/quiz_bloc.dart';
import 'package:mood_today/blocs/quiz/quiz_event.dart';
import 'package:mood_today/blocs/quiz/quiz_state.dart';
import 'package:mood_today/l10n/intl_localizations.dart';
import 'package:mood_today/screens/quiz/quiz_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        right: true,
        left: true,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {

              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.homeScreenTitle, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.all(16)),
                  Text(AppLocalizations.of(context)!.homeScreenBodyText, style: TextStyle(fontSize: 22),),
                  Padding(padding: EdgeInsets.all(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.chooseLanguage, style: TextStyle(fontSize: 16)),
                      SizedBox(width: 16),
                      DropdownButton<Locale>(
                        value: state.selectedLocale,
                        items: state.supportedLocales.map((locale) {
                          return DropdownMenuItem<Locale>(
                            value: locale,
                            child: Text(locale.languageCode.toUpperCase()),
                          );
                        }).toList(),
                        onChanged: (Locale? newLocale) {
                          if (newLocale != null) {
                            context.read<QuizBloc>().add(OnLanguageChangeEvent(newLocale));
                          }
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizScreen(title: 'Quiz',)));
                    },
                    child: Text(AppLocalizations.of(context)!.startButton),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}