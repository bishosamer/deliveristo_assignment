class Breed {
  final String name;
  final List<String> subBreeds;

  Breed({required this.name, required this.subBreeds});

  factory Breed.fromJson(MapEntry<String, dynamic> json) {
    List<String> subBreeds = [];
    for (var subBreed in json.value) {
      subBreeds.add(subBreed.toString());
    }
    return Breed(name: json.key, subBreeds: subBreeds);
  }
}
