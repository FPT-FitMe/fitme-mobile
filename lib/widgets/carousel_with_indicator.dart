import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<CarouselItem> itemList;
  const CarouselWithIndicator({Key? key, required this.itemList})
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
          items: _createCarouselItems(widget.itemList),
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
          children: widget.itemList.map(
            (url) {
              int index = widget.itemList.indexOf(url);
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

  _createCarouselItems(List<CarouselItem> carouselListItems) {
    return carouselListItems
        .map(
          (item) => Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  item.title,
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
                    item.description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
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
