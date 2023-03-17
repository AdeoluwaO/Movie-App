import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local imports
import './widgets/film.dart';
import './widgets/genres.dart';
import '../services/fetch_movies.dart';
import '../pages/widgets/loading_screen.dart';

class InTheaterPage extends StatefulWidget {
  const InTheaterPage({super.key});

  @override
  State<InTheaterPage> createState() => _InTheaterPageState();
}

class _InTheaterPageState extends State<InTheaterPage> {
  List movies = [];
  bool isLoading = true;

  @override
  void initState() {
    fetchTrending();
    super.initState();
  }

  Future fetchTrending() async {
    isLoading;
    var response = await getTrending();
    if (mounted) {
      setState(() {
        movies = response;
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    fetchTrending();
    getTrending();
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
                ),
        ),
      ],
    );
  }
}
