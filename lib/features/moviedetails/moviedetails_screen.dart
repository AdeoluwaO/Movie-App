import 'package:flutter/material.dart';

// local imports
import '../widgets/custom_icon_button.dart';
import '../pages/widgets/custom_button.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final url =
      'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.380,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(url),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: width * 0.08, left: width * 0.02),
                  child: Icon(
                    Icons.navigate_before_rounded,
                    size: 50,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.1, top: height * 0.3),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(60.0),
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomIconButton(
                                icon: Icon(Icons.star),
                                onTap: () {},
                                color: const Color.fromARGB(255, 243, 177, 55),
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
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.07, left: width * 0.05),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title Text',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2019',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'PG 13',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
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
            Text(
              'Plot Summary',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              child: Text('blah blah blah plot summary'),
            ),
            Text(
              'Cast and Crew',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
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
    );
  }
}
