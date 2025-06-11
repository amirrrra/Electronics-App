import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/core/widgets/app_bar_widget.dart';
import 'package:electronics_app/features/profile/data/models/section_profile_model.dart';
import 'package:electronics_app/features/profile/data/models/user_profile_model.dart';
import 'package:flutter/material.dart';

class AboutMeWidget extends StatelessWidget {
  final UserProfileModel user;
  const AboutMeWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final List<SectionProfileModel> items = [
      SectionProfileModel(icon: Icons.account_circle_outlined, label: '${user.firstName} ${user.lastName}'),
      SectionProfileModel(icon: Icons.email_outlined, label: user.email),
      SectionProfileModel(icon: Icons.phone_android_outlined, label: user.phone),
      SectionProfileModel(icon: Icons.location_on_outlined, label: user.address),
    ];
    return Column(
      spacing: 32,
      children: [
        AppBarWidget(isBack: true, title: 'About Me'),
        Column(
          spacing: 5,
          children: List.generate(items.length, (index) {
            final item = items[index];
            return Container(
              margin: Constants.horizPadding16,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: ListTile(
                leading: Icon(item.icon, color: AppColors.grey86, size: 24),
                title: Text(
                  item.label,
                  style: AppStyles.medium15.copyWith(color: AppColors.grey86),
                ),
                contentPadding: Constants.horizPadding16,
                horizontalTitleGap: 20,
              ),
            );
          }),
        ),
      ],
    );
  }
}
