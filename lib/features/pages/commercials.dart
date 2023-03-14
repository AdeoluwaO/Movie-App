import 'package:flutter/material.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';

class Commercial extends StatefulWidget {
  const Commercial({super.key});

  @override
  State<Commercial> createState() => _CommercialState();
}

class _CommercialState extends State<Commercial> {
  List movies = [];

  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future fetch() async {
    final response = await commercial();
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
          child: Film(moviesList: movies),
        ),
      ],
    );
  }
}
