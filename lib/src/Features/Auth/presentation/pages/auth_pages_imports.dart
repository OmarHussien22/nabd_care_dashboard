import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Auth/presentation/manger/fetch_basic_education_types_controller.dart';
import 'package:care_desk/src/Features/Auth/presentation/manger/fetch_university_education_types_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/DataBuilder/imports_data_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Constants/Decorations/app_Insets.dart';
import '../../../../Core/Libraries/snap/snap.dart';
import '../../../../Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/AppBars/app_bars.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Buttons/Customizable/imports_customizable.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Sheets/app_Sheet.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/phone_form_field.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
import '../../data/models/educational_information.dart';
import '../manger/send_verification_code_controller.dart';
import '../widgets/auth_header.dart';
import '../widgets/card_falling_subjects.dart';
import 'imports_auth.dart';

part 'enter_phone_page.dart';
