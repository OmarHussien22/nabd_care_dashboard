import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class OfflineBanner extends StatelessWidget {
  final VoidCallback? onRetry;

  const OfflineBanner({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppPalette.offline,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off, color: Colors.white, size: 14),
          const SizedBox(width: 8),
          const CustomText(
            "You are offline. Changes will be saved locally and synced when connection is restored.",
            color: Colors.white,
            fontSize: 13,
            fontWeight: FW.medium,
          ),
          if (onRetry != null) ...[
            const SizedBox(width: 16),
            InkWell(
              onTap: onRetry,
              child: const CustomText(
                "Retry",
                color: Colors.white,
                fontSize: 13,
                fontWeight: FW.bold,
                decoration: CustomTextDecoration.underLine,
              ),
            )
          ]
        ],
      ),
    );
  }
}
