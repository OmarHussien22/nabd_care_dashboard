import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/dialogs/animate_dialogs.dart';
import 'package:flutter/material.dart';

class ExportReportDialog extends StatefulWidget {
  const ExportReportDialog({super.key});

  @override
  State<ExportReportDialog> createState() => ExportReportDialogState();
}

class ExportReportDialogState extends State<ExportReportDialog> {
  bool _isExporting = false;
  String _selectedFormat = '';
  double _progress = 0.0;

  void _startExport(String format) async {
    setState(() {
      _isExporting = true;
      _selectedFormat = format;
      _progress = 0.0;
    });

    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 180));
      if (!mounted) return;
      setState(() {
        _progress = i * 0.1;
      });
    }

    if (mounted) {
      Navigator.pop(context); // Close dialog
      Dialogs.customToast(
        text: 'clinic_report_exported_successfully_as'.toTr() + _selectedFormat,
        context: context,
        isSuccess: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.toRad())),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(28.toRad()),
        width: 380.toW(),
        child: _isExporting ? _buildExportingView() : _buildSelectionView(),
      ),
    );
  }

  Widget _buildSelectionView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.toRad()),
              decoration: BoxDecoration(
                color: AppColors.get.primary.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.download_outlined,
                  color: AppColors.get.primary, size: 24),
            ),
            16.ESW(),
            const CustomText(
              'export_report',
              fontSize: 18,
              fontWeight: FW.bold,
            ),
          ],
        ),
        20.ESH(),
        CustomText(
          'select_your_preferred_document_format_to_download_the_comprehensive_clinic_performance_report',
          fontSize: 13,
          color: AppColors.get.textSecondary,
        ),
        24.ESH(),
        _buildFormatOption(
          title: 'pdf_document',
          subtitle: 'perfect_for_printing_and_sharing_official_reports',
          icon: Icons.picture_as_pdf_outlined,
          color: Colors.red,
          onTap: () => _startExport('PDF'),
        ),
        12.ESH(),
        _buildFormatOption(
          title: 'excel_spreadsheet',
          subtitle: 'ideal_for_detailed_custom_data_analysis',
          icon: Icons.table_view_outlined,
          color: Colors.green,
          onTap: () => _startExport('Excel'),
        ),
        12.ESH(),
        _buildFormatOption(
          title: 'csv_file',
          subtitle: 'lightweight_format_for_database_imports',
          icon: Icons.insert_drive_file_outlined,
          color: Colors.blueGrey,
          onTap: () => _startExport('CSV'),
        ),
        24.ESH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: CustomText(
                'cancel',
                color: AppColors.get.textSecondary,
                fontWeight: FW.medium,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExportingView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        20.ESH(),
        SizedBox(
          width: 70.toW(),
          height: 70.toH(),
          child: CircularProgressIndicator(
            value: _progress,
            strokeWidth: 5,
            backgroundColor: AppColors.get.border.withOpacity(0.5),
            color: AppColors.get.primary,
          ),
        ),
        24.ESH(),
        CustomText(
          '${'generating'.toTr()} $_selectedFormat ${'report'.toTr()}...',
          fontSize: 16,
          fontWeight: FW.bold,
        ),
        10.ESH(),
        CustomText(
          '${(_progress * 100).toInt()}% ${'completed'.toTr()}',
          fontSize: 14,
          color: AppColors.get.textSecondary,
          fontWeight: FW.medium,
        ),
        16.ESH(),
        CustomText(
          'please_do_not_close_this_window',
          fontSize: 12,
          color: AppColors.get.textDisabled,
        ),
        10.ESH(),
      ],
    );
  }

  Widget _buildFormatOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.toRad()),
      child: Container(
        padding: EdgeInsets.all(12.toRad()),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12.toRad()),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.toRad()),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.toRad()),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            16.ESW(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title, fontWeight: FW.semiBold, fontSize: 14),
                  4.ESH(),
                  CustomText(subtitle,
                      fontSize: 11, color: AppColors.get.textSecondary),
                ],
              ),
            ),
            Icon(Icons.chevron_right,
                size: 16, color: AppColors.get.textSecondary),
          ],
        ),
      ),
    );
  }
}
