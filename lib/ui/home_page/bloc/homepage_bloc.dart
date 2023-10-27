import 'package:bloc/bloc.dart';
import 'package:deliveristo_assignment/models/breed_model.dart';
import 'package:deliveristo_assignment/models/dog_model.dart';
import 'package:deliveristo_assignment/repository/dog_repository.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final Repository repo;
  HomepageBloc(this.repo) : super(HomepageInitial()) {
    on<GetRandomDog>(
      (event, emit) async {
        try {
          emit(Loading(
              breeds: event.breeds,
              selectedBreed: event.breed,
              selectedSubBreed: event.subBreed));
          String? breedName =
              event.breed == null || event.breed!.name == 'random'
                  ? null
                  : event.breed!.name;
          List<Dog> dogs = await repo.getDogByBreed(
              num: event.num, breed: breedName, subBreed: event.subBreed);
          emit(Loaded(
              breeds: event.breeds, dogs: dogs, selectedBreed: event.breed));
        } catch (e) {
          emit(HomePageError(error: e.toString()));
          emit(Loaded(breeds: event.breeds));
        }
      },
    );
    on<GetBreeds>(
      (event, emit) async {
        try {
          emit(Loading());
          List<Breed> breeds = await repo.getAllBreeds();
          emit(Loaded(breeds: breeds));
        } catch (e) {
          emit(HomePageError(error: e.toString()));
          await Future.delayed(const Duration(minutes: 1));
          emit(HomepageInitial());
        }
      },
    );

    on<SelectBreed>(
      (event, emit) {
        emit(Loaded(
            breeds: event.breeds,
            selectedBreed: event.breed,
            dogs: event.dogs));
      },
    );

    on<SelectSubBreed>(
      (event, emit) {
        emit(Loaded(
            breeds: event.breeds,
            selectedBreed: event.breed,
            selectedSubBreed: event.subBreed,
            dogs: event.dogs));
      },
    );
  }
}
