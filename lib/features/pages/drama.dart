import 'package:flutter/material.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';

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
    isLoading;
    fetch();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  Future fetch() async {
    final response = await drama();
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
          child: Film(moviesList: movies, currentStatus: isLoading,),
        ),
      ],
    );
  }
}
