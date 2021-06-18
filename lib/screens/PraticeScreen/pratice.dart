import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:fitme/widgets/title_article.dart';

class PraticeScreen extends StatefulWidget {
  PraticeScreen({Key? key}) : super(key: key);

  @override
  _PraticeScreenState createState() => _PraticeScreenState();
}

class _PraticeScreenState extends State<PraticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.bookmark_border),
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          "Tập luyện",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        // Action để search
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // Search ???
            },
          ),
        ],
        shadowColor: Colors.transparent, // làm mờ cái line dưới app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselPage(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleArticle(
                  title: "Huấn luyện viên",
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CoachAvatar(
                        coachName: 'Lalisa',
                        tagName: 'Boxing, Thể hình',
                        imgURL:
                            'https://biographymask.com/wp-content/uploads/2020/03/Blackpinks-Lisa-Manoban.jpg',
                      ),
                      CoachAvatar(
                          coachName: 'Rose',
                          tagName: 'Yoga, Thể hình',
                          imgURL:
                              'https://media-cdn.laodong.vn/storage/newsportal/2021/3/24/892486/Rose-Blackpink-Sinh-.jpg?w=720&crop=auto&scale=both'),
                      CoachAvatar(
                        coachName: 'Ariana Grande',
                        tagName: 'Boxing, Thể hình',
                        imgURL:
                            'https://pbs.twimg.com/profile_images/1385463321789452288/trz65E6m.jpg',
                      ),
                    ]),
                TitleArticle(
                  title: "Loại hình",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: tagSection(),
                ),
                TitleArticle(
                  title: "Bài tập",
                ),
                TitleArticle(
                  title: "Bài viết",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoachAvatar extends StatelessWidget {
  final String coachName;
  final String tagName;
  final String imgURL;

  const CoachAvatar(
      {required this.coachName, required this.tagName, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgURL),
            radius: 45,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            coachName,
            style: TextStyle(
              color: Color(0xff263238),
              fontSize: 10,
              fontFamily: "SF Pro Display",
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            tagName,
            style: TextStyle(
              color: Color(0xff5e5e5e),
              fontSize: 8,
              fontFamily: "SF Pro Display",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.red[200]),
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}

Widget _createCustomChip({title: String}) => Chip(
      label: Text(title),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grayText, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    );

Widget tagSection() => Row(
      children: [
        _createCustomChip(title: "Yoga"),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'Thể hình'),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'TDNĐ'),
        SizedBox(
          width: 10,
        ),
      ],
    );
