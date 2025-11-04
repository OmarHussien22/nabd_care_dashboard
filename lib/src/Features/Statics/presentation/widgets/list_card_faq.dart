part of 'static_widgets_imports.dart';

class ListCardFaq extends StatelessWidget {
  final List<Question> questions;

  const ListCardFaq({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.toW()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "some_questions",
            fontSize: 14,
            fontWeight: FW.medium,
            padding: AppInsets.defaultScreenALL,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CardQuestion(
              question: questions[index],
            ),
            separatorBuilder: (context, index) => XDivider.normal(),
            itemCount: questions.length,
          ),
        ],
      ),
    );
  }
}
