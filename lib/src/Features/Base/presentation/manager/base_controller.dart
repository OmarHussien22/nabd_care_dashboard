import 'package:flutter/material.dart';
import 'package:care_desk/src/Features/settings/presentation/pages/settings_page.dart';
import '../../../../Core/Services/Storage/storage_service.dart';
import '../../../../Core/Services/storage/src/storage_constants.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import '../../../Home/presentation/pages/home_page.dart';

class BaseController extends GetControllerInterface {
  final StorageService<int> _box = StorageService<int>();

  /// Main Tabs & Sub Tabs indices
  int _selectedMainIndex = 0;
  int get selectedMainIndex => _selectedMainIndex;

  int _selectedSubIndex = 0;
  int get selectedSubIndex => _selectedSubIndex;

  /// Sidebar state
  bool isSidebarOpen = true;
  bool _expandedMainTab = false;
  int? _expandedIndex;

  /// Pages
  late List<Widget> pages;

  @override
  Future<void> onInit() async {
    super.onInit();

    _selectedSubIndex = _box.read(stgBNBIndex) ?? 0;

    pages = [
      const HomePage(),
      const SettingsPage(),
    ];

    if (_selectedSubIndex > pages.length - 1) {
      _selectedSubIndex = 0;
    }
  }

  /// Toggle sidebar (open/close)
  void toggleSidebar() {
    isSidebarOpen = !isSidebarOpen;
    update();
  }

  /// Toggle expand/collapse a main tab
  void toggleExpand(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null;
      _expandedMainTab = false;
    } else {
      _expandedIndex = index;
      _expandedMainTab = true;
    }
    update();
  }

  /// Change active sub tab
  void changeTabIndex(int mainIndex, int subIndex) {
    _selectedMainIndex = mainIndex;
    _selectedSubIndex = subIndex;
    _box.save(stgBNBIndex,value:  subIndex);
    update();
  }

  bool isMainExpanded(int index) => _expandedIndex == index;
  bool get isAnyExpanded => _expandedMainTab;
}
