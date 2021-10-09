import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/colors.dart';
import 'package:spotify_clone/model/song_list.dart';

import 'album.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<IconData> icons = [
    FontAwesomeIcons.bell,
    FontAwesomeIcons.history,
    Icons.settings,
  ];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 30.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,

                        end: Alignment.bottomRight,

                        colors: <Color>[
                          Color.fromRGBO(249, 3, 136, 1),
                          Color.fromRGBO(57, 4, 101, 1),
                        ],

                        tileMode: TileMode
                            .repeated, // repeats the gradient over the canvas
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 10.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                              icons.length,
                              (index) {
                                return InkWell(
                                  onTap: () {},
                                  child: IconButton(
                                    icon: Icon(icons[index]),
                                    color: Colors.white70,
                                    onPressed: () {},
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const Text(
                          'Hey',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          width: 60.w,
                          child: const Text(
                            'Want better reccomendations ? Pick some music you like',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,

                        end: Alignment.bottomCenter,

                        colors: <Color>[
                          Color.fromRGBO(0, 1, 4, 0.948),
                          Color.fromRGBO(0, 1, 4, 1),
                        ],

                        tileMode: TileMode
                            .repeated, // repeats the gradient over the canvas
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(11.sp),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Made For Sanskar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            height: 30.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: songs.length - 5,
                              itemBuilder: (ctx, item) {
                                return Padding(
                                  padding: EdgeInsets.all(
                                    9.sp,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              alignment: Alignment.bottomCenter,
                                              child: AlbumPage(
                                                song: songs[item],
                                              ),
                                              type: PageTransitionType.scale));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    songs[item]['img']),
                                                fit: BoxFit.cover),
                                            color: primary,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          songs[item]['title'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          width: 35.w,
                                          child: Text(
                                            songs[item]['description'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Sound Track Your home",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            height: 30.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: songs.length - 5,
                              itemBuilder: (ctx, item) {
                                return Padding(
                                  padding: EdgeInsets.all(
                                    9.sp,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            alignment: Alignment.bottomCenter,
                                            child: AlbumPage(
                                              song: songs[item + 5],
                                            ),
                                            type: PageTransitionType.scale),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    songs[item + 5]['img']),
                                                fit: BoxFit.cover),
                                            color: primary,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          songs[item + 5]['title'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          width: 35.w,
                                          child: Text(
                                            songs[item + 5]['description'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 26.5.h,
                left: 25.w,
                child: SizedBox(
                  height: 6.h,
                  width: 50.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.grey),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15.sp,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "CHOOSE MUSIC",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
