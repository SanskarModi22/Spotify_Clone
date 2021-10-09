import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify_clone/constants/colors.dart';

import 'home_page.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _Body(),
      bottomNavigationBar: _Footer(),
    );
  }

  Widget _Footer() {
    List<IconData> icons = [
      FontAwesomeIcons.home,
      FontAwesomeIcons.search,
      FontAwesomeIcons.book,
      Icons.settings
    ];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        backgroundBlendMode: BlendMode.overlay,
        color: Colors.transparent
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
            (index) {
              return IconButton(
                icon: Icon(icons[index]),
                color: activeTab == index ? Colors.white : Colors.white54,
                onPressed: () {
                  setState(
                    () {
                      activeTab = index;
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _Body() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        Center(
          child: Text(
            "Search",
            style: TextStyle(
                fontSize: 20, color: white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Library",
            style: TextStyle(
                fontSize: 20, color: white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Setting",
            style: TextStyle(
                fontSize: 20, color: white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    )
    ;
  }
}
