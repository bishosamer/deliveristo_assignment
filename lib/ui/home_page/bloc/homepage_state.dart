part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class Loading extends HomepageState {
  final List<Breed>? breeds;
  final Breed? selectedBreed;
  final String? selectedSubBreed;

  Loading({this.breeds, this.selectedBreed, this.selectedSubBreed});
}

class Loaded extends HomepageState {
  final List<Dog>? dogs;
  final List<Breed> breeds;
  final Breed? selectedBreed;
  final String? selectedSubBreed;

  Loaded(
      {required this.breeds,
      this.selectedBreed,
      this.selectedSubBreed,
      this.dogs});
}

class HomePageError extends HomepageState {
  final String error;

  HomePageError({required this.error});
}
