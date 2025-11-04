// import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
// import 'package:getx_base_code/src/Core/utils/Extensions/screen_spaces_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class DateTimeWidget extends StatelessWidget {
//   final Function(DateRangePickerSelectionChangedArgs?) onSelectionChanged;
//   final Function()? onCancel;
//   final Function(Object?)? onSubmit;
//   const DateTimeWidget(
//       {required this.onSelectionChanged,
//       Key? key,
//       this.onCancel,
//       this.onSubmit})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 250.toH(),
//       clipBehavior: Clip.antiAliasWithSaveLayer,

//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//       margin: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 140.toH()),
//       child: SfDateRangePicker(
//         selectionRadius: 20.toRad(),
//         selectionColor: AppColors.get.primary,
//         view: DateRangePickerView.month,
//         todayHighlightColor: AppColors.get.primary,
//         rangeSelectionColor: AppColors.get.primary,
//         toggleDaySelection: true,
//         navigationMode: DateRangePickerNavigationMode.snap,
//         headerStyle: DateRangePickerHeaderStyle(
//           textAlign: TextAlign.start,
//           textStyle: TextStyle(
//             color: AppColors.get.primary,
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         selectionTextStyle: const TextStyle(
//           fontFamily: "medium",
//         ),
//         showActionButtons: true,
//         confirmText: "confirm",
//         cancelText: "cancel",
//         onCancel: onCancel,
//         onSubmit: onSubmit,
//         endRangeSelectionColor: AppColors.get.primary,
//         startRangeSelectionColor: AppColors.get.primary,
//         showNavigationArrow: true,
//         initialSelectedDate: DateTime.now(),
//         initialDisplayDate: DateTime.now(),
//         selectionShape: DateRangePickerSelectionShape.circle,
//         maxDate: DateTime.now().add(const Duration(days: 60)),
//         minDate: DateTime.now(),
//         // showTodayButton: true,
//         viewSpacing: 2,
//         backgroundColor: Colors.white,
//         onSelectionChanged: onSelectionChanged,
//         enablePastDates: true,
//       ),
//     );
//   }
// }
