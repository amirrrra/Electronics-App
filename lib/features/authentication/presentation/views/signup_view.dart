import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/signup_consumer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (context) => AuthCubit(AuthRepoImpl(ApiService())),
        child: const SignupConsumerWidget(),
      ),
    );
  }
}
