import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// local imports

const String apiKey = '187d2a9c2c1a66c6beac88a4c4681554';

Future getTrending() async {
  const trending =
      'https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];
  // print(movies);
  return movies;
}

Future boxOffice() async {
  const trending =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];
  // print(movies);
  return movies;
}

Future commercial() async {
  const trending =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];
  // print(movies);
  return movies;
}

Future getMovies() async {
  const trending = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];
  // print(movies);
  return movies;
}

Future drama() async {
  const trending =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];
  // print(movies);
  return movies;
}
