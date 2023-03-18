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
    drama();
    super.dispose();
  }

  Future fetch() async {
    isLoading;
    final response = await drama();
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
