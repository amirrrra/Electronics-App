import 'package:electronics_app/features/profile/data/models/user_profile_model.dart';

class ProfileState {}
class ProfileInitialState extends ProfileState{}
class ProfileLoadingState extends ProfileState{}
class ProfileSuccessState extends ProfileState{
  final UserProfileModel user;

  ProfileSuccessState({required this.user});
}
class ProfileFailureState extends ProfileState{
  final String message;

  ProfileFailureState({required this.message});
}
