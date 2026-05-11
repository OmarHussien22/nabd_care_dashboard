import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/tables/table/custom_table.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import '../manager/patients_controller.dart';
import '../../domain/entities/patient_entity.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PatientsController());

    return AppContentWrapper(
      title: 'Patients Directory',
      breadcrumb: const AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'Dashboard', route: '/dashboard'),
          BreadcrumbItem(label: 'Patients'),
        ],
      ),
      actions: [
        _buildAddButton(context),
      ],
      child: GetBuilder<PatientsController>(
        id: 'patients_table',
        builder: (cnt) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Stats Overview ---
              _buildQuickStats(cnt),
              24.ESH(),

              // --- Header Toolbar ---
              _buildToolbar(cnt),
              20.ESH(),

              // --- Table Content ---
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: _buildTableContainer(cnt, context),
              ),

              // --- Pagination ---
              _buildPagination(cnt),
            ],
          );
        },
      ),
    );
  }

  // ─────────────────── ADD BUTTON ───────────────────
  Widget _buildAddButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => context.go('/patients/create'),
      icon: const Icon(Icons.person_add_rounded, size: 20),
      label: const Text('New Patient'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.get.primary,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.toRad())),
        elevation: 0,
      ),
    );
  }

  // ─────────────────── STATS ───────────────────
  Widget _buildQuickStats(PatientsController cnt) {
    final total = cnt.patients.length;
    final active = cnt.patients.where((p) => p.isActive).length;
    final inactive = cnt.patients.where((p) => !p.isActive).length;

    return Row(
      children: [
        _buildStatCard(
          label: 'Total Patients',
          value: '$total',
          icon: Icons.groups_rounded,
          color: AppColors.get.primary,
          subtitle: 'All registered',
        ),
        16.ESW(),
        _buildStatCard(
          label: 'Active Patients',
          value: '$active',
          icon: Icons.check_circle_outline_rounded,
          color: AppColors.get.success,
          subtitle: 'Currently active',
        ),
        16.ESW(),
        _buildStatCard(
          label: 'Inactive',
          value: '$inactive',
          icon: Icons.pause_circle_outline_rounded,
          color: AppColors.get.warning,
          subtitle: 'Deactivated',
        ),
        16.ESW(),
        _buildStatCard(
          label: 'New This Month',
          value: cnt.patients.isEmpty
              ? '0'
              : '${(cnt.patients.length * 0.3).ceil()}',
          icon: Icons.trending_up_rounded,
          color: AppColors.get.info,
          subtitle: 'vs last month ↑',
          //  isHighlight: true,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String label,
    required String value,
    required IconData icon,
    required Color color,
    required String subtitle,
    bool isHighlight = false,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.toRad()),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.toRad()),
          border: Border.all(
            color: isHighlight
                ? color.withValues(alpha: 0.3)
                : AppColors.get.border.withValues(alpha: 0.5),
            width: isHighlight ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isHighlight
                  ? color.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(14.toRad()),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.12),
                    color.withValues(alpha: 0.06)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14.toRad()),
              ),
              child: Icon(icon, color: color, size: 30.toRad()),
            ),
            16.ESW(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(value,
                      fontSize: 14,
                      fontWeight: FW.bold,
                      color: AppColors.get.textPrimary),
                  4.ESH(),
                  CustomText(label,
                      color: AppColors.get.textSecondary,
                      fontSize: 10,
                      fontWeight: FW.medium),
                  2.ESH(),
                  CustomText(subtitle,
                      color: color, fontSize: 10, fontWeight: FW.semiBold),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────── TOOLBAR ───────────────────
  Widget _buildToolbar(PatientsController cnt) {
    return Container(
      padding: EdgeInsets.all(16.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Search
          Expanded(
            flex: 3,
            child: TextField(
              onChanged: cnt.onSearch,
              decoration: InputDecoration(
                hintText: 'Search by name or phone...',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                prefixIcon: Icon(Icons.search_rounded,
                    color: AppColors.get.primary, size: 20),
                filled: true,
                fillColor: AppColors.get.surfaceContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.toRad()),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.toW(), vertical: 14.toH()),
              ),
            ),
          ),
          20.ESW(),

          // Status Filter chips
          _buildFancyFilter(cnt),

          20.ESW(),

          // Per page selector
          _buildPerPageSelector(cnt),
        ],
      ),
    );
  }

  Widget _buildFancyFilter(PatientsController cnt) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.get.surfaceContainer,
        borderRadius: BorderRadius.circular(12.toRad()),
      ),
      child: Row(
        children: [
          _buildFilterItem(
              'All', cnt.filterActive == null, () => cnt.setActiveFilter(null)),
          _buildFilterItem('Active', cnt.filterActive == true,
              () => cnt.setActiveFilter(true)),
          _buildFilterItem('Inactive', cnt.filterActive == false,
              () => cnt.setActiveFilter(false)),
        ],
      ),
    );
  }

  Widget _buildFilterItem(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 18.toW(), vertical: 12.toH()),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.get.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(9.toRad()),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: AppColors.get.primary.withValues(alpha: 0.25),
                      blurRadius: 6,
                      offset: const Offset(0, 2))
                ]
              : [],
        ),
        child: CustomText(
          label,
          fontWeight: isSelected ? FW.bold : FW.medium,
          fontSize: 8.8,
          color: isSelected ? Colors.white : Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _buildPerPageSelector(PatientsController cnt) {
    return Row(
      children: [
        CustomText('Show:', color: Colors.grey.shade600, fontSize: 10.8),
        8.ESW(),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: 12.toW(), vertical: 4.toH()),
          decoration: BoxDecoration(
            color: AppColors.get.surfaceContainer,
            borderRadius: BorderRadius.circular(10.toRad()),
            border: Border.all(color: AppColors.get.border),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: cnt.perPage,
              isDense: true,
              icon: Icon(Icons.keyboard_arrow_down_rounded,
                  color: AppColors.get.primary, size: 18),
              onChanged: (v) => cnt.changePerPage(v!),
              items: [10, 20, 50]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: CustomText('$e',
                            fontSize: 9.8, fontWeight: FW.semiBold),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────── TABLE ───────────────────
  Widget _buildTableContainer(PatientsController cnt, BuildContext context) {
    return Container(
      key: ValueKey(cnt.patients.length),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 8)),
        ],
      ),
      child: cnt.state is DataLoading && cnt.patients.isEmpty
          ? _buildLoadingState()
          : cnt.patients.isEmpty
              ? _buildEmptyState(context)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(20.toRad()),
                  child: CustomTable(
                    columnNames: const [
                      'Patient',
                      'Medical Info',
                      'Contact',
                      'Last Visit',
                      'Status',
                      'Actions',
                    ],
                    // Actions embedded per-row so each row has its own patient reference
                    data: List.generate(cnt.patients.length, (index) {
                      final p = cnt.patients[index];
                      return [
                        _buildPatientCell(p),
                        _buildMedicalCell(p),
                        _buildContactCell(p),
                        _buildActivityCell(p),
                        _buildStatusBadge(p.isActive),
                        _buildPatientActions(context, cnt, p),
                      ];
                    }),
                  ),
                ),
    );
  }

  // This builds the action widget for a single patient row.
  // Called once per row via customRowActions.
  Widget _buildPatientActions(
    BuildContext context,
    PatientsController cnt,
    dynamic patient,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // View
        _buildRowAction(
          Icons.visibility_rounded,
          AppColors.get.info,
          'View Record',
          () {},
        ),
        6.ESW(),
        // Edit
        _buildRowAction(
          Icons.edit_rounded,
          AppColors.get.primary,
          'Edit Patient',
          () => context.go('/patients/edit/${patient.id}'),
        ),
        6.ESW(),
        // More ▼ dropdown
        _buildMoreMenu(cnt, patient),
      ],
    );
  }

  Widget _buildMoreMenu(PatientsController cnt, dynamic patient) {
    return PopupMenuButton<String>(
      tooltip: 'More options',
      offset: const Offset(0, 36),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.toRad())),
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      itemBuilder: (_) => [
        PopupMenuItem<String>(
          value: 'deactivate',
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.block_rounded,
                    size: 16, color: Colors.orange.shade700),
              ),
              12.ESW(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    patient.isActive
                        ? 'Deactivate Patient'
                        : 'Already Inactive',
                    fontSize: 8.8,
                    fontWeight: FW.semiBold,
                    color:
                        patient.isActive ? Colors.orange.shade700 : Colors.grey,
                  ),
                  // CustomText(
                  //   'Soft delete — stays in system',
                  //   fontSize: 8.0,
                  //   color: AppColors.get.textSecondary,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'deactivate' && patient.isActive) {
          cnt.deactivatePatient(patient);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(8.toRad()),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.15)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.more_vert_rounded,
                size: 17, color: Colors.grey.shade600),
            // Icon(Icons.keyboard_arrow_down_rounded,
            //     size: 14, color: Colors.grey.shade500),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: EdgeInsets.all(72.toRad()),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 44,
              height: 44,
              child: CircularProgressIndicator(
                color: AppColors.get.primary,
                strokeWidth: 20,
              ),
            ),
            20.ESH(),
            CustomText('Loading patients...',
                color: AppColors.get.textSecondary, fontSize: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.toH()),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(28.toRad()),
              decoration: BoxDecoration(
                color: AppColors.get.primary.withValues(alpha: 0.06),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person_search_rounded,
                  size: 60,
                  color: AppColors.get.primary.withValues(alpha: 0.4)),
            ),
            28.ESH(),
            const CustomText('No Patients Found',
                fontSize: 10, fontWeight: FW.bold),
            10.ESH(),
            CustomText('Try adjusting your search or filters',
                color: AppColors.get.textSecondary, fontSize: 12),
            28.ESH(),
            ElevatedButton.icon(
              onPressed: () => context.go('/patients/create'),
              icon: const Icon(Icons.person_add_rounded, size: 18),
              label: const CustomText('Add First Patient',
                  fontWeight: FW.bold, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.get.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: 24.toW(), vertical: 14.toH()),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.toRad())),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────── TABLE CELLS ───────────────────
  Widget _buildPatientCell(PatientEntity p) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.toH()),
      child: Row(
        children: [
          Container(
            width: 42.toRad(),
            height: 42.toRad(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.get.primary, AppColors.get.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12.toRad()),
              boxShadow: [
                BoxShadow(
                    color: AppColors.get.primary.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 3)),
              ],
            ),
            child: Center(
              child: CustomText(p.initials,
                  fontSize: 8.5, fontWeight: FW.bold, color: Colors.white),
            ),
          ),
          14.ESW(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(p.name,
                  fontSize: 8.5,
                  fontWeight: FW.bold,
                  color: AppColors.get.textPrimary),
              4.ESH(),
              CustomText(
                '#PT-${p.id.toString().padLeft(4, '0')}',
                fontSize: 8.2,
                color: AppColors.get.primary.withValues(alpha: 0.7),
                fontWeight: FW.semiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalCell(PatientEntity p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bloodtype_rounded,
                      size: 14, color: Colors.red.shade500),
                  4.ESW(),
                  CustomText(p.bloodType ?? 'N/A',
                      fontWeight: FW.bold,
                      fontSize: 9.5,
                      color: Colors.red.shade600),
                ],
              ),
            ),
          ],
        ),
        4.ESH(),
        Row(
          children: [
            Icon(
              p.gender == 'Female' ? Icons.female_rounded : Icons.male_rounded,
              size: 14,
              color: p.gender == 'Female'
                  ? Colors.pink.shade400
                  : Colors.blue.shade400,
            ),
            4.ESW(),
            CustomText(
              '${p.age ?? '?'} yrs • ${p.gender ?? 'Unknown'}',
              fontSize: 8.5,
              color: AppColors.get.textSecondary,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactCell(PatientEntity p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        5.ESH(),
        Row(
          children: [
            Icon(Icons.phone_rounded, size: 15, color: AppColors.get.info),
            5.ESW(),
            CustomText(p.phone ?? 'No Phone',
                fontSize: 8.8, fontWeight: FW.medium),
          ],
        ),
        5.ESH(),
        Row(
          children: [
            Icon(Icons.email_outlined, size: 15, color: Colors.grey.shade400),
            5.ESW(),
            CustomText(p.email ?? 'No Email',
                fontSize: 8.2, color: AppColors.get.textSecondary),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityCell(PatientEntity p) {
    final hasVisit = p.lastVisit != null && p.lastVisit!.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          hasVisit ? p.lastVisit! : 'Never Visited',
          fontSize: 8.8,
          fontWeight: FW.semiBold,
          color: hasVisit
              ? AppColors.get.textPrimary
              : AppColors.get.textSecondary,
        ),
        5.ESH(),
        if (hasVisit)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.get.success.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: CustomText('Recent visit',
                fontSize: 8.0,
                color: AppColors.get.success,
                fontWeight: FW.semiBold),
          ),
      ],
    );
  }

  Widget _buildStatusBadge(bool isActive) {
    final color = isActive ? AppColors.get.success : Colors.grey.shade500;
    final label = isActive ? 'Active' : 'Inactive';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.toW(), vertical: 6.toH()),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: color.withValues(alpha: 0.25), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          7.ESW(),
          CustomText(label, fontSize: 8.5, color: color, fontWeight: FW.bold),
        ],
      ),
    );
  }

  Widget _buildRowAction(
      IconData icon, Color color, String tooltip, VoidCallback onTap) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.toRad()),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(8.toRad()),
            border: Border.all(color: color.withValues(alpha: 0.15)),
          ),
          child: Icon(icon, size: 17, color: color),
        ),
      ),
    );
  }

  // ─────────────────── PAGINATION ───────────────────
  Widget _buildPagination(PatientsController cnt) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.toH()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: 14.toW(), vertical: 8.toH()),
            decoration: BoxDecoration(
              color: AppColors.get.surfaceContainer,
              borderRadius: BorderRadius.circular(10.toRad()),
            ),
            child: CustomText(
              'Showing ${cnt.patients.length} of ${cnt.totalPages * cnt.perPage} results',
              color: AppColors.get.textSecondary,
              fontSize: 8.8,
            ),
          ),
          Row(
            children: [
              _buildPageNavButton(Icons.chevron_left_rounded,
                  cnt.currentPage > 1, () => cnt.goToPage(cnt.currentPage - 1)),
              12.ESW(),
              ...List.generate(cnt.totalPages, (index) {
                final page = index + 1;
                final isSelected = cnt.currentPage == page;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: InkWell(
                    onTap: () => cnt.goToPage(page),
                    borderRadius: BorderRadius.circular(8.toRad()),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 38.toRad(),
                      height: 38.toRad(),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.get.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.toRad()),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.get.primary
                              : AppColors.get.border,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                    color: AppColors.get.primary
                                        .withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3))
                              ]
                            : [],
                      ),
                      child: Center(
                        child: CustomText(
                          '$page',
                          color: isSelected
                              ? Colors.white
                              : AppColors.get.textPrimary,
                          fontWeight: isSelected ? FW.bold : FW.medium,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              12.ESW(),
              _buildPageNavButton(
                  Icons.chevron_right_rounded,
                  cnt.currentPage < cnt.totalPages,
                  () => cnt.goToPage(cnt.currentPage + 1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageNavButton(IconData icon, bool enabled, VoidCallback onTap) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(8.toRad()),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: enabled ? AppColors.get.surfaceContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(8.toRad()),
          border: Border.all(
              color: enabled ? AppColors.get.border : Colors.transparent),
        ),
        child: Icon(
          icon,
          color: enabled ? AppColors.get.primary : AppColors.get.grey,
          size: 22,
        ),
      ),
    );
  }
}
