import 'package:care_desk/src/Core/Constants/Strings/Assets/app_icons.dart';
import 'package:flutter/widgets.dart';

class ReferralSourcesEntity {
  final int id;
  final String name;
  final String? description;
  final String? icon;
  final Color? color;

  ReferralSourcesEntity({
    required this.id,
    required this.name,
    this.description,
    this.icon,
    this.color,
  });

  static List<ReferralSourcesEntity> get referralSources => [
        ReferralSourcesEntity(
          id: 1,
          name: "Facebook",
          description: "Facebook",
          icon: AppIcons.facebook,
          color: Color(0xff1877F2),
        ),
        ReferralSourcesEntity(
          id: 2,
          name: "Instagram",
          description: "Instagram",
          icon: AppIcons.instagram,
          color: Color(0xffE4405F),
        ),
        ReferralSourcesEntity(
          id: 3,
          name: "Recommendation",
          description: "Recommendation",
          icon: AppIcons.call,
          color: Color(0xffFFC107),
        ),
        ReferralSourcesEntity(
          id: 4,
          name: "Google Search",
          description: "Google Search",
          icon: AppIcons.enLang,
          color: Color(0xff4285F4),
        ),
        ReferralSourcesEntity(
          id: 5,    
          name: "Other",
          description: "Other",
          icon: AppIcons.profileActive,
          color: Color(0xff6C757D),
        ),
      ];
}
