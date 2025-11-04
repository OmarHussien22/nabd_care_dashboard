import 'package:equatable/equatable.dart';

import 'question.dart';

class ContactInfo with EquatableMixin {
  String? youtube;
  String? linkedin;
  String? twitter;
  String? instagram;
  String? facebook;
  String? whatsApp;
  String? messenger;
  String? tikTok;
  String? email;
  String? phone;
  String? description;
  List<Question>? questions;
  ContactInfo({
    this.youtube,
    this.instagram,
    this.facebook,
    this.linkedin,
    this.twitter,
    this.description,
    this.email,
    this.phone,
    this.whatsApp,
    this.messenger,
    this.tikTok,
    this.questions,
  });

  @override
// TODO: implement stringify
  bool? get stringify => true;

  @override
// TODO: implement props
  List<Object?> get props => [
        youtube,
        instagram,
        facebook,
        linkedin,
        twitter,
        description,
        email,
        phone,
        whatsApp,
        messenger,
        tikTok,
        questions,
      ];
}
