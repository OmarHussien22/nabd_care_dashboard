import 'package:flutter/material.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Features/Auth/presentation/manger/auth_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/dialogs/animate_dialogs.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Services/lang_service/change_lang_service.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Utils/utils.dart';
import 'package:care_desk/src/Core/Styles/Themes/theme_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppContentWrapper(
      title: 'account_settings'.toTr(),
      breadcrumb: AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'dashboard'.toTr(), route: '/dashboard'),
          BreadcrumbItem(label: 'profile_settings'.toTr()),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSideNav(),
          32.ESW(),
          Expanded(
            child: _buildSelectedContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildSideNav() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.toH(), horizontal: 16.toW()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileHeader(),
          24.ESH(),
          _buildNavItem(0, Icons.person_outline, 'personal_information'.toTr()),
          _buildNavItem(1, Icons.lock_outline, 'login_security'.toTr()),
          _buildNavItem(2, Icons.dark_mode_outlined, 'appearance'.toTr()),
          _buildNavItem(3, Icons.language_outlined, 'display_language'.toTr()),
          16.ESH(),
          Divider(color: AppColors.get.border.withOpacity(0.5)),
          8.ESH(),
          _buildLogoutItem(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    final user = AuthController.instance.user;
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 45.toRad(),
              backgroundColor: AppColors.get.primary.withOpacity(0.1),
              child: CustomText(
                user?.name[0].toUpperCase() ?? 'U',
                fontSize: 32,
                fontWeight: FW.bold,
                color: AppColors.get.primary,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(6.toRad()),
                decoration: BoxDecoration(
                  color: AppColors.get.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: GestureDetector(
                  onTap: () {
                    // upload profile image
                  },
                  child: const Icon(Icons.camera_alt_outlined,
                      color: Colors.white, size: 16),
                ),
              ),
            ),
          ],
        ),
        16.ESH(),
        CustomText(user?.name ?? 'User Name',
            fontWeight: FW.bold, fontSize: 18),
        4.ESH(),
        CustomText(user?.email ?? 'email@example.com',
            color: AppColors.get.textSecondary, fontSize: 13),
      ],
    );
  }

  Widget _buildNavItem(int index, IconData icon, String title) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      borderRadius: BorderRadius.circular(12.toRad()),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.toH()),
        padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 14.toH()),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.get.primary.withOpacity(0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.toRad()),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected
                    ? AppColors.get.primary
                    : AppColors.get.textSecondary,
                size: 22),
            16.ESW(),
            CustomText(
              title,
              fontWeight: isSelected ? FW.bold : FW.medium,
              color: isSelected
                  ? AppColors.get.primary
                  : AppColors.get.textPrimary,
              fontSize: 14,
            ),
            if (isSelected)
              Icon(Icons.chevron_right, color: AppColors.get.primary, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildPersonalInfoForm();
      case 1:
        return _buildSecurityForm();
      case 2:
        return _buildThemeSettings();
      case 3:
        return _buildLanguageSettings();
      default:
        return Container(
          padding: EdgeInsets.all(40.toRad()),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.toRad()),
            border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
          ),
          child: const Center(child: CustomText('Coming Soon')),
        );
    }
  }

  Widget _buildPersonalInfoForm() {
    return Container(
      padding: EdgeInsets.all(40.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('personal_information'.toTr(),
              fontSize: 20, fontWeight: FW.bold),
          8.ESH(),
          CustomText('personal_information_sub'.toTr(),
              color: AppColors.get.textSecondary),
          32.ESH(),
          Row(
            children: [
              Expanded(
                child: TextFieldDefault(
                  header: TFFHeader(title: 'display_name'.toTr()),
                  hint: TFFHint(title: 'your_name'.toTr()),
                  prefix: PrefixWithIconData(iconData: Icons.person_outline),
                ),
              ),
              24.ESW(),
              Expanded(
                child: TextFieldDefault(
                  header: TFFHeader(title: 'phone_number'.toTr()),
                  hint: TFFHint(title: 'phone_hint'.toTr()),
                  prefix: PrefixWithIconData(iconData: Icons.phone_outlined),
                ),
              ),
            ],
          ),
          24.ESH(),
          TextFieldDefault(
            header: TFFHeader(title: 'professional_bio'.toTr()),
            hint: TFFHint(
                title: 'professional_bio_hint'.toTr()),
            maxLines: 4,
          ),
          40.ESH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.get.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                      horizontal: 40.toW(), vertical: 18.toH()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.toRad())),
                  elevation: 0,
                ),
                child: Text('update_profile'.toTr()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityForm() {
    return Container(
      padding: EdgeInsets.all(40.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('security_settings'.toTr(),
              fontSize: 20, fontWeight: FW.bold),
          8.ESH(),
          CustomText('security_settings_sub'.toTr(),
              color: AppColors.get.textSecondary),
          32.ESH(),
          TextFieldDefault(
            header: TFFHeader(title: 'current_password'.toTr()),
            hint: const TFFHint(title: '••••••••'),
            secureType: SecureType.always,
            prefix: PrefixWithIconData(iconData: Icons.lock_outline),
          ),
          24.ESH(),
          Row(
            children: [
              Expanded(
                child: TextFieldDefault(
                  header: TFFHeader(title: 'new_password'.toTr()),
                  hint: const TFFHint(title: '••••••••'),
                  secureType: SecureType.always,
                  prefix: PrefixWithIconData(iconData: Icons.vpn_key_outlined),
                ),
              ),
              24.ESW(),
              Expanded(
                child: TextFieldDefault(
                  header: TFFHeader(title: 'confirm_new_password'.toTr()),
                  hint: const TFFHint(title: '••••••••'),
                  secureType: SecureType.always,
                  prefix:
                      PrefixWithIconData(iconData: Icons.check_circle_outline),
                ),
              ),
            ],
          ),
          40.ESH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.get.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                      horizontal: 40.toW(), vertical: 18.toH()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.toRad())),
                  elevation: 0,
                ),
                child: Text('change_password'.toTr()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutItem() {
    return InkWell(
      onTap: () => _showLogoutDialog(context),
      borderRadius: BorderRadius.circular(12.toRad()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 14.toH()),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.toRad()),
          border: Border.all(color: Colors.red.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            const Icon(Icons.logout_rounded, color: Colors.red, size: 22),
            16.ESW(),
            CustomText(
              'sign_out'.toTr(),
              fontWeight: FW.bold,
              color: Colors.red,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    Dialogs.animatedDialog(
      context: context,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.toRad()),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(32.toRad()),
          width: 400.toW(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(20.toRad()),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              24.ESH(),
              CustomText(
                'sign_out'.toTr(),
                fontSize: 20,
                fontWeight: FW.bold,
              ),
              12.ESH(),
              CustomText(
                'sign_out_confirm'.toTr(),
                fontSize: 14,
                color: AppColors.get.textSecondary,
                textAlign: TextAlign.center,
              ),
              32.ESH(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.toH()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.toRad()),
                        ),
                        side: BorderSide(
                          color: AppColors.get.border,
                        ),
                      ),
                      child: CustomText(
                        'cancel'.toTr(),
                        fontWeight: FW.medium,
                        color: AppColors.get.textSecondary,
                      ),
                    ),
                  ),
                  16.ESW(),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Dismiss dialog
                        context.pop();

                        // Clear authentication
                        await AuthController.instance.clearAuthentication();

                        // Navigate back to login
                        if (context.mounted) {
                          context.go('/login');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 16.toH()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.toRad()),
                        ),
                      ),
                      child: CustomText(
                        'sign_out'.toTr(),
                        fontWeight: FW.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildLanguageSettings() {
    final currentLangCode = Get.locale?.languageCode ?? Utils.cachedLocale.languageCode;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(40.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('display_language'.toTr(), fontSize: 20, fontWeight: FW.bold),
          8.ESH(),
          CustomText('select_app_language'.toTr(), color: AppColors.get.textSecondary),
          32.ESH(),
          screenWidth < 600
              ? Column(
                  children: [
                    _buildLanguageCard(
                      id: 2,
                      title: 'English',
                      subtitle: 'English (US)',
                      flagCode: '🇺🇸',
                      isSelected: currentLangCode == 'en',
                    ),
                    16.ESH(),
                    _buildLanguageCard(
                      id: 1,
                      title: 'العربية',
                      subtitle: 'Arabic (AE/AR)',
                      flagCode: '🇸🇦',
                      isSelected: currentLangCode == 'ar',
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _buildLanguageCard(
                        id: 2,
                        title: 'English',
                        subtitle: 'English (US)',
                        flagCode: '🇺🇸',
                        isSelected: currentLangCode == 'en',
                      ),
                    ),
                    24.ESW(),
                    Expanded(
                      child: _buildLanguageCard(
                        id: 1,
                        title: 'العربية',
                        subtitle: 'Arabic (AE/AR)',
                        flagCode: '🇸🇦',
                        isSelected: currentLangCode == 'ar',
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildLanguageCard({
    required int id,
    required String title,
    required String subtitle,
    required String flagCode,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        ChangeLangService.instance.changeLang(id: id, context: context);
        setState(() {});
        Dialogs.customToast(
          text: 'language_changed_successfully'.toTr(),
          context: context,
          isSuccess: true,
        );
      },
      borderRadius: BorderRadius.circular(16.toRad()),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(24.toRad()),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.get.primary.withOpacity(0.03) : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.get.primary : AppColors.get.border.withOpacity(0.6),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16.toRad()),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.get.primary.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.toRad()),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.get.primary.withOpacity(0.1) : AppColors.get.background,
                shape: BoxShape.circle,
              ),
              child: Text(
                flagCode,
                style: TextStyle(fontSize: 32.toFS()),
              ),
            ),
            16.ESH(),
            CustomText(
              title,
              fontSize: 16,
              fontWeight: FW.bold,
              color: isSelected ? AppColors.get.primary : AppColors.get.textPrimary,
            ),
            8.ESH(),
            CustomText(
              subtitle,
              fontSize: 12,
              color: AppColors.get.textSecondary,
            ),
            if (isSelected) ...[
              16.ESH(),
              Icon(
                Icons.check_circle,
                color: AppColors.get.primary,
                size: 20.toRad(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSettings() {
    final themeController = Get.find<ThemeController>();
    final isDark = themeController.isDark;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(40.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('appearance'.toTr(), fontSize: 20, fontWeight: FW.bold),
          8.ESH(),
          CustomText('select_theme_mode'.toTr(), color: AppColors.get.textSecondary),
          32.ESH(),
          screenWidth < 600
              ? Column(
                  children: [
                    _buildThemeCard(
                      title: 'light_mode'.toTr(),
                      icon: Icons.light_mode_outlined,
                      isSelected: !isDark,
                      onTap: () {
                        if (isDark) {
                          themeController.toggleTheme();
                          setState(() {});
                        }
                      },
                    ),
                    16.ESH(),
                    _buildThemeCard(
                      title: 'dark_mode'.toTr(),
                      icon: Icons.dark_mode_outlined,
                      isSelected: isDark,
                      onTap: () {
                        if (!isDark) {
                          themeController.toggleTheme();
                          setState(() {});
                        }
                      },
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _buildThemeCard(
                        title: 'light_mode'.toTr(),
                        icon: Icons.light_mode_outlined,
                        isSelected: !isDark,
                        onTap: () {
                          if (isDark) {
                            themeController.toggleTheme();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    24.ESW(),
                    Expanded(
                      child: _buildThemeCard(
                        title: 'dark_mode'.toTr(),
                        icon: Icons.dark_mode_outlined,
                        isSelected: isDark,
                        onTap: () {
                          if (!isDark) {
                            themeController.toggleTheme();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildThemeCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.toRad()),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(24.toRad()),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.get.primary.withOpacity(0.03) : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.get.primary : AppColors.get.border.withOpacity(0.6),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16.toRad()),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.get.primary.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.toRad()),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.get.primary.withOpacity(0.1) : AppColors.get.background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32.toRad(),
                color: isSelected ? AppColors.get.primary : AppColors.get.textSecondary,
              ),
            ),
            16.ESH(),
            CustomText(
              title,
              fontSize: 16,
              fontWeight: FW.bold,
              color: isSelected ? AppColors.get.primary : AppColors.get.textPrimary,
            ),
            if (isSelected) ...[
              16.ESH(),
              Icon(
                Icons.check_circle,
                color: AppColors.get.primary,
                size: 20.toRad(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
