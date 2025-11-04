import 'package:equatable/equatable.dart';
class Question with EquatableMixin {
  int ?id ;
  String ? question ;
  String  ?answer;
  Question({
    this.id ,
    this.answer ,
    this.question
  });
  @override
  // TODO: implement stringify
  bool? get stringify => true;
  @override
  // TODO: implement props
  List<Object?> get props =>[
    id , question , answer
  ];
}
