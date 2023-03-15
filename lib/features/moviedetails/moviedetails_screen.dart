import 'package:flutter/material.dart';

// local imports
import '../widgets/custom_icon_button.dart';
import '../pages/widgets/custom_button.dart';
import '../global_variables.dart';

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
                    padding:
                        EdgeInsets.only(top: width * 0.08, left: width * 0.02),
                    child: const Icon(
                      Icons.navigate_before_rounded,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.1, top: height * 0.3),
                    child: PhysicalModel(
                      color: Colors.white,
                      shadowColor: Color.fromARGB(193, 158, 158, 158),
                      elevation: 8,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(60.0),
                      ),
                      child: Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(60.0),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomIconButton(
                                    icon: const Icon(Icons.star),
                                    onTap: () {},
                                    color:
                                        const Color.fromARGB(255, 243, 177, 55),
                                    size: 25,
                                  ),
                                  Text('Rating/10'),
                                  Text('ratings'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.star_outline),
                                  Text('Rate this')
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
                            widget.movieData['title'] ?? 'Not Found',
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
                                'PG 13',
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
                        Row(
                          children: [
                            // mp the button
                            CustomButton(
                              title: 'Geners',
                              onTap: () {},
                            ),
                          ],
                        ),
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
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width * 0.5, top: 20),
                child: const Text(
                  'Cast and Crew',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Text('Map Images of cast and crew'),
                  Text('Images of cast and crew'),
                  Text('Images of cast and crew'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
