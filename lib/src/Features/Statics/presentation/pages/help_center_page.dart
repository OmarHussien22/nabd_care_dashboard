// part of 'static_pages_imports.dart';
//
// class HelpCenterPage extends StatelessWidget {
//   const HelpCenterPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final FetchAppInfoController fetchAppInfoController = Get.put(FetchAppInfoController());
//     Get.put(FetchQuestionController());
//
//     return Scaffold(
//         body: CustomScrollView(
//       slivers: [
//         const SliverToBoxAdapter(
//           child: CustomHeaderHelpCenter(),
//         ),
//         SliverToBoxAdapter(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 GetBuilder<FetchAppInfoController>(
//                   init: FetchAppInfoController(),
//                   builder: (_) {
//                     return DataStatusBuilder(
//                       onErrorBuild: const SizedBox(),
//                       status: _.state,
//                       onDoneBuild: _.stateUnReady
//                           ? 0.ESH()
//                           : Column(
//                               children: [
//                                 if (_.state.data != null)
//                                   ContactUsBuilder(
//                                     contactInfo: _.state.data!,
//                                   ),
//                                 16.ESH(),
//                               ],
//                             ),
//                     );
//                   },
//                 ),
//                 GetBuilder<FetchQuestionController>(
//                   init: FetchQuestionController(),
//                   builder: (controller) {
//                     return DataStatusBuilder(
//                       status: controller.state,
//                       onRedirect: () {
//                         controller.fetchQuestions();
//                         fetchAppInfoController.fetchAppInfo();
//                       },
//                       onDoneBuild: controller.stateUnReady
//                           ? 0.ESH()
//                           : Column(
//                               children: [
//                                 if (controller.state.data != null)
//                                   ListCardFaq(
//                                     questions: controller.state.data ?? [],
//                                     itemCount: controller.filterQuestion.isEmpty
//                                         ? controller.state.data!.length
//                                         : controller.filterQuestion.length,
//                                   ),
//                                 16.ESH(),
//                               ],
//                             ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }
