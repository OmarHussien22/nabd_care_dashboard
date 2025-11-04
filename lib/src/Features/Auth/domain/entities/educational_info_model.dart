import 'package:getx_base_code/src/Core/Utils/Extensions/json_parsing_extension.dart';

import '../../data/models/educational_information.dart';

class EducationalInfoModel extends EducationInformation {
  EducationalInfoModel({
    required super.id,
    required super.title,
    super.subTitle,
    super.children,
  });

  factory EducationalInfoModel.fromJson(Map<String, dynamic> json) {
    return EducationalInfoModel(
      id: json.parseInt('id'),
      title: json.parseString('title'),
      subTitle: json.parseString('sub_title'),
      children: json['second_stage'] != null
          ? (json['second_stage'] as List)
              .map((e) => EducationalInfoModel.fromJson(e))
              .toList()
          : [],
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = super.id;
    data['title'] = super.title;
    data['sub_title'] = super.subTitle;
    data['second_stage'] = super.children;
    return data;
  }

  static List<EducationInformation> example = [
    EducationalInfoModel(
      id: 1,
      title: 'تعليم جامعي',
      subTitle: 'تعليم جامعي',
      children: [
        EducationalInfoModel(
          id: 10,
          title: 'مجاني',
          children: [
            EducationalInfoModel(
              id: 100,
              title: 'كلية الحاسبات والمعلومات',
              children: [
                EducationalInfoModel(
                  id: 1000,
                  title: 'علوم الحاسب',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
                EducationalInfoModel(
                  id: 1001,
                  title: 'نظم المعلومات',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
              ],
            ),
            EducationalInfoModel(
              id: 101,
              title: 'كلية الهندسة',
              children: [
                EducationalInfoModel(
                  id: 1010,
                  title: 'هندسة الحاسب',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
                EducationalInfoModel(
                  id: 1011,
                  title: 'هندسة البرمجيات',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
              ],
            ),
            EducationalInfoModel(
              id: 102,
              title: 'كلية العلوم',
              children: [
                EducationalInfoModel(
                  id: 1020,
                  title: 'علوم الحاسب',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
                EducationalInfoModel(
                  id: 1021,
                  title: 'علوم البرمجيات',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        EducationalInfoModel(
          id: 11,
          title: 'مدفوع',
          children: [
            EducationalInfoModel(
              id: 100,
              title: 'كلية الحاسبات والمعلومات',
              children: [
                EducationalInfoModel(
                  id: 1000,
                  title: 'علوم الحاسب',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
                EducationalInfoModel(
                  id: 1001,
                  title: 'نظم المعلومات',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
              ],
            ),
            EducationalInfoModel(
              id: 101,
              title: 'كلية الهندسة',
              children: [
                EducationalInfoModel(
                  id: 1010,
                  title: 'هندسة الحاسب',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
                EducationalInfoModel(
                  id: 1011,
                  title: 'هندسة البرمجيات',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
              ],
            ),
            EducationalInfoModel(
              id: 102,
              title: 'كلية العلوم',
              children: [
                EducationalInfoModel(
                  id: 1020,
                  title: 'علوم الحاسب',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
                EducationalInfoModel(
                  id: 1021,
                  title: 'علوم البرمجيات',
                  children: [
                    EducationalInfoModel(
                      id: 10000,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10001,
                      title: '  الفرقة الأولى',
                      subTitle: 'الترم الثاني',
                    ),
                    EducationalInfoModel(
                      id: 10002,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الأول',
                    ),
                    EducationalInfoModel(
                      id: 10003,
                      title: '  الفرقة الثانية',
                      subTitle: 'الترم الثاني',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    EducationalInfoModel(
      id: 2,
      title: 'تعليم أساسي',
      subTitle: 'تعليم أساسي',
      children: [],
    ),
  ];
}
