import 'package:flutter/material.dart';

// local imports
import '../../global_variables.dart';
import '../../moviedetails/moviedetails_screen.dart';

class Film extends StatefulWidget {
  const Film({super.key, required this.moviesList});
  final List moviesList;

  @override
  State<Film> createState() => _Film();
}

class _Film extends State<Film> {
  int _currentImage = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return PageView.builder(
      controller: PageController(viewportFraction: 0.8, initialPage: 6),
      onPageChanged: (int index) {
        setState(() {
          _currentImage = index;
        });
      },
      itemCount: widget.moviesList.length,
      itemBuilder: (context, index) {
        var rotate = _currentImage == index ? 0.0 : (22 / 7) / 20;
        return Column(
          children: [
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 400),
              tween: Tween(
                begin: rotate,
                end: rotate,
              ),
              curve: Curves.ease,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(
                        movieData: widget.moviesList[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 400,
                  margin: EdgeInsets.only(
                    left: width * 0.08,
                    right: width * 0.08,
                    top: 50,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imagePath +
                          widget.moviesList[index]['poster_path'].toString()),
                    ),
                  ),
                ),
              ),
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value,
                  child: child,
                );
              },
            ),
            Text(
              widget.moviesList[index]['title'] ?? 'Loading...',
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 243, 177, 55),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    widget.moviesList[index]['vote_count'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
