import 'package:care_desk/src/Core/Constants/Strings/Assets/app_icons.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/Utils/Validation/app_validator.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_select_gender.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/custom_date_picker.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientInformationCard extends StatelessWidget {
  final FocusScopeNode node;
  const AddPatientInformationCard({super.key, required this.node});
  // patinet Information Section
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPatientBuilder>(builder: (cnt) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Name & Phone Row ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppFillTextFieldField(
                  controller: cnt.nameController,
                  hint: "enter_full_name",
                  header: "full_name",
                  prefixAsset: AppIcons.profileActive,
                  keyboardType: TextInputType.name,
                  validation: AppValidator.defaultValidator.validate,
                  onComplete: node.nextFocus,
                ),
              ),
              SizedBox(width: 20.toW()),
              Expanded(
                child: AppFillTextFieldField(
                  controller: cnt.phoneController,
                  hint: "enter_phone",
                  header: "phone_number",
                  prefixAsset: AppIcons.callIncoming,
                  keyboardType: TextInputType.phone,
                  validation: (value) =>
                      AppValidator.phoneValidator.validate(value),
                  onComplete: node.nextFocus,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.toH()),

          // ── Gender & DOB Row ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: const AddPatientSelectGender(),
              ),
              SizedBox(width: 20.toW()),
              Expanded(
                child: CustomDatePicker(
                  controller: cnt.dateOfBirthController,
                  hint: "enter_date_of_birth",
                  title: "date_of_birth",
                  onDateSelected: (date) {
                    cnt.setSelectedDateOfBirth(date);
                  },
                  validator: AppValidator.defaultValidator.validate,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.toH()),

          // ── Address ──
          Row(
            children: [
              Expanded(
                child: AppFillTextFieldField(
                  width: double.infinity,
                  controller: cnt.addressController,
                  hint: "enter_address",
                  header: "address",
                  prefixIconData: Icons.location_on_rounded,
                  keyboardType: TextInputType.text,
                  validation: AppValidator.defaultValidator.validate,
                  onComplete: node.nextFocus,
                ),
              ),
              SizedBox(width: 20.toW()),
              Expanded(
                child: AppFillTextFieldField(
                  width: double.infinity,
                  controller: cnt.dateOfVisitController,
                  hint: "enter_date_of_visit",
                  header: "date_of_visit",
                  prefixIconData: Icons.location_on_rounded,
                  keyboardType: TextInputType.text,
                  validation: AppValidator.defaultValidator.validate,
                  onComplete: node.nextFocus,
                ),
              ),
            ],
          ),
          SizedBox(height: 18.toH()),

          Row(
            children: [
              Expanded(
                child: AppFillTextFieldField(
                  width: double.infinity,
                  controller: cnt.timeOfVisitController,
                  hint: "enter_time_of_visit",
                  header: "time_of_visit",
                  prefixIconData: Icons.location_on_rounded,
                  keyboardType: TextInputType.text,
                  validation: AppValidator.defaultValidator.validate,
                  onComplete: node.nextFocus,
                ),
              ),
              SizedBox(width: 20.toW()),
              Expanded(
                child: AppFillTextFieldField(
                  width: double.infinity,
                  controller: cnt.priceController,
                  hint: "enter_price",
                  header: "price",
                  prefixIconData: Icons.location_on_rounded,
                  keyboardType: TextInputType.text,
                  validation: AppValidator.defaultValidator.validate,
                  onComplete: node.nextFocus,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
