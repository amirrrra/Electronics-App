import 'package:electronics_app/core/helpers/progress_hud_widget.dart';
import 'package:electronics_app/core/helpers/show_snackbar.dart';
import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_state.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupConsumerWidget extends StatelessWidget {
  const SignupConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return ProgressHudWidget(
          inAsyncCall: state is LoadingSignupState,
          child: const SignupWidget(),
        );
      },
      listener: (context, state) {
        if (state is SuccessSignupState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackbarHelper(
              context: context,
              message: 'The account was created successfully',
            );
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          });
        }
        if (state is FailureSignupState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackbarHelper(context: context, message: state.errorMessage);
          });
        }
      },
    );
  }
}
