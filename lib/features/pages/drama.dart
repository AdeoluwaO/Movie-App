import 'package:flutter/material.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';
import '../pages/widgets/loading_screen.dart';

class Drama extends StatefulWidget {
  const Drama({super.key});

  @override
  State<Drama> createState() => _DramaState();
}

class _DramaState extends State<Drama> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: drama(),
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
