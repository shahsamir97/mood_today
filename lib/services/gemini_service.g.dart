// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizData _$QuizDataFromJson(Map<String, dynamic> json) => QuizData(
  questions: (json['questions'] as List<dynamic>)
      .map((e) => QuestionWithOptions.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuizDataToJson(QuizData instance) => <String, dynamic>{
  'questions': instance.questions,
};

QuestionWithOptions _$QuestionWithOptionsFromJson(Map<String, dynamic> json) =>
    QuestionWithOptions(
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuestionWithOptionsToJson(
  QuestionWithOptions instance,
) => <String, dynamic>{
  'question': instance.question,
  'options': instance.options,
};

QuestionAnswer _$QuestionAnswerFromJson(Map<String, dynamic> json) =>
    QuestionAnswer(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$QuestionAnswerToJson(QuestionAnswer instance) =>
    <String, dynamic>{'question': instance.question, 'answer': instance.answer};

MoodAnalysis _$MoodAnalysisFromJson(Map<String, dynamic> json) => MoodAnalysis(
  moodType: json['moodType'] as String,
  score: (json['score'] as num).toInt(),
  analysis: json['analysis'] as String,
  suggestion: json['suggestion'] as String,
  emoji: json['emoji'] as String,
  tips: (json['tips'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$MoodAnalysisToJson(MoodAnalysis instance) =>
    <String, dynamic>{
      'moodType': instance.moodType,
      'score': instance.score,
      'analysis': instance.analysis,
      'suggestion': instance.suggestion,
      'emoji': instance.emoji,
      'tips': instance.tips,
    };
