class Dog {
  final String imageUrl;
  final String breed;
  final String subBreed;

  Dog({
    required this.imageUrl,
    required this.breed,
    required this.subBreed,
  });

  factory Dog.fromUrl(String url) {
    List<String> parts = url.split('/');
    if (parts.length >= 5) {
      String breed = parts[4];
      List<String> breedParts = breed.split('-');

      if (breedParts.length == 2) {
        String breed = breedParts[0];
        String subBreed = breedParts[1];
        return Dog(imageUrl: url, breed: breed, subBreed: subBreed);
      } else {
        String breed = breedParts[0];
        return Dog(imageUrl: url, breed: breed, subBreed: 'no sub breed');
      }
    } else {
      throw ("invaild Image Url");
    }
  }
}
