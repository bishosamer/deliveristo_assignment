part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

class GetRandomDog extends HomepageEvent {}

class GetDogByBreed extends HomepageEvent {}

class SelectBreed {}

class GetBreeds {}
