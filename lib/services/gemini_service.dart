import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'secrets.dart';

part 'gemini_service.g.dart';

class GeminiService {
  static const String _apiKey = geminiApiKey;
  late final GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: _apiKey,
    );
  }

  Future<QuizData> generateMoodQuiz({int questionCount = 5}) async {
    try {
      final prompt = '''
Generate exactly $questionCount thoughtful questions to assess someone's current mood and emotional state, along with 5 answer options for each question.
Each question should be designed to understand their feelings, energy levels, stress, happiness, and overall wellbeing today.

Format the response as a JSON object with this exact structure:
{
  "questions": [
    {
      "question": "Question text here",
      "options": ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
    }
  ]
}

Make the questions:
- Personal but not intrusive
- Easy to understand
- Relevant to daily mood assessment
- Suitable for all ages
- Focused on "today" or "right now"

Make the answer options:
- Varied and appropriate for each specific question
- Cover a range from negative to positive responses
- Clear and easy to understand
- Contextually relevant to the question

Example:
{
  "questions": [
    {
      "question": "How are you feeling right now?",
      "options": ["Terrible", "Not great", "Okay", "Good", "Excellent"]
    },
    {
      "question": "How would you describe your energy level today?",
      "options": ["Completely drained", "Low energy", "Average", "Energetic", "Very high energy"]
    }
  ]
}
''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      
      if (response.text != null) {
        return _parseQuizData(response.text!);
      }
      
      return _getFallbackQuizData();
    } catch (e) {
      print('Error generating quiz: $e');
      return _getFallbackQuizData();
    }
  }

  Future<MoodAnalysis> analyzeMood(List<QuestionAnswer> questionAnswers) async {
    try {
      final prompt = '''
Based on the following question-answer pairs, analyze the person's current mood and emotional state.
Provide a comprehensive mood analysis with an appropriate emoji and helpful tips.

Questions and Answers:
${questionAnswers.map((qa) => 'Q: ${qa.question}\nA: ${qa.answer}').join('\n\n')}

Please provide your response as a JSON object with this exact structure:
{
  "moodType": "Happy and Energetic",
  "score": 8,
  "analysis": "You are feeling positive and energetic today...",
  "suggestion": "Keep up the good work!",
  "emoji": "😊",
  "tips": ["Take a walk", "Connect with friends", "Practice gratitude"]
}

Guidelines:
- moodType: Overall mood description (e.g., "Happy and Energetic", "Calm and Content", "Stressed but Hopeful")
- score: Mood score from 1-10 (where 1 is very low mood, 10 is excellent mood)
- analysis: Brief analysis (2-3 sentences explaining their current state)
- suggestion: A helpful suggestion or encouragement (1-2 sentences)
- emoji: Single emoji character representing their mood
- tips: Array of 2-3 practical tips to improve or maintain their mood

Choose appropriate emojis:
- 😊 for happy/joyful moods
- 😌 for calm/peaceful moods  
- 😴 for tired/low energy moods
- 😰 for stressed/anxious moods
- 😢 for sad/down moods
- 😐 for neutral/balanced moods
- 🤗 for content/satisfied moods
- 💪 for energetic/motivated moods
- 🌟 for excellent/amazing moods
- 😔 for disappointed/low moods
''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      
      if (response.text != null) {
        return _parseMoodAnalysis(response.text!);
      }
      
      return _getFallbackAnalysis();
    } catch (e) {
      print('Error analyzing mood: $e');
      return _getFallbackAnalysis();
    }
  }

  QuizData _parseQuizData(String response) {
    try {
      String cleanResponse = _cleanJsonResponse(response);
      final Map<String, dynamic> jsonData = json.decode(cleanResponse);
      return QuizData.fromJson(jsonData);
    } catch (e) {
      print('Error parsing quiz data: $e');
      return _getFallbackQuizData();
    }
  }

  MoodAnalysis _parseMoodAnalysis(String response) {
    try {
      String cleanResponse = _cleanJsonResponse(response);
      final Map<String, dynamic> jsonData = json.decode(cleanResponse);
      return MoodAnalysis.fromJson(jsonData);
    } catch (e) {
      print('Error parsing mood analysis: $e');
      return _getFallbackAnalysis();
    }
  }

  String _cleanJsonResponse(String response) {
    String cleanResponse = response.trim();
    if (cleanResponse.startsWith('```json')) {
      cleanResponse = cleanResponse.substring(7);
    }
    if (cleanResponse.endsWith('```')) {
      cleanResponse = cleanResponse.substring(0, cleanResponse.length - 3);
    }
    return cleanResponse.trim();
  }

  QuizData _getFallbackQuizData() {
    return QuizData(questions: [
      QuestionWithOptions(
        question: "How are you feeling right now?",
        options: ["Terrible", "Not great", "Okay", "Good", "Excellent"],
      ),
      QuestionWithOptions(
        question: "How would you describe your energy level today?",
        options: ["Completely drained", "Low energy", "Average", "Energetic", "Very high energy"],
      ),
      QuestionWithOptions(
        question: "How well did you sleep last night?",
        options: ["Very poorly", "Not well", "Okay", "Well", "Excellently"],
      ),
      QuestionWithOptions(
        question: "How stressed do you feel today?",
        options: ["Extremely stressed", "Very stressed", "Moderately stressed", "A little stressed", "Not stressed at all"],
      ),
      QuestionWithOptions(
        question: "How satisfied are you with today so far?",
        options: ["Very dissatisfied", "Dissatisfied", "Neutral", "Satisfied", "Very satisfied"],
      ),
    ]);
  }

  MoodAnalysis _getFallbackAnalysis() {
    return MoodAnalysis(
      moodType: "Balanced",
      score: 5,
      analysis: "Thank you for sharing your thoughts with us today.",
      suggestion: "Remember to take care of yourself and stay positive!",
      emoji: "😌",
      tips: ["Take a deep breath", "Go for a short walk", "Talk to a friend"],
    );
  }
}

@JsonSerializable()
class QuizData {
  final List<QuestionWithOptions> questions;

  QuizData({required this.questions});

  factory QuizData.fromJson(Map<String, dynamic> json) => _$QuizDataFromJson(json);
  Map<String, dynamic> toJson() => _$QuizDataToJson(this);
}

@JsonSerializable()
class QuestionWithOptions {
  final String question;
  final List<String> options;

  QuestionWithOptions({
    required this.question,
    required this.options,
  });

  factory QuestionWithOptions.fromJson(Map<String, dynamic> json) => _$QuestionWithOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionWithOptionsToJson(this);
}

@JsonSerializable()
class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer({
    required this.question,
    required this.answer,
  });

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) => _$QuestionAnswerFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionAnswerToJson(this);
}

@JsonSerializable()
class MoodAnalysis {
  final String moodType;
  final int score;
  final String analysis;
  final String suggestion;
  final String emoji;
  final List<String>? tips;

  MoodAnalysis({
    required this.moodType,
    required this.score,
    required this.analysis,
    required this.suggestion,
    required this.emoji,
    this.tips,
  });

  factory MoodAnalysis.fromJson(Map<String, dynamic> json) => _$MoodAnalysisFromJson(json);
  Map<String, dynamic> toJson() => _$MoodAnalysisToJson(this);
}
