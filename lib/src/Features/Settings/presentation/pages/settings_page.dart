import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedCategoryIndex = 0;
  bool _isMobileView = false;
  bool _showMobileDetail = false;

  // Form Controllers
  final _clinicNameController = TextEditingController(text: "Nabd Care Clinic");
  final _clinicPhoneController = TextEditingController(text: "+20 100 234 5678");
  final _clinicAddressController = TextEditingController(text: "Cairo, Egypt");

  final _userNameController = TextEditingController(text: "Omar Hussien");
  final _userEmailController = TextEditingController(text: "omar.hussien@nabd.care");
  final _userTitleController = TextEditingController(text: "Senior Clinic Director");

  // Toggle Switches State
  bool _pushNotifications = true;
  bool _emailAlerts = true;
  bool _appointmentReminders = true;
  bool _maintenanceUpdates = false;

  bool _twoFactorAuth = false;
  bool _biometricLogin = true;
  bool _autoLock = true;

  bool _debugMode = false;
  bool _maintenanceMode = false;

  // Selection states
  String _selectedTheme = 'Light';
  String _selectedAccentColor = 'Blue';
  String _selectedLanguage = 'English';
  String _selectedTimezone = 'Cairo (GMT+2)';
  String _selectedCurrency = 'EGP';

  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Profile Settings',
      'subtitle': 'Manage your personal info & bio',
      'icon': Icons.person_outline_rounded,
      'color': Colors.blue,
    },
    {
      'title': 'Account Settings',
      'subtitle': 'Update password & active sessions',
      'icon': Icons.manage_accounts_outlined,
      'color': Colors.indigo,
    },
    {
      'title': 'General Settings',
      'subtitle': 'Clinic details & localizations',
      'icon': Icons.business_outlined,
      'color': Colors.teal,
    },
    {
      'title': 'Notifications',
      'subtitle': 'Configure system notification alerts',
      'icon': Icons.notifications_active_outlined,
      'color': Colors.orange,
    },
    {
      'title': 'Security',
      'subtitle': 'Two-factor auth & credential safety',
      'icon': Icons.shield_outlined,
      'color': Colors.red,
    },
    {
      'title': 'Theme Settings',
      'subtitle': 'Light, dark & color themes',
      'icon': Icons.palette_outlined,
      'color': Colors.pink,
    },
    {
      'title': 'Language',
      'subtitle': 'Choose interface language & region',
      'icon': Icons.translate_rounded,
      'color': Colors.amber,
    },
    {
      'title': 'System Settings',
      'subtitle': 'Advanced debug & platform config',
      'icon': Icons.settings_suggest_outlined,
      'color': Colors.purple,
    },
  ];

  @override
  void dispose() {
    _clinicNameController.dispose();
    _clinicPhoneController.dispose();
    _clinicAddressController.dispose();
    _userNameController.dispose();
    _userEmailController.dispose();
    _userTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContentWrapper(
      title: 'System Settings',
      breadcrumb: const AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'Dashboard', route: '/dashboard'),
          BreadcrumbItem(label: 'Settings'),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          _isMobileView = constraints.maxWidth < 900;
          return _isMobileView ? _buildMobileLayout() : _buildDesktopLayout();
        },
      ),
    );
  }

  // ─────────────────── DESKTOP LAYOUT ───────────────────
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left category list
        SizedBox(
          width: 320.toW(),
          child: Column(
            children: List.generate(_categories.length, (index) => _buildCategoryCard(index)),
          ),
        ),
        24.ESW(),
        // Right setting items card
        Expanded(
          child: Container(
            padding: EdgeInsets.all(28.toRad()),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.toRad()),
              border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: KeyedSubtree(
                key: ValueKey(_selectedCategoryIndex),
                child: _buildSelectedSettingContent(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────── MOBILE LAYOUT ───────────────────
  Widget _buildMobileLayout() {
    if (_showMobileDetail) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => setState(() => _showMobileDetail = false),
              ),
              8.ESW(),
              CustomText(
                _categories[_selectedCategoryIndex]['title'],
                fontSize: 16,
                fontWeight: FW.bold,
              ),
            ],
          ),
          16.ESH(),
          Container(
            padding: EdgeInsets.all(16.toRad()),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.toRad()),
              border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
            ),
            child: _buildSelectedSettingContent(),
          ),
        ],
      );
    }

    return Column(
      children: List.generate(
        _categories.length,
        (index) => _buildCategoryCard(index, onMobileTap: () {
          setState(() {
            _selectedCategoryIndex = index;
            _showMobileDetail = true;
          });
        }),
      ),
    );
  }

  // ─────────────────── CATEGORY CARD ───────────────────
  Widget _buildCategoryCard(int index, {VoidCallback? onMobileTap}) {
    final cat = _categories[index];
    final isSelected = _selectedCategoryIndex == index && !_isMobileView;
    final color = cat['color'] as Color;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.toH()),
      child: InkWell(
        onTap: onMobileTap ?? () => setState(() => _selectedCategoryIndex = index),
        borderRadius: BorderRadius.circular(16.toRad()),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 16.toH()),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.08) : Colors.white,
            borderRadius: BorderRadius.circular(16.toRad()),
            border: Border.all(
              color: isSelected ? color : AppColors.get.border.withOpacity(0.5),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.toRad()),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12.toRad()),
                ),
                child: Icon(cat['icon'], color: color, size: 22.toRad()),
              ),
              16.ESW(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      cat['title'],
                      fontSize: 13.5,
                      fontWeight: isSelected ? FW.bold : FW.semiBold,
                      color: isSelected ? color : AppColors.get.textPrimary,
                    ),
                    4.ESH(),
                    CustomText(
                      cat['subtitle'],
                      fontSize: 11,
                      color: AppColors.get.textSecondary,
                      maxLines: 1,
                      isOverFlow: true,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: isSelected ? color : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────── SETTING CONTENT ───────────────────
  Widget _buildSelectedSettingContent() {
    switch (_selectedCategoryIndex) {
      case 0:
        return _buildProfileSettings();
      case 1:
        return _buildAccountSettings();
      case 2:
        return _buildGeneralSettings();
      case 3:
        return _buildNotificationsSettings();
      case 4:
        return _buildSecuritySettings();
      case 5:
        return _buildThemeSettings();
      case 6:
        return _buildLanguageSettings();
      case 7:
        return _buildSystemSettings();
      default:
        return const SizedBox();
    }
  }

  // 1. PROFILE SETTINGS
  Widget _buildProfileSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Personal Profile',
          'Manage how your public profile details appear in the CareDesk system.',
        ),
        24.ESH(),
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 48.toRad(),
                backgroundColor: AppColors.get.primary.withOpacity(0.1),
                child: CustomText(
                  _userNameController.text.isNotEmpty ? _userNameController.text[0].toUpperCase() : 'O',
                  fontSize: 32,
                  fontWeight: FW.bold,
                  color: AppColors.get.primary,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.get.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
        ),
        28.ESH(),
        _buildInputField('Full Name', _userNameController, Icons.person_outline),
        20.ESH(),
        _buildInputField('Email Address', _userEmailController, Icons.email_outlined, keyboardType: TextInputType.emailAddress),
        20.ESH(),
        _buildInputField('Professional Title', _userTitleController, Icons.medical_services),
        32.ESH(),
        _buildSaveButton(),
      ],
    );
  }

  // 2. ACCOUNT SETTINGS
  Widget _buildAccountSettings() {
    final currentPassword = TextEditingController();
    final newPassword = TextEditingController();
    final confirmPassword = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Account Security',
          'Change password or manage current authenticated sessions.',
        ),
        24.ESH(),
        _buildInputField('Current Password', currentPassword, Icons.lock_outline, isPassword: true),
        20.ESH(),
        _buildInputField('New Password', newPassword, Icons.lock_open_outlined, isPassword: true),
        20.ESH(),
        _buildInputField('Confirm Password', confirmPassword, Icons.lock_outline, isPassword: true),
        28.ESH(),
        Divider(color: AppColors.get.border),
        20.ESH(),
        CustomText('Active Sessions', fontSize: 13, fontWeight: FW.bold),
        12.ESH(),
        _buildSessionItem('macOS Chrome', 'Cairo, Egypt • Active now', true),
        12.ESH(),
        _buildSessionItem('iPhone 15 Pro', 'Giza, Egypt • 2 hours ago', false),
        32.ESH(),
        _buildSaveButton(),
      ],
    );
  }

  // 3. GENERAL CLINIC SETTINGS
  Widget _buildGeneralSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'General Settings',
          'Configure primary identity details and localization defaults for the clinic.',
        ),
        24.ESH(),
        _buildInputField('Clinic Name', _clinicNameController, Icons.business_outlined),
        20.ESH(),
        _buildInputField('Contact Phone', _clinicPhoneController, Icons.phone_outlined),
        20.ESH(),
        _buildInputField('Address', _clinicAddressController, Icons.location_on_outlined),
        20.ESH(),
        Row(
          children: [
            Expanded(
              child: _buildDropdownField(
                'Default Timezone',
                _selectedTimezone,
                ['Cairo (GMT+2)', 'Riyadh (GMT+3)', 'UTC (GMT)'],
                (v) => setState(() => _selectedTimezone = v!),
              ),
            ),
            20.ESW(),
            Expanded(
              child: _buildDropdownField(
                'Currency Symbol',
                _selectedCurrency,
                ['EGP', 'SAR', 'USD', 'EUR'],
                (v) => setState(() => _selectedCurrency = v!),
              ),
            ),
          ],
        ),
        32.ESH(),
        _buildSaveButton(),
      ],
    );
  }

  // 4. NOTIFICATIONS
  Widget _buildNotificationsSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Notification Controls',
          'Toggle specific notification channels on or off according to preference.',
        ),
        24.ESH(),
        _buildToggleItem(
          'Push Notifications',
          'Show desktop and mobile real-time push alerts',
          _pushNotifications,
          (v) => setState(() => _pushNotifications = v),
        ),
        16.ESH(),
        _buildToggleItem(
          'Email Alerts',
          'Receive medical logs and daily shift digests via email',
          _emailAlerts,
          (v) => setState(() => _emailAlerts = v),
        ),
        16.ESH(),
        _buildToggleItem(
          'Appointment Reminders',
          'Send automated reminders to patients 24 hours prior',
          _appointmentReminders,
          (v) => setState(() => _appointmentReminders = v),
        ),
        16.ESH(),
        _buildToggleItem(
          'Maintenance Updates',
          'Get notifications on upcoming scheduled system updates',
          _maintenanceUpdates,
          (v) => setState(() => _maintenanceUpdates = v),
        ),
        32.ESH(),
        _buildSaveButton(),
      ],
    );
  }

  // 5. SECURITY
  Widget _buildSecuritySettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Security Safeguards',
          'Activate strict compliance controls to protect critical healthcare data.',
        ),
        24.ESH(),
        _buildToggleItem(
          'Two-Factor Authentication (2FA)',
          'Requires OTP verification code during login sessions',
          _twoFactorAuth,
          (v) => setState(() => _twoFactorAuth = v),
        ),
        16.ESH(),
        _buildToggleItem(
          'Biometric Credentials',
          'Allows fingerprint or face unlock on compatible mobile platforms',
          _biometricLogin,
          (v) => setState(() => _biometricLogin = v),
        ),
        16.ESH(),
        _buildToggleItem(
          'Auto-Lock Inactive Session',
          'Automatically locks active session after 15 minutes of inactivity',
          _autoLock,
          (v) => setState(() => _autoLock = v),
        ),
        32.ESH(),
        _buildSaveButton(),
      ],
    );
  }

  // 6. THEME SETTINGS
  Widget _buildThemeSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Theme Customization',
          'Change the visual look of CareDesk by switching styles or accent colors.',
        ),
        24.ESH(),
        _buildDropdownField(
          'Display Mode',
          _selectedTheme,
          ['Light', 'Dark', 'System Default'],
          (v) => setState(() => _selectedTheme = v!),
        ),
        20.ESH(),
        _buildDropdownField(
          'Primary Accent Color',
          _selectedAccentColor,
          ['Blue', 'Green', 'Purple', 'Teal', 'Orange'],
          (v) => setState(() => _selectedAccentColor = v!),
        ),
        32.ESH(),
        _buildSaveButton(),
      ],
    );
  }

  // 7. LANGUAGE
  Widget _buildLanguageSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'System Language',
          'Switch localized text displays across all navigation modules.',
        ),
        24.ESH(),
        _buildDropdownField(
          'Primary Language',
          _selectedLanguage,
          ['English', 'Arabic (العربية)', 'French (Français)'],
          (v) => setState(() => _selectedLanguage = v!),
        ),
        32.ESH(),
        _buildSaveButton(),
      ],
    );
  }

  // 8. ADVANCED SYSTEM SETTINGS
  Widget _buildSystemSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Advanced Developer Settings',
          'Fine-tune system variables, configure server APIs or toggle maintenance states.',
        ),
        24.ESH(),
        _buildToggleItem(
          'Debug Log Mode',
          'Output verbose warnings and execution logs to inspector consoles',
          _debugMode,
          (v) => setState(() => _debugMode = v),
        ),
        16.ESH(),
        _buildToggleItem(
          'Platform Maintenance Mode',
          'locks system for standard receptionists, allows only administrators',
          _maintenanceMode,
          (v) => setState(() => _maintenanceMode = v),
        ),
        32.ESH(),
        _buildSaveButton(),
      ],
    );
  }

  // ─────────────────── HELPERS ───────────────────
  Widget _buildSectionHeader(String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title, fontSize: 16, fontWeight: FW.bold, color: AppColors.get.textPrimary),
        6.ESH(),
        CustomText(desc, fontSize: 12, color: AppColors.get.textSecondary),
        16.ESH(),
        Divider(color: AppColors.get.border.withOpacity(0.5)),
      ],
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    IconData icon, {
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(label, fontSize: 12.5, fontWeight: FW.semiBold, color: AppColors.get.textPrimary),
        8.ESH(),
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 13.5, color: AppColors.get.textPrimary),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20, color: AppColors.get.primary),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 14.toH()),
            filled: true,
            fillColor: AppColors.get.surfaceContainer.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.toRad()),
              borderSide: BorderSide(color: AppColors.get.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.toRad()),
              borderSide: BorderSide(color: AppColors.get.border.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.toRad()),
              borderSide: BorderSide(color: AppColors.get.primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(
    String label,
    String value,
    List<String> items,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(label, fontSize: 12.5, fontWeight: FW.semiBold, color: AppColors.get.textPrimary),
        8.ESH(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 2.toH()),
          decoration: BoxDecoration(
            color: AppColors.get.surfaceContainer.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12.toRad()),
            border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.get.primary),
              onChanged: onChanged,
              style: TextStyle(fontSize: 13.5, color: AppColors.get.textPrimary, fontFamily: 'cairo'),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleItem(String title, String subtitle, bool value, void Function(bool) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 12.toH()),
      decoration: BoxDecoration(
        color: AppColors.get.surfaceContainer.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title, fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textPrimary),
                4.ESH(),
                CustomText(subtitle, fontSize: 11, color: AppColors.get.textSecondary),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.get.primary,
            activeTrackColor: AppColors.get.primary.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionItem(String platform, String details, bool active) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (active ? AppColors.get.success : Colors.grey).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            platform.contains('macOS') ? Icons.desktop_mac : Icons.phone_iphone,
            size: 16,
            color: active ? AppColors.get.success : Colors.grey,
          ),
        ),
        16.ESW(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(platform, fontSize: 12.5, fontWeight: FW.bold),
              4.ESH(),
              CustomText(details, fontSize: 11, color: AppColors.get.textSecondary),
            ],
          ),
        ),
        if (active)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.get.success.withOpacity(0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: CustomText(
              'Active',
              fontSize: 10,
              color: AppColors.get.success,
              fontWeight: FW.bold,
            ),
          )
        else
          TextButton(
            onPressed: () {},
            child: const CustomText('Revoke', fontSize: 11, color: Colors.red),
          ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: Colors.white),
                  SizedBox(width: 12),
                  Text('Settings saved successfully!'),
                ],
              ),
              backgroundColor: AppColors.get.success,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
        label: const CustomText('Save Settings', fontWeight: FW.bold, color: Colors.white),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.get.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 24.toW(), vertical: 16.toH()),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.toRad())),
        ),
      ),
    );
  }
}
