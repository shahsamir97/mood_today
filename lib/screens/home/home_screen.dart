import 'package:flutter/material.dart';
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.homeScreenTitle, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.all(16)),
              Text(AppLocalizations.of(context)!.homeScreenBodyText, style: TextStyle(fontSize: 22),),
              Padding(padding: EdgeInsets.all(16)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizScreen(title: 'Quiz',)));
                },
                child: Text(AppLocalizations.of(context)!.startButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}