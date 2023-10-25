part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class BreedsLoading extends HomepageState {}

class DogsLoading extends HomepageState {}

class DogsLoaded extends HomepageState {}

class BreedsLoaded extends HomepageState {}

class HomePageError extends HomepageState {}
