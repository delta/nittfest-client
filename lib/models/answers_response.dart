import 'dart:convert';

AnswerResponse answerResponseFromJson(String str) =>
    AnswerResponse.fromJson(json.decode(str));

String answerResponseToJson(AnswerResponse data) => json.encode(data.toJson());

class AnswerResponse {
  AnswerResponse({
    required this.answers,
  });

  final List<Answer> answers;
  // final int preference_no;
  // final

  factory AnswerResponse.fromJson(Map<String, dynamic> json) => AnswerResponse(
        answers:
            List<Answer>.from(json['answers'].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'answers': List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.answer,
    required this.questionId,
  });

  final String answer;
  final int questionId;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answer: json['answer'],
        questionId: json['question_id'],
      );

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'question_id': questionId,
      };
}
