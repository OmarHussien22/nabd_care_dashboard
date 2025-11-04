// import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
//
// import '../../../../Core/Utils/Extensions/basic_op_extensions.dart';
// import '../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../Core/Constants/Strings/Assets/assets.dart';
// import '../../../../Core/Utils/Validation/app_validator.dart';
// import '../../../../Shared/Presentation/Widgets/Chip/app_chip.dart';
// import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Sheets/app_Sheet.dart';
// import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
// import '../../../Booking/domain/entities/service.dart';
// import '../manger/fetch_services_controller.dart';
//
// class CardSelectServices extends StatelessWidget {
//   const CardSelectServices({
//     super.key,
//     this.selectedServices = const [],
//     required this.onSelected,
//     required this.onDeleted,
//       this.controller,
//   });
//
//   final List<Service> selectedServices;
//   final TextEditingController ? controller ;
//   final Function(List<Service>) onSelected;
//   final Function(Service) onDeleted;
//
//   @override
//   Widget build(BuildContext context) {
//     final injector = Get.put(FetchServicesController());
//     return GetBuilder<FetchServicesController>(
//       init: injector,
//       builder: (_) {
//         return Column(
//           children: [
//             AppFillTextFieldField(
//               controller: controller,
//               hint: 'select_services',
//               header: 'services',
//               keyboardType: TextInputType.text,
//               validation: AppValidator.defaultValidator.validate,
//               prefixAsset: Assets.hairDryer,
//               isSheet: true,
//               readOnly: true,
//               onTap: () {
//                 AppSheets.get.showMultiSelection<Service>(
//                   items: _.state.data.notNull,
//                   selectedIds: selectedServices.map((e) => e.id).toList(),
//                   title: 'select_services',
//                   onSave: onSelected,
//                 );
//               },
//             ),
//             16.ESH(),
//             Wrap(
//               crossAxisAlignment: WrapCrossAlignment.start,
//               // alignment: WrapAlignment.spaceEvenly,
//               spacing: 11.toW(),
//               children: [
//                 for (var item in selectedServices)
//                   Padding(
//                     padding: EdgeInsetsDirectional.only(
//                       end: 5.toW(),
//                       bottom: 5.toH(),
//                     ),
//                     child: AppChip(
//                       label: item.title,
//                       onDelete: () {
//                         onDeleted(item);
//                       },
//                     ),
//                   ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
