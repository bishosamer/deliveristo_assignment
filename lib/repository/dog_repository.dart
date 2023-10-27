import 'dart:convert';
import 'package:deliveristo_assignment/models/breed_model.dart';
import 'package:deliveristo_assignment/models/dog_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  static const String baseUrl = 'https://dog.ceo/api';

  Future<List<Dog>> getDogByBreed(
      {String? breed, String? subBreed, required String num}) async {
    try {
      var res;
      // String urlPrefix = breed != null ? "/breed" : '/breeds';
      subBreed = subBreed != null ? "/$subBreed" : '';
      // breed = breed != null ? "/$breed" : '';
      if (breed != null) {
        res = await http.get(
            Uri.parse('$baseUrl/breed/$breed$subBreed/images/random/$num'));
      } else {
        res = await http.get(Uri.parse('$baseUrl/breeds/image/random/$num'));
      }

      print(res.body);
      List<Dog> dogs = [];
      var json = jsonDecode(res.body);
      List<dynamic> dogUrls = json['message'];
      for (var url in dogUrls) {
        dogs.add(Dog.fromUrl(url));
      }
      return dogs;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Breed>> getAllBreeds() async {
    var res = await http.get(Uri.parse('$baseUrl/breeds/list/all'));
    var json = jsonDecode(res.body);
    List<Breed> breeds = [];
    Map<String, dynamic> jsonmap = json['message'];
    for (var breed in jsonmap.entries) {
      breeds.add(Breed.fromJson(breed));
    }
    return breeds;
  }
}
