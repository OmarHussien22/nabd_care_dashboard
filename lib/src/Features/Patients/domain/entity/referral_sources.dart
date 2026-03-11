import 'package:care_desk/src/Core/Constants/Strings/Assets/app_icons.dart';
import 'package:care_desk/src/Shared/Entities/title_interface.dart';
import 'package:flutter/widgets.dart';

class ReferralSourcesEntity extends TitleInterface {
  // final int id;
  // final String name;
  final String? description;
  final String? icon;
  final Color? color;

  ReferralSourcesEntity({
    required super.id,
    required super.title,
    this.description,
    this.icon,
    this.color,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReferralSourcesEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  static List<ReferralSourcesEntity> referralSources = [
    ReferralSourcesEntity(
      id: 1,
     // name: "Facebook",
      description: "Facebook",
      icon: AppIcons.facebook,
      color: Color(0xff1877F2), title: 'Facebook',
    ),
    ReferralSourcesEntity(
      id: 2,
     // name: "Instagram",
      description: "Instagram",
      icon: AppIcons.instagram,
      color: Color(0xffE4405F), title: 'Instagram',
    ),
    ReferralSourcesEntity(
      id: 3,
      //name: "Recommendation",
      description: "Recommendation",
      icon: AppIcons.call,
      color: Color(0xffFFC107), title: 'Recommendation',
    ),
    ReferralSourcesEntity(
      id: 4,
    // name: "Google Search",
      description: "Google Search",
      icon: AppIcons.enLang,
      color: Color(0xff4285F4), title: 'Google Search',
    ),
    ReferralSourcesEntity(
      id: 5,
    //  name: "Other",
      description: "Other",
      icon: AppIcons.profileActive,
      color: Color(0xff6C757D), title: 'Other',
    ),
  ];
}
