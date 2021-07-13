import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/tag.dart';
import 'package:flutter/material.dart';

import 'package:fitme/models/post.dart';

import 'package:fitme/constants/colors.dart';

class TitleArticlePost extends StatelessWidget {
  final List<Post> listPost;
  final String title;

  const TitleArticlePost({required this.title, required this.listPost});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => _viewAllArticle(context),
                  child: Text(
                    "Hiện tất cả",
                    style: TextStyle(fontSize: 10, color: AppColors.grayText),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              ...listPost.map((post) {
                return Flexible(
                    fit: FlexFit.tight,
                    child: _cardArticle(context, post.postID, post.imageUrl,
                        true, post.name, post.readingTime));
              }),
            ],
          ),
        ],
      ),
    );
  }

  // chuyen qua trang detail cua meal
  void _selectArticle(BuildContext ctx, int? id, List<Post> listPost) {
    Navigator.pushNamed(ctx, AppRoutes.detailMeal, arguments: {
      'id': id,
      'listPost': listPost,
    });
  }

// chuyen qua trang viewAll
  void _viewAllArticle(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AppRoutes.viewAll, arguments: {
      'list_post': listPost,
    });
  }

  Widget _cardArticle(BuildContext context, int? id, String imageUrl,
      bool isPremium, String name, int duration) {
    return GestureDetector(
      onTap: () => _selectArticle(context, id, listPost),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    imageUrl,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                Text(
                  '$duration phút',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black38,
                  ),
                ),
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}
