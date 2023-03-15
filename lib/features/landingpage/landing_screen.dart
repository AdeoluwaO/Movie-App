// package imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// local imorts
import '../widgets/top_bar.dart';
import '../../provider/change_page.dart';
import '../pages/intheater_page.dart';
import '../pages/box_office.dart';
import '../pages/commercials.dart';
import '../pages/movies.dart';
import '../pages/drama.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List pages = const [
    InTheaterPage(),
    BoxOffice(),
    Commercial(),
    Movies(),
    Drama(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final page = Provider.of<ChangePage>(context).pageIndex;
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(190.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          toolbarHeight: 240.0,
          leadingWidth: width,
          leading: TopBar(scaffoldState: scaffoldKey),
        ),
      ),
      drawer: const Drawer(
        child: Text('Testing'),
      ),
      body: pages[page],
      //Film( ),
      //Text('Workinh'),
    );
  }
}
