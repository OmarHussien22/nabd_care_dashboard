import 'package:care_desk/src/Features/MainLayout/presentation/widgets/home_statics_card.dart';
import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';

class HomeStaticsGridWidget extends StatelessWidget {
  const HomeStaticsGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 11,
      mainAxisSpacing: 12,
      childAspectRatio: 4.85,
      children: [
        HomeStaticsCard(
          title: "إجمالي المنتجات",
          value: "250",
          icon: Icons.inventory,
          color: AppColors.get.blue,
        ),
        HomeStaticsCard(
          title: "إجمالي المبيعات",
          value: "12,500 EGP",
          icon: Icons.attach_money,
          color: AppColors.get.green,
        ),
        HomeStaticsCard(
          title: "الأرباح",
          value: "3,200 EGP",
          icon: Icons.trending_up,
          color: AppColors.get.orange,
        ),
        HomeStaticsCard(
          title: "منتجات على وشك النفاد",
          value: "5",
          icon: Icons.warning,
          color: AppColors.get.red,
        ),
      ],
    );
  }
}
