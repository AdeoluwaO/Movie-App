import 'package:flutter/material.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';
import '../pages/widgets/loading_screen.dart';

class BoxOffice extends StatefulWidget {
  const BoxOffice({super.key});

  @override
  State<BoxOffice> createState() => _BoxOfficeState();
}

class _BoxOfficeState extends State<BoxOffice> {
  List movies = [];
  bool isLoading = true;

  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future fetch() async {
    isLoading;
    final response = await boxOffice();

    if (mounted) {
      setState(() {
        movies = response;
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    fetch();
    boxOffice();
    super.dispose();
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
                  )),
      ],
    );
  }
}
