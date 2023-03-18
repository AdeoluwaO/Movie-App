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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Column(
              children: [
                const Genres(),
                SizedBox(
                  height: 600,
                  child: Film(
                    moviesList: snapshot.data,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            Text(snapshot.error.toString());
          }
          return const LoadingScreen();
        });
  }
}
