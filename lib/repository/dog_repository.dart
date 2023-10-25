import 'package:http/http.dart' as http;

class Repository {
  Repository._();
  static final Repository _instance = Repository._();
  static const String baseUrl = '';
  getBreeds() async {
    // http.get()
  }
}
