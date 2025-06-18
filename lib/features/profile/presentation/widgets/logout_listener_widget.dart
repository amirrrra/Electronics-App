import 'package:electronics_app/core/helpers/show_snackbar.dart';
import 'package:electronics_app/core/services/prefs_token.dart';
import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_state.dart';
import 'package:electronics_app/features/profile/presentation/widgets/profile_sections_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutListenerWidget extends StatelessWidget {
  const LogoutListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is SuccessLogoutState) {
          await clearLocalData();
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.login,
            (route) => false,
          );
        } else if (state is FailureLogoutState) {
          showSnackbarHelper(context: context, message: state.errorMessage);
        }
      },
      child: ProfileSectionsWidget(),
    );
  }
}
