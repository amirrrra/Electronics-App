import 'package:electronics_app/features/profile/data/repos/profile_repo.dart';
import 'package:electronics_app/features/profile/presentation/cubits/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitialState());
  final ProfileRepo _profileRepo;

  Future<void> fetchProfile({required String token}) async {
    emit(ProfileLoadingState());
    final result = await _profileRepo.fetchProfile(token);
    result.fold(
      (failure) => emit(ProfileFailureState(message: failure.errMessage)),
      (data) => emit(ProfileSuccessState()),
    );
  }
}
