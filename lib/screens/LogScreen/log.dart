import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/workout_log_old.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({Key? key}) : super(key: key);

  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  DateFormat timeFormatter = DateFormat('HH:mm');
  int _selectedIndex = 0;
  List<WorkoutLog> workoutLogList = listWorkoutLog;
  List<MealLog> mealLogList = listMealLog;

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
        // FIXME: change date will empty workout data
        workoutLogList = [];
      });
  }

  void _onScreenItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildNotFoundScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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

  _buildWorkoutLogList() {
    if (workoutLogList.isEmpty) {
      return _buildNotFoundScreen();
    }
    return ListView.builder(
      itemCount: workoutLogList.length,
      itemBuilder: (context, index) {
        final item = workoutLogList[index];
        return ListTile(
          title: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(item.exercise.name),
          ),
          subtitle: Text(
            timeFormatter.format(item.date),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.exercise.imageUrl,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
          trailing: Text(
            "-${item.exercise.cal.toString()} kcals",
            style: TextStyle(color: AppColors.green500),
          ),
        );
      },
    );
  }

  _buildMealLogList() {
    return ListView.builder(
      itemCount: mealLogList.length,
      itemBuilder: (context, index) {
        final item = mealLogList[index];
        return ListTile(
          title: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(item.meal.name),
          ),
          subtitle: Text(
            timeFormatter.format(item.date),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.meal.imageUrl,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
          trailing: Text(
            "+${item.meal.cal.toString()} kcals",
            style: TextStyle(color: AppColors.primary),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Text("Thống kê chi tiết",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textColor,
                )),
            Text(
              formatter.format(selectedDate),
              style: TextStyle(
                fontSize: 14,
                color: AppColors.grayText,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(CommunityMaterialIcons.calendar_month_outline),
            onPressed: () {
              _selectDate();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.arm_flex_outline),
            activeIcon: Icon(CommunityMaterialIcons.arm_flex),
            label: 'Tập luyện',
          ),
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.pot_steam_outline),
            activeIcon: Icon(CommunityMaterialIcons.pot_steam),
            label: 'Bữa ăn',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: AppColors.textColor,
        type: BottomNavigationBarType.fixed,
        onTap: _onScreenItemTapped,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child:
            _selectedIndex == 0 ? _buildWorkoutLogList() : _buildMealLogList(),
      ),
    );
  }
}
