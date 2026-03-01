import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/chronic_disease_chip.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/file_upload_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/file_upload_zone.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_section_card.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Inputs/desktop_input.dart';
import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for Personal Information
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  // Controllers for Medical Information
  final _allergiesController = TextEditingController();
  final _mainComplaintController = TextEditingController();

  // Controllers for Administrative Details
  final _secretaryNotesController = TextEditingController();

  // State variables
  String? _selectedGender;
  DateTime? _selectedDateOfBirth;
  String? _selectedVisitType;
  String? _selectedReferralSource;
  final Set<String> _selectedChronicDiseases = {};
  final List<Map<String, dynamic>> _uploadedFiles = [];

  // Available options
  final List<String> _chronicDiseaseOptions = [
    'diabetes',
    'hypertension',
    'heart_disease',
    'asthma',
    'kidney_disease',
    'thyroid_disease',
  ];

  final List<String> _referralSources = [
    'facebook',
    'instagram',
    'recommendation',
    'google_search',
    'walk_in',
    'other',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _allergiesController.dispose();
    _mainComplaintController.dispose();
    _secretaryNotesController.dispose();
    super.dispose();
  }

  void _pickDateOfBirth() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.get.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDateOfBirth = picked;
      });
    }
  }

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  void _handleFileUpload() {
    // TODO: Implement file picker
    printDM("File upload clicked");
    // For now, simulate file upload
    setState(() {
      _uploadedFiles.add({
        'fileName': 'X-Ray_Chest.jpg',
        'fileSize': '4.2 MB',
        'state': FileUploadState.uploading,
        'progress': 0.75,
        'isImage': true,
      });
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement form submission
      final formData = {
        'personal_info': {
          'full_name': _fullNameController.text,
          'phone': _phoneController.text,
          'age': _selectedDateOfBirth != null
              ? _calculateAge(_selectedDateOfBirth!)
              : null,
          'gender': _selectedGender,
          'address': _addressController.text,
        },
        'medical_info': {
          'is_first_visit': _selectedVisitType == 'new_visit',
          'chronic_diseases': _selectedChronicDiseases.toList(),
          'allergies': _allergiesController.text,
          'main_complaint': _mainComplaintController.text,
          'attachments': _uploadedFiles.map((f) => f['fileName']).toList(),
        },
        'administrative_info': {
          'referral_source': _selectedReferralSource,
          'secretary_notes': _secretaryNotesController.text,
        },
      };
      printDM("Form Data: $formData");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomText("patient_added_successfully".toTr()),
          backgroundColor: AppColors.get.success,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: AnimatedWrapper(
        styles: WrapAnimationStyles.slide,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 24.toW(), vertical: 16.toH()),
                decoration: BoxDecoration(
                  color: AppColors.get.white,
                  border: Border(
                    bottom:
                        BorderSide(color: AppColors.get.greyLight, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back,
                              color: AppColors.get.textPrimary),
                        ),
                        SizedBox(width: 12.toW()),
                        CustomText(
                          "add_new_patient".toTr(),
                          fontSize: 20,
                          fontWeight: FW.bold,
                          color: AppColors.get.textPrimary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Form Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24.toW()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Personal Information Section
                      // AddPatientSectionCard(
                      //   title: "personal_information".toTr(),
                      //   icon: Icons.person_outline,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Expanded(
                      //           flex: 2,
                      //           child: DesktopInput(
                      //             label: "full_name".toTr(),
                      //             hint: "enter_full_name".toTr(),
                      //             controller: _fullNameController,
                      //             prefixIcon: Icons.person,
                      //             validator: (value) {
                      //               if (value == null || value.isEmpty) {
                      //                 return "field_required".toTr();
                      //               }
                      //               return null;
                      //             },
                      //           ),
                      //         ),
                      //         SizedBox(width: 16.toW()),
                      //         Expanded(
                      //           child: DesktopInput(
                      //             label: "phone_number".toTr(),
                      //             hint: "enter_phone".toTr(),
                      //             controller: _phoneController,
                      //             prefixIcon: Icons.phone,
                      //             validator: (value) {
                      //               if (value == null || value.isEmpty) {
                      //                 return "field_required".toTr();
                      //               }
                      //               return null;
                      //             },
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(height: 16.toH()),
                      //     Row(
                      //       children: [
                      //         Expanded(
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               CustomText(
                      //                 "gender".toTr(),
                      //                 fontSize: 13,
                      //                 fontWeight: FW.medium,
                      //               ),
                      //               SizedBox(height: 8.toH()),
                      //               Row(
                      //                 children: [
                      //                   Expanded(
                      //                     child: RadioListTile<String>(
                      //                       title: CustomText("male".toTr(),
                      //                           fontSize: 13),
                      //                       value: 'male',
                      //                       groupValue: _selectedGender,
                      //                       onChanged: (value) {
                      //                         setState(() {
                      //                           _selectedGender = value;
                      //                         });
                      //                       },
                      //                       activeColor: AppColors.get.primary,
                      //                       contentPadding: EdgeInsets.zero,
                      //                     ),
                      //                   ),
                      //                   Expanded(
                      //                     child: RadioListTile<String>(
                      //                       title: CustomText("female".toTr(),
                      //                           fontSize: 13),
                      //                       value: 'female',
                      //                       groupValue: _selectedGender,
                      //                       onChanged: (value) {
                      //                         setState(() {
                      //                           _selectedGender = value;
                      //                         });
                      //                       },
                      //                       activeColor: AppColors.get.primary,
                      //                       contentPadding: EdgeInsets.zero,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         SizedBox(width: 16.toW()),
                      //         Expanded(
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               CustomText(
                      //                 "date_of_birth".toTr(),
                      //                 fontSize: 13,
                      //                 fontWeight: FW.medium,
                      //               ),
                      //               SizedBox(height: 8.toH()),
                      //               InkWell(
                      //                 onTap: _pickDateOfBirth,
                      //                 child: Container(
                      //                   padding: EdgeInsets.symmetric(
                      //                     horizontal: 12.toW(),
                      //                     vertical: 12.toH(),
                      //                   ),
                      //                   decoration: BoxDecoration(
                      //                     border: Border.all(
                      //                         color: AppColors.get.grey),
                      //                     borderRadius:
                      //                         BorderRadius.circular(8),
                      //                     color: AppColors.get.white,
                      //                   ),
                      //                   child: Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.spaceBetween,
                      //                     children: [
                      //                       CustomText(
                      //                         _selectedDateOfBirth != null
                      //                             ? "${_selectedDateOfBirth!.day}/${_selectedDateOfBirth!.month}/${_selectedDateOfBirth!.year}"
                      //                             : "select_date".toTr(),
                      //                         fontSize: 13,
                      //                         color: _selectedDateOfBirth !=
                      //                                 null
                      //                             ? AppColors.get.textPrimary
                      //                             : AppColors.get.grey,
                      //                       ),
                      //                       Icon(
                      //                         Icons.calendar_today,
                      //                         size: 18,
                      //                         color: AppColors.get.primary,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //               if (_selectedDateOfBirth != null) ...[
                      //                 SizedBox(height: 8.toH()),
                      //                 CustomText(
                      //                   "${"age".toTr()}: ${_calculateAge(_selectedDateOfBirth!)} ${"years".toTr()}",
                      //                   fontSize: 12,
                      //                   color: AppColors.get.grey,
                      //                 ),
                      //               ],
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(height: 16.toH()),
                      //     DesktopInput(
                      //       label: "address".toTr(),
                      //       hint: "enter_address".toTr(),
                      //       controller: _addressController,
                      //       prefixIcon: Icons.location_on,
                      //       maxLines: 2,
                      //     ),
                      //   ],
                      // ),

                      // Medical Status & History Section
                      // AddPatientSectionCard(
                      //   title: "medical_status_history".toTr(),
                      //   icon: Icons.medical_services_outlined,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         CustomText(
                      //           "visit_type".toTr(),
                      //           fontSize: 13,
                      //           fontWeight: FW.medium,
                      //         ),
                      //         SizedBox(height: 8.toH()),
                      //         Row(
                      //           children: [
                      //             Expanded(
                      //               child: RadioListTile<String>(
                      //                 title: CustomText("new_visit".toTr(),
                      //                     fontSize: 13),
                      //                 subtitle: CustomText(
                      //                   "first_time_visit".toTr(),
                      //                   fontSize: 11,
                      //                   color: AppColors.get.grey,
                      //                 ),
                      //                 value: 'new_visit',
                      //                 groupValue: _selectedVisitType,
                      //                 onChanged: (value) {
                      //                   setState(() {
                      //                     _selectedVisitType = value;
                      //                   });
                      //                 },
                      //                 activeColor: AppColors.get.primary,
                      //                 contentPadding: EdgeInsets.zero,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: RadioListTile<String>(
                      //                 title: CustomText("follow_up".toTr(),
                      //                     fontSize: 13),
                      //                 subtitle: CustomText(
                      //                   "return_visit".toTr(),
                      //                   fontSize: 11,
                      //                   color: AppColors.get.grey,
                      //                 ),
                      //                 value: 'follow_up',
                      //                 groupValue: _selectedVisitType,
                      //                 onChanged: (value) {
                      //                   setState(() {
                      //                     _selectedVisitType = value;
                      //                   });
                      //                 },
                      //                 activeColor: AppColors.get.primary,
                      //                 contentPadding: EdgeInsets.zero,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(height: 16.toH()),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         CustomText(
                      //           "chronic_diseases".toTr(),
                      //           fontSize: 13,
                      //           fontWeight: FW.medium,
                      //         ),
                      //         SizedBox(height: 12.toH()),
                      //         Wrap(
                      //           spacing: 8.toW(),
                      //           runSpacing: 8.toH(),
                      //           children: _chronicDiseaseOptions.map((disease) {
                      //             return ChronicDiseaseChip(
                      //               label: disease.toTr(),
                      //               isSelected: _selectedChronicDiseases
                      //                   .contains(disease),
                      //               onTap: () {
                      //                 setState(() {
                      //                   if (_selectedChronicDiseases
                      //                       .contains(disease)) {
                      //                     _selectedChronicDiseases
                      //                         .remove(disease);
                      //                   } else {
                      //                     _selectedChronicDiseases.add(disease);
                      //                   }
                      //                 });
                      //               },
                      //             );
                      //           }).toList(),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(height: 16.toH()),
                      //     DesktopInput(
                      //       label: "allergies".toTr(),
                      //       hint: "enter_allergies".toTr(),
                      //       controller: _allergiesController,
                      //       prefixIcon: Icons.warning_amber_outlined,
                      //       maxLines: 2,
                      //     ),
                      //     SizedBox(height: 16.toH()),
                      //     DesktopInput(
                      //       label: "main_complaint".toTr(),
                      //       hint: "why_patient_here_today".toTr(),
                      //       controller: _mainComplaintController,
                      //       prefixIcon: Icons.notes,
                      //       maxLines: 3,
                      //     ),
                      //   ],
                      // ),

                      // Media & Attachments Section
                      AddPatientSectionCard(
                        title: "media_attachments".toTr(),
                        icon: Icons.attach_file,
                        children: [
                          CustomText(
                            "upload_medical_records".toTr(),
                            fontSize: 13,
                            color: AppColors.get.grey,
                          ),
                          SizedBox(height: 12.toH()),
                          FileUploadZone(
                            onTap: _handleFileUpload,
                            title: "upload_files".toTr(),
                            subtitle: "click_to_upload_xrays_labs_prescriptions"
                                .toTr(),
                          ),
                          SizedBox(height: 16.toH()),
                          if (_uploadedFiles.isNotEmpty) ...[
                            CustomText(
                              "uploaded_files".toTr(),
                              fontSize: 14,
                              fontWeight: FW.semiBold,
                            ),
                            SizedBox(height: 8.toH()),
                            ..._uploadedFiles.map((file) {
                              return FileUploadCard(
                                fileName: file['fileName'],
                                fileSize: file['fileSize'],
                                state: file['state'],
                                progress: file['progress'],
                                isImage: file['isImage'] ?? false,
                                onCancel: () {
                                  setState(() {
                                    _uploadedFiles.remove(file);
                                  });
                                },
                                onView: () {
                                  printDM("View file: ${file['fileName']}");
                                },
                                onDownload: () {
                                  printDM("Download file: ${file['fileName']}");
                                },
                                onDelete: () {
                                  setState(() {
                                    _uploadedFiles.remove(file);
                                  });
                                },
                                uploadedBy: "Secretary Name",
                                uploadedDate: DateTime.now(),
                              );
                            }).toList(),
                          ],
                        ],
                      ),

                      // Administrative Details Section
                      AddPatientSectionCard(
                        title: "administrative_details".toTr(),
                        icon: Icons.admin_panel_settings_outlined,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                "referral_source".toTr(),
                                fontSize: 13,
                                fontWeight: FW.medium,
                              ),
                              SizedBox(height: 8.toH()),
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.toW()),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.get.grey),
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.get.white,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedReferralSource,
                                    hint: CustomText(
                                      "select_referral_source".toTr(),
                                      fontSize: 13,
                                      color: AppColors.get.grey,
                                    ),
                                    isExpanded: true,
                                    icon: Icon(Icons.arrow_drop_down,
                                        color: AppColors.get.primary),
                                    items: _referralSources.map((source) {
                                      return DropdownMenuItem<String>(
                                        value: source,
                                        child: CustomText(source.toTr(),
                                            fontSize: 13),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedReferralSource = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.toH()),
                          DesktopInput(
                            label: "secretary_notes".toTr(),
                            hint: "special_remarks_for_doctor".toTr(),
                            controller: _secretaryNotesController,
                            prefixIcon: Icons.note_alt_outlined,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
