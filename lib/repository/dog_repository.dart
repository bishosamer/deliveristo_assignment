import 'dart:convert';
import 'dart:developer';

import 'package:deliveristo_assignment/models/breed_model.dart';
import 'package:deliveristo_assignment/models/dog_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  static const String baseUrl = 'https://dog.ceo/api/breeds';

  Future<Dog> getRandomDog(String num) async {
    try {
      var res = await http.get(Uri.parse('$baseUrl/image/random/$num'));

      return Dog.fromUrl(res.body);
    } catch (e) {
      rethrow;
    }
  }

  getAllBreeds() async {
    var res = await http.get(Uri.parse('$baseUrl/list/all'));
    log(jsonDecode(res.body)['message'].toString());
    return res.body;
  }
}
