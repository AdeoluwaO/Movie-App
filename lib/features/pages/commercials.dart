import 'package:flutter/material.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';
import '../pages/widgets/loading_screen.dart';

class Commercial extends StatefulWidget {
  const Commercial({super.key});

  @override
  State<Commercial> createState() => _CommercialState();
}

class _CommercialState extends State<Commercial> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: commercial(),
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
