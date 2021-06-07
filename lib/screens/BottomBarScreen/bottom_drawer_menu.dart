import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomDrawer extends StatefulWidget {
  @override
  _BottomDrawerState createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {

  int currentPageIndex = 0;
  int currentActivityType = 0;
  late List<Widget> pages;

  final runningActivityType = 1;

  final TextStyle titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold
  );

  final TextStyle tabBarTitleStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600
  );

  final TextStyle listItemStyle = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w600
  );

  _onCreateLogItemTapped(int activityType) {

  }

  @override
  void initState() {
    pages = [
      _getMenuPage(),
      _getCreateForm(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (currentActivityType != 0) {
      pages[1] = _getCreateLogForm();
    }
    return pages[currentPageIndex];
  }

  Widget _getMenuPage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          children: [
            //Hinh chu nhat xam
            Text("Thêm vào nhật ký", style: titleStyle,),
            SizedBox(height: 30,),
            TabBar(
              tabs: [
                Tab(child: Text("HOẠT ĐỘNG", style: tabBarTitleStyle)),
                Tab(text: "Chạy bộ",),
                Tab(text: "Chạy bộ",),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: TabBarView(
                children: [
                  _getActivityList(),
                  Text('cc'),
                  Text('cc')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCreateForm() {
    return Container(

    );
  }
  
  Widget _getActivityList() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _getActivityItem("activity_running.png", "Chạy bộ", runningActivityType),
          _getActivityItem("activity_cycling.png", "Đạp xe", 0),
          _getActivityItem("activity_yoga.png", "Yoga", 0)
        ],
      ),
    );
  }

  Widget _getActivityItem(String imageFilename, String title, int activityType) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            child: Image.asset("assets/images/$imageFilename", fit: BoxFit.contain,),
          ),
          Text(title, style: listItemStyle,),
          SizedBox(width: 90),
          IconButton(
              onPressed: _onCreateLogItemTapped(activityType),
              icon: Icon(Icons.arrow_forward_ios)
          )
        ],
      ),
    );
  }

}