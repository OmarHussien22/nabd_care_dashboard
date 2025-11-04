import '../../../../Core/Constants/Strings/app_strings.dart';
import '../../domain/entities/contact_info.dart';
import '../../domain/entities/question.dart';
import 'question_model.dart';

class ContactInfoModel extends ContactInfo {
  ContactInfoModel({
    super.youtube,
    super.instagram,
    super.facebook,
    super.linkedin,
    super.twitter,
    super.description,
    super.email,
    super.phone,
    super.whatsApp,
    super.messenger,
    super.tikTok,
    super.questions,
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      youtube: json['youtube'] ?? "",
      instagram: json['instagram'],
      facebook: json['facebook'] ?? "",
      linkedin: json['linkedin'],
      twitter: json['twitter'] ?? "",
      description: json['description'],
      email: json['email'],
      phone: json['phone'] ?? "",
      whatsApp: json['whatsapp'] ?? "",
      messenger: json['messenger'],
      tikTok: json['tiktok'] ?? "",
      questions: json['questions'] != null
          ? (json['questions'] as List)
              .map((e) => QuestionModel.fromJson(e))
              .toList()
          : [],
    );
  }

  static ContactInfoModel example = ContactInfoModel(
    // youtube: 'https://www.youtube.com/channel/UCQI-Ym2rLZx52vEoqlPQMdg',
    // instagram: 'https://www.instagram.com/getx_base_code/',
    // facebook: 'https://www.facebook.com/tahadarwesh01',
    // linkedin: 'https://www.linkedin.com/company/getx_base_code',
    // twitter: 'https://twitter.com/getx_base_code',
    // tikTok: 'https://www.tiktok.com/@getx_base_code',
    // description: kDummyData,
    // email: "tahadarwesh1@gmail.com",
    // phone: "012 51235 221",
    // whatsApp: "+01025445845",
    youtube: '',
    instagram: '',
    facebook: '',
    linkedin: '',
    twitter: '',
    tikTok: '',
    description: kDummyData,
    email: "",
    phone: "012 51235 221",
    whatsApp: "+01025445845",
    questions: [
      Question(
        id: 1,
        question: "كيف يمكنني معرفة اتاحة منتج معين؟",
        answer: kDummyData,
      ),
      Question(
        id: 2,
        question: "من نحن ؟",
        answer: kDummyData,
      ),
      Question(
        id: 3,
        question: "كيف يمكنني معرفة اتاحة منتج معين ؟",
        answer: kDummyData,
      ),
      Question(
        id: 4,
        question: "من نحن ؟",
        answer: kDummyData,
      ),
      Question(
        id: 5,
        question: "كيف يمكنني معرفة اتاحة منتج معين ؟",
        answer: kDummyData,
      ),
    ],
  );
}
