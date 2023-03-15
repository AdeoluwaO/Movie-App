import 'package:flutter/material.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';

class InTheaterPage extends StatefulWidget {
  const InTheaterPage({super.key});

  @override
  State<InTheaterPage> createState() => _InTheaterPageState();
}

class _InTheaterPageState extends State<InTheaterPage> {
  List movies = [];
  bool isLoading = true;
  bool loadingUpdate = true;

  @override
  void initState() {
    isLoading;
    fetchTrending();
    isLoading = false;
    setState(() {
      isLoading = loadingUpdate;
    });
    super.initState();
  }

  Future fetchTrending() async {
    isLoading;
    final response = await getTrending();
    isLoading = false;
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
            currentStatus: loadingUpdate,
          ),
        ),
      ],
    );
  }
}
