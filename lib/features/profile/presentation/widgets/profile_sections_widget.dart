import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/features/profile/data/models/section_profile_model.dart';
import 'package:electronics_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSectionsWidget extends StatelessWidget {
  const ProfileSectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SectionProfileModel> items = [
      SectionProfileModel(
        icon: Icons.account_circle_outlined,
        label: 'About Me',
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.aboutMe);
          // BlocProvider.of<ProfileCubit>(context).fetchProfile(token: token);
        },
      ),
      SectionProfileModel(
        icon: Icons.list_alt_outlined,
        label: 'My Orders',
        onTap: () {},
      ),
      SectionProfileModel(
        icon: Icons.favorite_border,
        label: 'My Favorites',
        onTap: () {},
      ),
      SectionProfileModel(
        icon: Icons.logout_outlined,
        label: 'Sign out',
        onTap: () {},
      ),
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
          onTap: item.onTap,
          contentPadding: Constants.horizPadding20,
          horizontalTitleGap: 15,
        );
      }),
    );
  }
}
