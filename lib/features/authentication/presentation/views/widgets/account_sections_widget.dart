import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/features/authentication/data/models/account_model.dart';
import 'package:flutter/material.dart';

class AccountSectionsWidget extends StatelessWidget {
  const AccountSectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AccountModel> items = [
      AccountModel(icon: Icons.account_circle_outlined, label: 'About Me'),
      AccountModel(icon: Icons.list_alt_outlined, label: 'My Orders'),
      AccountModel(icon: Icons.favorite_border, label: 'My Favorites'),
      AccountModel(icon: Icons.logout_outlined, label: 'Sign out'),
    ];
    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        return ListTile(
          leading: Icon(item.icon, color: AppColors.customColor, size: 22),
          title: Text(item.label, style: AppStyles.semiBold12),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: AppColors.grey86,
          ),
          onTap: () {},
          contentPadding: Constants.horizPadding20,
          horizontalTitleGap: 15,
        );
      }),
    );
  }
}
