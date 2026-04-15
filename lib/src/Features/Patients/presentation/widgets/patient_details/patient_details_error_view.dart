import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter/material.dart';

class PatientDetailsErrorView extends StatelessWidget {
  final VoidCallback onRetry;

  const PatientDetailsErrorView({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.get.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.get.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline_rounded, size: 64, color: AppColors.get.error),
                const SizedBox(height: 14),
                Text(
                  'Failed to load patient details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.get.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please check your connection and try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.get.textSecondary,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Retry'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

