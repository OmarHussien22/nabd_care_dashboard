part of 'static_widgets_imports.dart';

class CardQuestion extends StatefulWidget {
  final Question question;

  const CardQuestion({
    super.key,
    required this.question,
  });

  @override
  State<CardQuestion> createState() => _CardQuestionState();
}

class _CardQuestionState extends State<CardQuestion> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          setState(() {
            expanded = !expanded;
          });
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.toH(),
          horizontal: 16.toW(),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.toRad()),
          // border: Border.all(
          //   color: AppColors.get.greyLight,
          // ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                expanded
                    ? Expanded(
                        child: CustomText(
                          widget.question.question ?? "",
                          fontSize: 12,
                          color: AppColors.get.black,
                        ),
                      )
                    : Expanded(
                        child: CustomText(
                          widget.question.question ?? "",
                          fontSize: 12,
                          fontWeight: FW.semiBold,
                          color: AppColors.get.black,
                        ),
                      ),
                Icon(
                  expanded ? Icons.remove : Icons.add,
                  color: AppColors.get.black,
                  size: 24.toRad(),
                )
              ],
            ),
            if (expanded) ...[
              10.ESH(),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      widget.question.answer ?? "",
                      fontSize: 13,
                      fontWeight: FW.light,
                      color: AppColors.get.black,
                    ),
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}

//  GetBuilder<FetchFaqController>(
//   init: FetchFaqController(),
//   assignId: true,
//   builder: (_) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//                 child: CustomText(
//               question.question ?? "",
//               fontSize: 14,
//               fontWeight: FW.semiBold,
//             )),
//             IconButton(
//                 onPressed: () {
//                   _.showQuestion(index);
//                 },
//                 icon: _.faqQuestion[index]
//                     ? Icon(
//                         Icons.minimize,
//                         size: 20.toRad(),
//                       )
//                     : Icon(
//                         Icons.add,
//                         size: 20.toRad(),
//                       )),
//           ],
//         ),
//         if (_.faqQuestion[index]) ...[
//           16.ESH(),
//           CustomText(
//             question.answer ?? "",
//             fontWeight: FW.light,
//             fontSize: 13,
//           )
//         ]
//       ],
//     );
//   },
// );
