import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<String> imageList;
  const CarouselWithIndicator({Key? key, required this.imageList})
      : super(key: key);

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _createCarouselItems(widget.imageList),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.6,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageList.map(
            (url) {
              int index = widget.imageList.indexOf(url);
              return Container(
                width: 12.0,
                height: 8.0,
                margin: EdgeInsets.fromLTRB(2, 40, 2, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? AppColors.primary
                      : AppColors.textColor.withOpacity(0.4),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  _createCarouselItems(List<String> listImages) {
    return listImages
        .map(
          (item) => Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Luyện tập hiệu quả hơn",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
