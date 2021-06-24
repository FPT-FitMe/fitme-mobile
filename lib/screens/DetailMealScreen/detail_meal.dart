import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:flutter/material.dart';

class DetailMealScreen extends StatefulWidget {
  DetailMealScreen({Key? key}) : super(key: key);

  @override
  _DetailMealScreenState createState() => _DetailMealScreenState();
}

class _DetailMealScreenState extends State<DetailMealScreen> {
  Color _favIconColor = Colors.black;
  Color _leftBtnColor = Colors.black12;
  Color _rightBtnColor = Colors.black12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          "Quay lại",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            color: _favIconColor,
            icon: const Icon(
              CommunityMaterialIcons.heart_outline,
            ),
            onPressed: () {
              setState(() {
                if (_favIconColor == Colors.black) {
                  _favIconColor = AppColors.primary;
                } else {
                  _favIconColor = Colors.black;
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1496412705862-e0088f16f791?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
              fit: BoxFit.cover,
              width: 600,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
              child: titleSection(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: GestureDetector(
                child: authorSection(),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.coachDetail);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: tagSection(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: timeSection(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: ingredientSection(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: textSection(),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 40,
                padding: EdgeInsets.all(3.5),
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: _leftBtnColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      topLeft: Radius.circular(25))),
                              child: Text("Bỏ qua",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 17,
                                  )),
                            ))),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Container(color: Colors.black26, width: 1)),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                if (_rightBtnColor == Colors.black12) {
                                  _rightBtnColor = AppColors.primary;
                                } else {
                                  _rightBtnColor = Colors.black12;
                                }
                              });
                              // TODO : backend logic code here
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: _rightBtnColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              alignment: Alignment.center,
                              child: Text("Hoàn tất",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 17)),
                            )))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

Widget authorSection() => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/0f/56/51/0f56511d7e416da63782dd0cc73816f1.png'),
            radius: 22,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Công thức viết bởi"),
              SizedBox(
                height: 5,
              ),
              Text("Lalisa Monoban",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );

Widget titleSection() => Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Cháo yến mạch trái cây",
        softWrap: true,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );

Widget _createCustomChip({title: String}) => Chip(
      label: Text(title),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grayText, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
    );

Widget tagSection() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _createCustomChip(title: "Sáng"),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'Ít carb'),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'Trái cây'),
        SizedBox(
          width: 10,
        ),
      ],
    );

Widget timeSection() => Container(
      child: Row(
        children: [
          Icon(
            CommunityMaterialIcons.clock_time_four_outline,
            color: AppColors.textColor,
            size: 30,
          ),
          SizedBox(width: 5),
          Text(
            '15 phút',
            softWrap: true,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            CommunityMaterialIcons.bread_slice_outline,
            color: AppColors.textColor,
            size: 30,
          ),
          SizedBox(width: 5),
          Text(
            '150 kcals',
            softWrap: true,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );

// FIXME: find another widget for this please
Widget ingredientSection() => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Align(
              alignment: Alignment(-1.25, 0),
              child: Text(
                'Nguyên liệu cho 1 phần',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ListTile(
            title: Align(
              alignment: Alignment(-1.1, 0),
              child: Text(
                'Chuối',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            trailing: Text('50g'),
          ),
          Divider(),
          ListTile(
            title: Align(
              alignment: Alignment(-1.08, 0),
              child: Text(
                'Bơ',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            trailing: Text('100g'),
          ),
          Divider(),
        ],
      ),
    );

Widget textSection() => Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cách làm",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            softWrap: true,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
