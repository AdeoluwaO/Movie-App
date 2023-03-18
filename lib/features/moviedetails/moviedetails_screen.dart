import 'package:flutter/material.dart';

// local imports
import '../widgets/custom_icon_button.dart';
import '../pages/widgets/custom_button.dart';
import '../global_variables.dart';
import '../services/fetch_movies.dart';
import '../pages/widgets/loading_screen.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.movieData});
  final dynamic movieData;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // for rating button
    Icon icon = const Icon(Icons.star_outline);
    Color color = Colors.black;
    String status = 'Rate this';

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * 0.380,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                            imagePath + widget.movieData['backdrop_path']),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(90),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: width * 0.08, left: width * 0.01),
                      child: CustomIconButton(
                          icon: const Icon(
                            Icons.navigate_before_rounded,
                            size: 50,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          })),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.1, top: height * 0.3),
                    child: PhysicalModel(
                      color: Colors.white,
                      shadowColor: const Color.fromARGB(193, 158, 158, 158),
                      elevation: 8,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(60.0),
                      ),
                      child: Container(
                        height: 100,
                        width: width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(60.0),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(width * 0.0, 7, 0, 0),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 12.0),
                                        child: Icon(
                                          Icons.star,
                                          size: 30,
                                          color: highlightColor,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.movieData['vote_average']
                                                .toStringAsFixed(1),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('/10',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Text(
                                        widget.movieData['popularity']
                                            .toString(),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CustomIconButton(
                                        color: color,
                                        icon: icon,
                                        onTap: () {
                                          // still testing
                                          setState(() {
                                            icon = const Icon(Icons.star);
                                            color = highlightColor;
                                            status = 'Rated';
                                          });
                                        },
                                      ),
                                      Text(
                                        status,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.07, left: width * 0.05),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: width * 0.3),
                          child: Text(
                            widget.movieData['title'] ?? 'Not Available',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: width * 0.43,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.movieData['release_date'] ?? 'Not Found',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const Text(
                                'PG-13',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const Text(
                                '2hr 32min',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.7),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CustomIconButton(
                          icon: const Icon(Icons.add),
                          onTap: () {},
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: movieDetails(widget.movieData['id']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final data = snapshot.data;
                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return CustomButton(
                                title: data[index]['name'] ??
                                    'No Genres Available',
                                onTap: () {});
                          }),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return const SizedBox(height: 50);
                },
              ),
              Container(
                padding: EdgeInsets.only(right: width * 0.5, top: 20),
                child: const Text(
                  'Plot Summary',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: 20),
                child: Text(
                  widget.movieData['overview'],
                  textAlign: TextAlign.left,
                  style: const TextStyle(height: 1.8, color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width * 0.5),
                child: const Text(
                  'Cast & Crew',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder(
                  future: getCast(widget.movieData['id']),
                  builder: (contest, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final data = snapshot.data;
                      return Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: NetworkImage(imagePath +
                                        data[index]['profile_path'].toString()),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Text(
                                      data[index]['original_name'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                  Text(
                                    data[index]['character'].toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              );
                            }),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const LoadingScreen();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
