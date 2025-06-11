import 'package:electronics_app/features/profile/data/models/user_profile_model.dart';
import 'package:electronics_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:electronics_app/features/profile/presentation/cubits/profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'about_me_widget.dart';

class AboutMeBuilderWidget extends StatelessWidget {
  const AboutMeBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder< ProfileCubit, ProfileState>(
      builder: (BuildContext context, state) {
        if (state is ProfileSuccessState) {
          return AboutMeWidget(user: state.user);
        } else if (state is ProfileFailureState) {
          return ErrorWidget(state.message);
        } else {
          final dummyUser = UserProfileModel(
            id: 5,
            firstName: '',
            lastName: '',
            phone: '',
            address: '',
            email: '',
            createdAt: '',
            token: '',
          );
          return Skeletonizer(child: AboutMeWidget(user: dummyUser));
        }
      },
    );
  }
}
