// package imports
import 'package:flutter/material.dart';

// local imports
import './custom_icon_button.dart';
import '../widgets/categories_bar.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.scaffoldState});

  final GlobalKey<ScaffoldState> scaffoldState;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                color: Colors.black,
                icon: const Icon(Icons.sort),
                onTap: () {
                  scaffoldState.currentState?.openDrawer();
                },
              ),
              CustomIconButton(
                color: Colors.black,
                icon: const Icon(Icons.search),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 30),
          const CategoriesBar()
        ],
      ),
    );
  }
}
