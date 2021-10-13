import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/colors.dart';
import 'package:spotify_clone/model/song_list.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, this.song}) : super(key: key);
  final dynamic song;
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    var songSelected = widget.song['songs'];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      widget.song['img'],
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(22.sp, 2.h, 22.sp, 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.song['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            10.sp,
                            10.sp,
                            5.sp,
                            5.sp,
                          ),
                          child: Center(
                            child: Text(
                              "Subscribe",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 28.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: songs.length,
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
                                      image: AssetImage(songs[item]['img']),
                                      fit: BoxFit.cover),
                                  color: primary,
                                  borderRadius: BorderRadius.circular(10),
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
                                width: 40.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      songs[item]['song_count'],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.sp,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      songs[item]['date'],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.sp,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 50.h,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: songSelected.length,
                        itemBuilder: (ctx, item) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(
                              10.sp,
                              10.sp,
                              5.sp,
                              10.sp,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  child: Text(
                                    "${item + 1}. ${songSelected[item]["title"]}",
                                    style: TextStyle(
                                        fontSize: 17.sp, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: 35.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 15.w,
                                        height: 3.h,
                                        child: Text(
                                          songSelected[item]["duration"],
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 15.w,
                                        height: 3.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withOpacity(0.9),
                                        ),
                                        child: Icon(
                                          Icons.play_arrow,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: white,
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
