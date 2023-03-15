import 'package:flutter/material.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';

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
    isLoading;
    fetch();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  Future fetch() async {
    final response = await boxOffice();
    setState(() {
      movies = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Genres(),
        SizedBox(
          height: 600,
          child: Film(
            moviesList: movies,
            currentStatus: isLoading,
          ),
        ),
      ],
    );
  }
}
