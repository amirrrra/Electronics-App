class CategoriesState {}

class CategoriesStateInitialState extends CategoriesState {}

class CategoriesStateLoadingState extends CategoriesState {}

class CategoriesStateSuccessState extends CategoriesState {
  final List<String> categories;

  CategoriesStateSuccessState(this.categories);
}

class CategoriesStateFailureState extends CategoriesState {
  final String errorMessage;

  CategoriesStateFailureState({required this.errorMessage});
}
