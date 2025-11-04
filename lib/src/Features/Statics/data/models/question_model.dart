import 'package:getx_base_code/src/Core/Constants/Strings/app_strings.dart';

import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({super.id, super.question, super.answer});
  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    question = json['question'] ?? '';
    answer = json['answer'] ?? '';
  }
  static List<QuestionModel> example = [
    QuestionModel(
      // youtube: 'https://www.youtube.com/channel/UCQI-Ym2rLZx52vEoqlPQMdg',
      id: 2,
      question: "كيف يمكنني معرفة اتاحة منتج معين؟",
      answer: kDummyData,
    ),
    QuestionModel(
      // youtube: 'https://www.youtube.com/channel/UCQI-Ym2rLZx52vEoqlPQMdg',
      id: 2,
      question: "كيف يمكنني معرفة اتاحة منتج معين؟",
      answer: kDummyData,
    ),
    QuestionModel(
      // youtube: 'https://www.youtube.com/channel/UCQI-Ym2rLZx52vEoqlPQMdg',
      id: 3,
      question: "كيف يمكنني معرفة اتاحة منتج معين؟",
      answer: kDummyData,
    )
  ];
}
