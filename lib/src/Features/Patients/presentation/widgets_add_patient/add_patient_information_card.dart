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
        children: [
          // name and phone number
          Row(
            children: [
              Expanded(
                child: AppFillTextFieldField(
                  // width: 500,
                  controller: cnt.nameController,
                  hint: "enter_full_name",
                  header: "full_name",
                  prefixAsset: AppIcons.profileActive,
                  keyboardType: TextInputType.name,
                  validation: AppValidator.defaultValidator.validate,
                  onComplete: node.nextFocus,
                ),
              ),
              SizedBox(width: 16.toW()),
              Expanded(
                child: AppFillTextFieldField(
                  // width: 500,
                  controller: cnt.phoneController,
                  hint: "enter_phone",
                  header: "phone_number",
                  prefixAsset: AppIcons.callIncoming,
                  keyboardType: TextInputType.phone,
                  validation: AppValidator.defaultValidator.validate,
                  onComplete: node.nextFocus,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.toH()),
          // date of birth and gender
          Row(
            children: [
              const AddPatientSelectGender(),
              SizedBox(width: 16.toW()),
              Expanded(
                child: CustomDatePicker(
                  controller: cnt.dateOfBirthController,
                  hint: "enter_date_of_birth",
                  title: "date_of_birth",
                  onDateSelected: (date) {
                    cnt.setSelectedDateOfBirth(date);
                  },
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  validator: AppValidator.defaultValidator.validate,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.toH()),
          // address
          AppFillTextFieldField(
            // width: 500,
            controller: cnt.addressController,
            hint: "enter_address",
            header: "address",
            prefixIconData: Icons.location_on,
            keyboardType: TextInputType.text,
            validation: AppValidator.defaultValidator.validate,
            onComplete: node.nextFocus,
          ),
        ],
      );
    });
  }
}
