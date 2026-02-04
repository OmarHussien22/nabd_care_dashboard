import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

enum SyncState {
  online,
  offline,
  syncing,
}

class SyncIndicator extends StatelessWidget {
  final SyncState state;
  final DateTime? lastSyncTime;

  const SyncIndicator({
    super.key,
    this.state = SyncState.online,
    this.lastSyncTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getBackgroundColor(state).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _getBackgroundColor(state).withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(state),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                _getTitle(state),
                color: _getBackgroundColor(state),
                fontWeight: FW.semiBold,
                fontSize: 12,
              ),
              if (lastSyncTime != null && state != SyncState.syncing)
                CustomText(
                  'Last synced: ${_formatTime(lastSyncTime!)}',
                  color: AppPalette.textSecondary,
                  fontSize: 10,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(SyncState state) {
    switch (state) {
      case SyncState.syncing:
        return const SizedBox(
          width: 14,
          height: 14,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppPalette.syncing,
          ),
        );
      case SyncState.offline:
        return const Icon(Icons.cloud_off, size: 16, color: AppPalette.offline);
      case SyncState.online:
        return const Icon(Icons.cloud_done, size: 16, color: AppPalette.success);
    }
  }

  Color _getBackgroundColor(SyncState state) {
    switch (state) {
      case SyncState.online:
        return AppPalette.success;
      case SyncState.offline:
        return AppPalette.offline;
      case SyncState.syncing:
        return AppPalette.syncing;
    }
  }

  String _getTitle(SyncState state) {
    switch (state) {
      case SyncState.online:
        return 'Online';
      case SyncState.offline:
        return 'Offline Mode';
      case SyncState.syncing:
        return 'Syncing...';
    }
  }

  String _formatTime(DateTime time) {
    // Simple formatter, can use intl later
    return "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
  }
}
