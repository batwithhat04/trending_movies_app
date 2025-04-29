import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String _apiKey = 'dfaed971bf73d3bc53fdee13d0d04b63';  // 🔥 Replace with your API Key
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  static Future<List<Movie>> fetchTrendingMovies() async {
    final url = '$_baseUrl/trending/movie/day?api_key=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
