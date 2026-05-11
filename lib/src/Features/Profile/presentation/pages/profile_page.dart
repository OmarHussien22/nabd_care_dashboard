import 'package:flutter/material.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Features/Auth/presentation/manger/auth_controller.dart';
import 'package:get/get.dart';

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
      title: 'Account Settings',
      breadcrumb: const AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'Dashboard', route: '/dashboard'),
          BreadcrumbItem(label: 'Profile Settings'),
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
          _buildNavItem(0, Icons.person_outline, 'Personal Information'),
          _buildNavItem(1, Icons.lock_outline, 'Login & Security'),
          _buildNavItem(2, Icons.notifications_none, 'Notifications'),
          _buildNavItem(3, Icons.language_outlined, 'Display Language'),
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
                user?.name?[0].toUpperCase() ?? 'U',
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
                child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 16),
              ),
            ),
          ],
        ),
        16.ESH(),
        CustomText(user?.name ?? 'User Name', fontWeight: FW.bold, fontSize: 18),
        4.ESH(),
        CustomText(user?.email ?? 'email@example.com', color: AppColors.get.textSecondary, fontSize: 13),
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
          color: isSelected ? AppColors.get.primary.withOpacity(0.08) : Colors.transparent,
          borderRadius: BorderRadius.circular(12.toRad()),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? AppColors.get.primary : AppColors.get.textSecondary, size: 22),
            16.ESW(),
            Expanded(
              child: CustomText(
                title,
                fontWeight: isSelected ? FW.bold : FW.medium,
                color: isSelected ? AppColors.get.primary : AppColors.get.textPrimary,
                fontSize: 14,
              ),
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
          const CustomText('Personal Information', fontSize: 20, fontWeight: FW.bold),
          8.ESH(),
          CustomText('Update your profile details and public identity', color: AppColors.get.textSecondary),
          32.ESH(),
          Row(
            children: [
              Expanded(
                child: TextFieldDefault(
                  header: const TFFHeader(title: 'Display Name'),
                  hint: const TFFHint(title: 'Your name'),
                  prefix:  PrefixWithIconData(iconData: Icons.person_outline),
                ),
              ),
              24.ESW(),
              Expanded(
                child: TextFieldDefault(
                  header: const TFFHeader(title: 'Phone Number'),
                  hint: const TFFHint(title: 'e.g. +1 234 567 890'),
                  prefix:  PrefixWithIconData(iconData: Icons.phone_outlined),
                ),
              ),
            ],
          ),
          24.ESH(),
          TextFieldDefault(
            header: const TFFHeader(title: 'Professional Bio'),
            hint: const TFFHint(title: 'A short description of your role and experience'),
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
                  padding: EdgeInsets.symmetric(horizontal: 40.toW(), vertical: 18.toH()),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.toRad())),
                  elevation: 0,
                ),
                child: const Text('Update Profile'),
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
          const CustomText('Security Settings', fontSize: 20, fontWeight: FW.bold),
          8.ESH(),
          CustomText('Manage your password and account security', color: AppColors.get.textSecondary),
          32.ESH(),
          TextFieldDefault(
            header: const TFFHeader(title: 'Current Password'),
            hint: const TFFHint(title: '••••••••'),
            secureType: SecureType.always,
            prefix:  PrefixWithIconData(iconData: Icons.lock_outline),
          ),
          24.ESH(),
          Row(
            children: [
              Expanded(
                child: TextFieldDefault(
                  header: const TFFHeader(title: 'New Password'),
                  hint: const TFFHint(title: '••••••••'),
                  secureType: SecureType.always,
                  prefix:  PrefixWithIconData(iconData: Icons.vpn_key_outlined),
                ),
              ),
              24.ESW(),
              Expanded(
                child: TextFieldDefault(
                  header: const TFFHeader(title: 'Confirm New Password'),
                  hint: const TFFHint(title: '••••••••'),
                  secureType: SecureType.always,
                  prefix:  PrefixWithIconData(iconData: Icons.check_circle_outline),
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
                  padding: EdgeInsets.symmetric(horizontal: 40.toW(), vertical: 18.toH()),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.toRad())),
                  elevation: 0,
                ),
                child: const Text('Change Password'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
