part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

class GetRandomDog extends HomepageEvent {
  final String num;
  final Breed? breed;
  final String? subBreed;
  final List<Breed> breeds;
  GetRandomDog(
      {required this.breeds, this.breed, this.subBreed, required this.num});
}

class SelectBreed extends HomepageEvent {
  final Breed breed;
  final List<Breed> breeds;
  final List<Dog>? dogs;
  SelectBreed({
    this.dogs,
    required this.breed,
    required this.breeds,
  });
}

class SelectSubBreed extends HomepageEvent {
  final Breed breed;
  final String subBreed;
  final List<Breed> breeds;
  final List<Dog>? dogs;
  SelectSubBreed(
      {required this.breeds,
      this.dogs,
      required this.breed,
      required this.subBreed});
}

class GetBreeds extends HomepageEvent {}
