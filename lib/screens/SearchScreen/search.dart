import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../fake_data.dart';

class SearchScreen extends StatelessWidget {
  final bool isEx = true;
  final bool isMeal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _showFavorite(context);
            },
            icon: Icon(Icons.bookmark_outline),
          ),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(isEx, isMeal));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  void _showFavorite(BuildContext context) {
    
  }
}

class Search extends SearchDelegate {
  final bool isEx;
  final bool isMeal;
  //result

  Search(this.isEx, this.isMeal);

  @override
  String? get searchFieldLabel => "Bạn đang tìm kiếm gì?";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Exercise> exercistList = [];
    List<Meal> mealList = [];
    //cai nay dang le lam trong api
    isEx
        ? exercistList.addAll(
            LIST_EXERCISE.where((element) => element.name.contains(query)))
        : mealList
            .addAll(LIST_MEAL.where((element) => element.name.contains(query)));
    return isEx //neu nhu la ex thi list ex
        ? (exercistList.isEmpty
            ? _buildNotFoundScreen()
            : ListView(
                children: exercistList
                    .map((meal) => _cardTitle(meal.name, meal.imageUrl,
                        meal.duration, meal.cal, context, meal.id))
                    .toList(),
              ))
        : (mealList.isEmpty
            ? _buildNotFoundScreen()
            : ListView(
                children: mealList
                    .map((meal) => _cardTitle(meal.name, meal.imageUrl,
                        meal.duration, meal.cal, context, meal.id))
                    .toList(),
              ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [],
    );
  }

  _buildNotFoundScreen() {
    print("not found");
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/images/no_data.svg",
            fit: BoxFit.cover,
            height: 250,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Không tìm thấy thông tin",
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  Widget _cardTitle(String title, String imageUrl, int duration, int cal,
      BuildContext context, int id) {
    return InkWell(
      onTap: () => _selectArticle(context, id),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            imageUrl,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '$duration phút - $cal kcals',
        ),
      ),
    );
  }

  void _selectArticle(BuildContext ctx, int id) {}
}
