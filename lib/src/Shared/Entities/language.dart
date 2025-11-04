import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Language with EquatableMixin{
  int? id;
  String? flag;
  String? langTitle;
  Locale  locale;

  Language({
    this.id,
    this.flag,
    required this.locale,
    this.langTitle,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,flag,langTitle,locale];
}



class   LanguageData {
  LanguageData._();
  static final List<Language> _langList = [
    Language(
      id: 1,
      flag:'',
      langTitle:"arabic" ,
      locale:  const Locale('ar', 'AR') ,
    ),
    Language(
      id:2,
      flag:'',
      langTitle:"english",
      locale:  const Locale("en", "US") ,
    ),
  ];
  static List<Language> get  langList=> _langList;

  static Locale locale (int id){
    if(id==1){
      return const Locale('ar', 'AR');
    }
    else if (id==2){
      return  const Locale("en", "US");
    }
    else {
      return  const Locale("en", "US");
    }
  }

//<editor-fold desc="Data Methods">
//</editor-fold>
}