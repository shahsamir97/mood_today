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
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary.withValues(alpha: 0.1), theme.colorScheme.secondary.withValues(alpha: 0.2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Card(
                color: theme.colorScheme.surfaceBright,
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
                  child: BlocBuilder<QuizBloc, QuizState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.emoji_emotions, size: 64, color: theme.colorScheme.primary),
                          const SizedBox(height: 24),
                          Text(
                            AppLocalizations.of(context)!.homeScreenTitle,
                            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)!.homeScreenBodyText,
                            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.language, color: theme.colorScheme.primary),
                                const SizedBox(width: 8),
                                Text(
                                  AppLocalizations.of(context)!.chooseLanguage,
                                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 16),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<Locale>(
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
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.play_arrow),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 18),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                textStyle: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                // Load Gemini questions before navigating
                                context.read<QuizBloc>().add(LoadQuestionsEvent());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const QuizScreen(title: 'Quiz',),
                                  ),
                                );
                              },
                              label: Text(AppLocalizations.of(context)!.startButton),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}