import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const String apiKey = '187d2a9c2c1a66c6beac88a4c4681554';

Future getTrending() async {
  const trending =
      'https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];

  return movies;
}

Future boxOffice() async {
  const trending =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];

  return movies;
}

Future commercial() async {
  const trending =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];

  return movies;
}

Future getMovies() async {
  const trending = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];

  return movies;
}

Future drama() async {
  const trending =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  final res = await http.get(Uri.parse(trending));
  Map jsonFormat = convert.jsonDecode(res.body);
  final movies = jsonFormat['results'];
  return movies;
}

Future movieDetails(int id) async {
  var details =
      'https://api.themoviedb.org/3/movie/$id?api_key=$apiKey&language=en-US';
  final response = await http.get(Uri.parse(details));
  Map jsonFormat = convert.jsonDecode(response.body);
  final name = jsonFormat['genres'];
  return name;
}

Future getCast(int id) async {
  //final int id = 937278;
  final castDetails =
      "https://api.themoviedb.org/3/movie/$id/reviews?api_key$apiKey";

// https://api.themoviedb.org/3/movie/937278/reviews?api_key=187d2a9c2c1a66c6beac88a4c4681554

  final response = await http.get(Uri.parse(castDetails));
  Map jsonResponse = convert.jsonDecode(response.body);
  final res = jsonResponse['results'];
  return res;
}
