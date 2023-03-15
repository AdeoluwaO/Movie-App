// package imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local imports
import '../global_variables.dart';
import '../../provider/change_page.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({
    super.key,
  });
  @override
  State<CategoriesBar> createState() => _CategoriesBar();
}

class _CategoriesBar extends State<CategoriesBar> {
  final List<String> cat = Categories.categories;
  int? _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangePage>(context, listen: false);
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cat.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                provider.changePage(index);
                setState(() {
                  _currentPage = provider.pageIndex;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 4, 0),
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color: _currentPage == index
                            ? Colors.black
                            : const Color.fromARGB(214, 158, 158, 158),
                        fontSize: 30,
                        fontWeight:
                            _currentPage == index ? FontWeight.w400 : null,
                      ),
                      duration: const Duration(milliseconds: 600),
                      child: Text(
                        cat[index],
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _currentPage == index ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 6,
                      width: 40,
                      margin: EdgeInsets.only(
                          left: width * 0.04, top: width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
