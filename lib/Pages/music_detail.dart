import 'dart:io';

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/colors.dart';

class MusicDetail extends StatefulWidget {
  MusicDetail({
    Key? key,
    this.title,
    this.color,
    this.description,
    this.img,
    this.songUrl,
  }) : super(key: key);
  final String? title;
  final Color? color;
  final String? description;
  final String? img;
  final String? songUrl;
  @override
  _MusicDetailState createState() => _MusicDetailState();
}

class _MusicDetailState extends State<MusicDetail> {
  double _current = 20.0;
  AudioPlayer? advancedPlayer;
  AudioCache? audioCache;
  bool isPlaying = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songUrl!);
  }

  playSound(localPath) async {
    await audioCache!.play(localPath);
  }

  stopSound(localPath) async {
    Uri file = await audioCache!.load(localPath);
    await advancedPlayer!.setUrl(file.path);
    advancedPlayer!.stop();
  }

  seekSound() async {
    Uri file = await audioCache!.load(widget.songUrl!);
    await advancedPlayer!.setUrl(file.path);
    advancedPlayer!.seek(
      Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stopSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 90.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        17.sp,
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.img!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 90.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: widget.color!,
                          blurRadius: 50,
                          spreadRadius: 5,
                          offset: Offset(-10, 40),
                        )
                      ],
                      borderRadius: BorderRadius.circular(
                        17.sp,
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.img!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: 98.w,
              height: 8.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.archive,
                      color: Colors.white,
                    ),
                    iconSize: 25.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.title!,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 1.w,
                      ),
                      Text(
                        widget.description!,
                        maxLines: 1,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    iconSize: 25.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Slider(
              value: _current,
              activeColor: primary,
              min: 0,
              max: 200,
              onChanged: (double value) {
                setState(() {
                  _current = value;
                });
                seekSound();
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.sp, 0, 12.sp, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1.50",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    "4.58",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white.withOpacity(0.8),
                    size: 23.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.white.withOpacity(0.8),
                    size: 23.sp,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (!isPlaying) {
                        stopSound(widget.songUrl);
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        playSound(widget.songUrl);
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                    iconSize: 38.sp,
                    icon: Container(
                      decoration: BoxDecoration(
                        color: primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          isPlaying
                              ? Entypo.controller_stop
                              : Entypo.controller_play,
                          size: 30.sp,
                          color: Colors.white,
                        ),
                      ),
                    )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.white.withOpacity(0.8),
                    size: 23.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.retweet,
                    color: Colors.white.withOpacity(0.8),
                    size: 23.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Feather.tv,
                  color: primary,
                  size: 12.sp,
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    "Chromecast is ready",
                    style: TextStyle(
                      color: primary,
                      fontSize: 12.sp,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
