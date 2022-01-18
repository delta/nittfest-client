import 'dart:convert';

QuestionResponse questionResponseFromJson(String str) =>
    QuestionResponse.fromJson(json.decode(str));

String questionResponseToJson(QuestionResponse data) =>
    json.encode(data.toJson());

class QuestionResponse {
  QuestionResponse({
    required this.questions,
  });

  final List<Question> questions;

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      QuestionResponse(
        questions: List<Question>.from(
            json['questions'].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'questions': List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.question,
    required this.options,
    required this.isSubjective,
    required this.domain,
    required this.id,
  });

  final String question;
  final List<dynamic> options;
  final bool isSubjective;
  final String domain;
  final int id;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json['question'],
        options: List<dynamic>.from(json['options'].map((x) => x)),
        isSubjective: json['is_subjective'],
        domain: json['domain'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'question': question,
        'options': List<dynamic>.from(options.map((x) => x)),
        'is_subjective': isSubjective,
        'domain': domain,
        'id': id,
      };
}
