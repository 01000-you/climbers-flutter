import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class PostCard extends StatefulWidget {
  int number;
  PostCard({required this.number});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int pageLength;
  int currentPageIndex = 0;
  PageController _controller = PageController();

  List<String> testImageList = [
    "https://firebasestorage.googleapis.com/v0/b/app-climbers.appspot.com/o/solutionVideo%2Fthumbnail%2Fc2ccd5ef-aa07-4c0b-9039-dcd7876566c7.gif?alt=media&token=1c7aa9e8-18b5-4f66-adbc-64b288a43310",
    "https://firebasestorage.googleapis.com/v0/b/app-climbers.appspot.com/o/solutionVideo%2Fthumbnail%2Fc2ccd5ef-aa07-4c0b-9039-dcd7876566c7.gif?alt=media&token=1c7aa9e8-18b5-4f66-adbc-64b288a43310",
    "https://firebasestorage.googleapis.com/v0/b/app-climbers.appspot.com/o/solutionVideo%2Fthumbnail%2Fc2ccd5ef-aa07-4c0b-9039-dcd7876566c7.gif?alt=media&token=1c7aa9e8-18b5-4f66-adbc-64b288a43310"
  ];

  @override
  void initState() {
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: MediaQuery.of(context).size.width,
            // color: Colors.grey,
            // child: Center(child: Text('제목칸')),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('y01000.you')
                  ],
                ),
                Icon(Icons.subject)
              ],
            )),
        // Container(
        //     // height: 400,
        //     // width: MediaQuery.of(context).size.width,
        //     // color: Colors.white,
        //     // child: Center(child: Text('사진칸')),
        //     child: Image.network(
        //         "https://firebasestorage.googleapis.com/v0/b/app-climbers.appspot.com/o/solutionVideo%2Fthumbnail%2Fc2ccd5ef-aa07-4c0b-9039-dcd7876566c7.gif?alt=media&token=1c7aa9e8-18b5-4f66-adbc-64b288a43310")),
        AspectRatio(
            aspectRatio: 1,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                PageView.builder(
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Image.network(testImageList[index],
                          fit: BoxFit.cover),
                    );
                  },
                  onPageChanged: (value) => {
                    setState(() {
                      currentPageIndex = value;
                    })
                  },
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(500)),
                    child: Text('${currentPageIndex + 1}/$pageLength',
                        style: TextStyle(color: Colors.white))),
              ],
            )),
        //   child: PageView(
        //     controller: _controller,
        //     children: [
        //       Container(
        //           child: Image.network(
        //               "https://firebasestorage.googleapis.com/v0/b/app-climbers.appspot.com/o/solutionVideo%2Fthumbnail%2Fc2ccd5ef-aa07-4c0b-9039-dcd7876566c7.gif?alt=media&token=1c7aa9e8-18b5-4f66-adbc-64b288a43310",
        //               fit: BoxFit.cover)),
        //       Container(
        //           child: Image.network(
        //               "https://firebasestorage.googleapis.com/v0/b/app-climbers.appspot.com/o/solutionVideo%2Fthumbnail%2Fc2ccd5ef-aa07-4c0b-9039-dcd7876566c7.gif?alt=media&token=1c7aa9e8-18b5-4f66-adbc-64b288a43310",
        //               fit: BoxFit.cover)),
        //       Container(
        //           child: Image.network(
        //               "https://firebasestorage.googleapis.com/v0/b/app-climbers.appspot.com/o/solutionVideo%2Fthumbnail%2Fc2ccd5ef-aa07-4c0b-9039-dcd7876566c7.gif?alt=media&token=1c7aa9e8-18b5-4f66-adbc-64b288a43310",
        //               fit: BoxFit.cover)),
        //     ],
        //   ),
        // ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            // child: Center(child: Text('아이콘칸')),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(Icons.chat_outlined),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(Icons.send),
                      ],
                    ),
                    Icon(Icons.bookmark_border)
                  ],
                ),
                ScrollingPageIndicator(
                    dotColor: Colors.grey,
                    dotSelectedColor: Colors.deepPurple,
                    dotSize: 6,
                    dotSelectedSize: 8,
                    dotSpacing: 12,
                    controller: _controller,
                    itemCount: 3,
                    orientation: Axis.horizontal),
              ],
            )),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 25,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: Row(
              children: [
                Text('좋아요'),
                SizedBox(
                  width: 5,
                ),
                Text('84개')
              ],
            )),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'y01000.you',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              TextSpan(
                  text:
                      ' world! world! world! world! world! world! world! world! world!',
                  style: TextStyle(color: Colors.black)),
            ]))),
        // Container(
        //   height: 50,
        //   width: MediaQuery.of(context).size.width,
        //   color: Colors.orange,
        //   child: Center(child: Text('댓글칸')),
        // ),
        const SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
