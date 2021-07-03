import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/meal_status.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/meal.dart';
import 'package:flutter/material.dart';

class DetailMealScreen extends StatefulWidget {
  DetailMealScreen({Key? key}) : super(key: key);

  @override
  _DetailMealScreenState createState() => _DetailMealScreenState();
}

class _DetailMealScreenState extends State<DetailMealScreen> {
  var isSelected = [false, false];
  bool isFavorite = false;
  late final map;
  late final id;
  late final Meal meal;

  @override
  void didChangeDependencies() {
    // TODO: should fix this
    map = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    id = map["id"];
    meal = LIST_MEAL2.where((element) => element.id == id).first;
    setState(() {
      if (meal.status == MealStatus.complete) {
        isSelected[1] = true;
      } else if (meal.status == MealStatus.skip) {
        isSelected[0] = true;
      }
    });
    super.didChangeDependencies();
  }

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
              icon: isFavorite
                  ? Icon(CommunityMaterialIcons.heart)
                  : Icon(CommunityMaterialIcons.heart_outline),
              color: isFavorite ? AppColors.primary : AppColors.grayText,
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              width: 600,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
              child: titleSection(title: meal.name),
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
              child: tagSection(meal.tag),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: timeSection(meal.duration.toString(), meal.cal.toString()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: ingredientSection(meal.ingredients),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: textSection(),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
        child: Container(
          alignment: Alignment.topCenter,
          height: 40,
          padding: EdgeInsets.all(3.5),
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: ToggleButtons(
            children: <Widget>[
              Text(
                "Bỏ qua",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Text(
                "Hoàn tất",
                style: TextStyle(fontSize: 17),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            color: AppColors.primary,
            selectedColor: Colors.white,
            fillColor: AppColors.primary,
            isSelected: isSelected,
            borderColor: AppColors.primary,
            selectedBorderColor: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(18)),
            constraints: BoxConstraints.tightFor(
              width: 100,
              height: 30,
            ),
          ),
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

Widget titleSection({title: String}) => Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
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

Widget tagSection(List<String> tagList) =>
    Builder(builder: (BuildContext context) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              tagList.map((item) => _createCustomChip(title: item)).toList());
    });

Widget timeSection(String duration, String cal) => Container(
      child: Row(
        children: [
          Icon(
            CommunityMaterialIcons.clock_time_four_outline,
            color: AppColors.textColor,
            size: 30,
          ),
          SizedBox(width: 5),
          Text(
            duration + ' phút',
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
            cal + ' cal',
            softWrap: true,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );

// FIXME: find another widget for this please

Widget ingredientSection(List<String> ingredientList) => Container(
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
            'Hạt sen và củ cây hoa lily đem rửa sạch rồi ngâm với nước khoảng 60 phút cho nở mềm rồi vớt ra để ráo và cắt nhỏ vụn. Ngâm yến mạch với nước khoảng 30 phút cho nở mềm. Cho hạt sen, củ cây hoa lily đã cắt nhỏ và yến mạch vào máy làm sữa đậu, đổ 1 lít nước vào, nhấn nút khởi động máy nấu và chờ cháo chín. Khi cháo chín thì nêm nếm sao cho vừa miệng và múc ra bát cho bé thưởng thức.',
            softWrap: true,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
