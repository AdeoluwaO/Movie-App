import 'package:flutter/material.dart';

// local imports
import 'custom_button.dart';
import '../../global_variables.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});
  final genres = Categories.genres;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(
                left: width * 0.02,
                right: width * 0.01,
              ),
              child: CustomButton(title: genres[index], onTap: () {}),
            );
          }),
    );
  }
}
