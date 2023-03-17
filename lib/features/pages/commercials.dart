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
    commercial();
    super.dispose();
  }

  Future fetch() async {
    isLoading;
    final response = await commercial();
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
