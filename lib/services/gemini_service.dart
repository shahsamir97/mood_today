import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:convert';

class GeminiService {
  static const String _apiKey = 'AIzaSyCMnnkJOQhXcl5TbzMQPTVuf1r2qRKRDnA';
  late final GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-pro',
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
Provide a comprehensive mood analysis with an appropriate emoji.

Questions and Answers:
${questionAnswers.map((qa) => 'Q: ${qa.question}\nA: ${qa.answer}').join('\n\n')}

Please provide:
1. Overall mood type (e.g., "Happy and Energetic", "Calm and Content", "Stressed but Hopeful", etc.)
2. Mood score from 1-10 (where 1 is very low mood, 10 is excellent mood)
3. Brief analysis (2-3 sentences explaining their current state)
4. A helpful suggestion or encouragement (1-2 sentences)
5. An appropriate emoji that represents their mood (single emoji character)

Format your response as:
MOOD_TYPE: [mood type here]
SCORE: [number 1-10]
ANALYSIS: [your analysis here]
SUGGESTION: [your suggestion here]
EMOJI: [single emoji character]

Choose the emoji based on the overall mood:
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
      // Clean the response
      String cleanResponse = response.trim();
      if (cleanResponse.startsWith('```json')) {
        cleanResponse = cleanResponse.substring(7);
      }
      if (cleanResponse.endsWith('```')) {
        cleanResponse = cleanResponse.substring(0, cleanResponse.length - 3);
      }
      
      try {
        // Try to parse as JSON first
        final Map<String, dynamic> jsonData = json.decode(cleanResponse);
        if (jsonData.containsKey('questions')) {
          List<QuestionWithOptions> questions = [];
          for (var q in jsonData['questions']) {
            questions.add(QuestionWithOptions(
              question: q['question'].toString(),
              options: List<String>.from(q['options']),
            ));
          }
          return QuizData(questions: questions);
        }
      } catch (e) {
        // If JSON parsing fails, use regex parsing
        return QuizData(questions: _extractQuestionsFromResponse(cleanResponse));
      }
      
      return _getFallbackQuizData();
    } catch (e) {
      print('Error parsing quiz data: $e');
      return _getFallbackQuizData();
    }
  }

  List<QuestionWithOptions> _extractQuestionsFromResponse(String response) {
    List<QuestionWithOptions> questions = [];
    
    // Look for question patterns in the response
    RegExp questionPattern = RegExp(r'"question":\s*"([^"]+)"');
    RegExp optionsPattern = RegExp(r'"options":\s*\[([^\]]+)\]');
    
    Iterable<RegExpMatch> questionMatches = questionPattern.allMatches(response);
    Iterable<RegExpMatch> optionsMatches = optionsPattern.allMatches(response);
    
    List<String> questionTexts = questionMatches.map((m) => m.group(1)!).toList();
    List<List<String>> allOptions = [];
    
    for (var match in optionsMatches) {
      String optionsString = match.group(1)!;
      List<String> options = [];
      RegExp optionPattern = RegExp(r'"([^"]+)"');
      for (var optionMatch in optionPattern.allMatches(optionsString)) {
        options.add(optionMatch.group(1)!);
      }
      if (options.length >= 3) {
        allOptions.add(options);
      }
    }
    
    for (int i = 0; i < questionTexts.length && i < allOptions.length; i++) {
      questions.add(QuestionWithOptions(
        question: questionTexts[i],
        options: allOptions[i],
      ));
    }
    
    return questions.isNotEmpty ? questions : _getFallbackQuestions();
  }

  List<QuestionWithOptions> _getFallbackQuestions() {
    return [
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
    ];
  }

  MoodAnalysis _parseMoodAnalysis(String response) {
    try {
      String moodType = "Balanced";
      int score = 5;
      String analysis = "Your responses suggest a balanced emotional state.";
      String suggestion = "Keep maintaining your current positive habits!";
      String emoji = "😌";

      final lines = response.split('\n');
      for (String line in lines) {
        if (line.startsWith('MOOD_TYPE:')) {
          moodType = line.substring(10).trim();
        } else if (line.startsWith('SCORE:')) {
          score = int.tryParse(line.substring(6).trim()) ?? 5;
        } else if (line.startsWith('ANALYSIS:')) {
          analysis = line.substring(9).trim();
        } else if (line.startsWith('SUGGESTION:')) {
          suggestion = line.substring(11).trim();
        } else if (line.startsWith('EMOJI:')) {
          emoji = line.substring(6).trim();
        }
      }

      return MoodAnalysis(
        moodType: moodType,
        score: score,
        analysis: analysis,
        suggestion: suggestion,
        emoji: emoji,
      );
    } catch (e) {
      return _getFallbackAnalysis();
    }
  }

  QuizData _getFallbackQuizData() {
    return QuizData(questions: _getFallbackQuestions());
  }

  MoodAnalysis _getFallbackAnalysis() {
    return MoodAnalysis(
      moodType: "Balanced",
      score: 5,
      analysis: "Thank you for sharing your thoughts with us today.",
      suggestion: "Remember to take care of yourself and stay positive!",
      emoji: "😌",
    );
  }
}

class QuizData {
  final List<QuestionWithOptions> questions;

  QuizData({required this.questions});
}

class QuestionWithOptions {
  final String question;
  final List<String> options;

  QuestionWithOptions({
    required this.question,
    required this.options,
  });
}

class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer({
    required this.question,
    required this.answer,
  });
}

class MoodAnalysis {
  final String moodType;
  final int score;
  final String analysis;
  final String suggestion;
  final String emoji;

  MoodAnalysis({
    required this.moodType,
    required this.score,
    required this.analysis,
    required this.suggestion,
    required this.emoji,
  });
}
