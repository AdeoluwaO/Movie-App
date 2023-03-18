import 'package:flutter/material.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';
import '../pages/widgets/loading_screen.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List movies = [];
  bool isLoading = true;

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  void dispose() {
    fetch();
    getMovies();
    super.dispose();
  }

  Future fetch() async {
    isLoading;
    final response = await getMovies();

    if (mounted) {
      setState(() {
        movies = response;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Genres(),
        SizedBox(
          height: 600,
          child: isLoading
              ? const LoadingScreen()
              : Film(
                  moviesList: movies,
                ),
        ),
      ],
    );
  }
}
