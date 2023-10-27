import 'package:deliveristo_assignment/models/breed_model.dart';
import 'package:deliveristo_assignment/models/dog_model.dart';
import 'package:mockito/mockito.dart';
import 'package:deliveristo_assignment/repository/dog_repository.dart';

class MockRepository extends Mock implements Repository {
  @override
  Future<List<Breed>> getAllBreeds() async {
    return [Breed(name: 'name', subBreeds: [])];
  }

  @override
  Future<List<Dog>> getDogByBreed(
      {String? breed, String? subBreed, required String num}) async {
    return [
      Dog(
          imageUrl:
              'https://images.dog.ceo/breeds/hound-walker/n02089867_3784.jpg',
          breed: 'breed',
          subBreed: 'subBreed')
    ];
  }
}
