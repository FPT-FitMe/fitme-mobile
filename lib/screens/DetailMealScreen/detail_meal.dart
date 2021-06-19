import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailMealScreen extends StatelessWidget {
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
              child: authorSection(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: tagSection(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: timeSection(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ingredientSection(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: textSection(),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget authorSection() => Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              children: [
                Text("Công thức viết bởi"),
                SizedBox(height: 5.0),
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
            SizedBox(width: 10),
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
            SizedBox(width: 10),
            Text(
              '15 phút',
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(width: 10),
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
}
