import 'package:electronics_app/core/services/prefs_token.dart';
import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/about_me_builder_widget.dart';

class AboutMeView extends StatefulWidget {
  const AboutMeView({super.key});

  @override
  State<AboutMeView> createState() => _AboutMeViewState();
}

class _AboutMeViewState extends State<AboutMeView> {
  @override
  void initState() {
    super.initState();
    triggerProfile();
  }

  Future<void> triggerProfile() async {
    final token = await getToken();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<ProfileCubit>().fetchProfile(token: token),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF4,
      body: AboutMeBuilderWidget(),
    );
  }
}
