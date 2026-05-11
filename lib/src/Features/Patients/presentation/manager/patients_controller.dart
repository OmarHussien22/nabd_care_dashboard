import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Constants/Enums/app_source.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../core/patients_params.dart';
import '../../domain/entities/patient_entity.dart';
import '../../domain/use_cases/patients_use_cases.dart';

class PatientsController extends GetControllerInterface<List<PatientEntity>> {
  final FetchPatientsUseCase _fetchUseCase = FetchPatientsUseCase();
  final AddPatientUseCase _addUseCase = AddPatientUseCase();
  final DeletePatientUseCase _deleteUseCase = DeletePatientUseCase();

  // --- State ---
  List<PatientEntity> patients = [];
  int currentPage = 1;
  int perPage = 10;
  int totalPages = 1;
  String searchQuery = '';
  String? filterGender;
  bool? filterActive;
  bool isSubmitting = false;

  // --- Search debounce ---
  Timer? _searchDebounce;

  @override
  void onInit() {
    super.onInit();
    fetchPatients();
  }

  // ─────────────────── FETCH ───────────────────
  Future<void> fetchPatients({bool refresh = false}) async {
    if (refresh) {
      currentPage = 1;
      patients.clear();
    }

    emit(const DataLoading());

    final result = await _fetchUseCase.call(
      params: FetchPatientsParams(
        page: currentPage,
        perPage: perPage,
        search: searchQuery.isEmpty ? null : searchQuery,
        gender: filterGender,
        isActive: filterActive,
      ),
    )!;

    if (result is DataSuccess) {
      patients = result.data ?? [];

      // Local filtering for Dev Mode
      if (IntalizeAppSource.currentSource == AppSource.dev) {
        if (searchQuery.isNotEmpty) {
          patients = patients
              .where((p) =>
                  p.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                  (p.phone?.contains(searchQuery) ?? false))
              .toList();
        }
        if (filterGender != null) {
          patients = patients.where((p) => p.gender == filterGender).toList();
        }
        if (filterActive != null) {
          patients = patients.where((p) => p.isActive == filterActive).toList();
        }
      }

      final pagination = result.pagination;
      if (pagination != null) {
        totalPages = (pagination.total ?? 1) ~/ perPage + 1;
      }
      emit(result);
    } else if (result is DataFailed) {
      emit(result);
    }

    update(['patients_table']);
  }

  // ─────────────────── SEARCH ───────────────────
  void onSearch(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      searchQuery = query;
      fetchPatients(refresh: true);
    });
  }

  // ─────────────────── PAGINATION ───────────────────
  void goToPage(int page) {
    if (page < 1 || page > totalPages) return;
    currentPage = page;
    fetchPatients();
  }

  void changePerPage(int value) {
    perPage = value;
    fetchPatients(refresh: true);
  }

  // ─────────────────── FILTERS ───────────────────
  void setGenderFilter(String? gender) {
    filterGender = gender;
    fetchPatients(refresh: true);
  }

  void setActiveFilter(bool? isActive) {
    filterActive = isActive;
    fetchPatients(refresh: true);
  }

  // ─────────────────── ADD / EDIT ───────────────────
  Future<bool> savePatient(AddPatientParams params) async {
    isSubmitting = true;
    update(['patients_table']);

    final result = await _addUseCase.call(params: params)!;

    isSubmitting = false;

    if (result is DataSuccess) {
      await fetchPatients(refresh: true);
      Get.snackbar('✓ Success', 'Patient saved successfully',
          backgroundColor: const Color(0xFF22C55E),
          colorText: const Color(0xFFFFFFFF));
      return true;
    } else if (result is DataFailed) {
      Get.snackbar('Error', result.error?.title ?? 'Failed to save patient');
      return false;
    }
    return false;
  }

  // ─────────────────── DEACTIVATE ───────────────────
  Future<void> deactivatePatient(PatientEntity patient) async {
    final confirmed = await Get.dialog<bool>(
      _buildConfirmDialog(patient.name),
    );

    if (confirmed != true) return;

    final result = await _deleteUseCase.call(
      params: DeletePatientParams(patientId: patient.id),
    )!;

    if (result is DataSuccess || result is DataFailed) {
      // In dev mode, update locally
      final idx = patients.indexWhere((p) => p.id == patient.id);
      if (idx != -1) {
        final updated = List<PatientEntity>.from(patients);
        updated[idx] = patients[idx].copyWith(isActive: false);
        patients = updated;
        update(['patients_table']);
      }
      Get.snackbar(
          'Patient Deactivated', '${patient.name} has been deactivated.');
    }
  }

  Widget _buildConfirmDialog(String patientName) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
          SizedBox(width: 12),
          Text('Confirm Deactivation'),
        ],
      ),
      content: Text(
          'Are you sure you want to deactivate "$patientName"?\nThis patient will remain in the system but marked as inactive.'),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Get.back(result: true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
          child: const Text('Deactivate'),
        ),
      ],
    );
  }

  @override
  void onClose() {
    _searchDebounce?.cancel();
    super.onClose();
  }
}

// Needed for the dialog widget build method
