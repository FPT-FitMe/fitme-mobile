import 'package:fitme/screens/BottomBarScreen/bottom_drawer_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomDrawer extends StatefulWidget {
  final int? activityType;
  final int? tabIndex;
  final bool? isToday;

  @override
  _BottomDrawerState createState() => _BottomDrawerState();

  const BottomDrawer({Key? key, this.activityType, this.tabIndex, this.isToday})
      : super(key: key);
}

class _BottomDrawerState extends State<BottomDrawer> {
  int currentPageIndex = 0;
  int currentActivityType = 0;
  late List<Widget> pages;
  late Map<int, List<String>> activityMap;

  static const runningActivityType = 1;
  static const cyclingActivityType = 2;

  final TextStyle titleStyle =
      TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

  final TextStyle tabBarTitleStyle = TextStyle(
      color: Colors.black12, fontSize: 16, fontWeight: FontWeight.w600);

  final TextStyle listItemStyle =
      TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600);

  _onCreateLogItemTapped(int activityType) {
    setState(() {
      currentPageIndex = 1;
      currentActivityType = activityType;
    });
  }

  _onBackButtonTapped() {
    setState(() {
      currentPageIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.activityType != null && widget.activityType != 0) {
      currentActivityType = widget.activityType!;
      currentPageIndex = 1;
    }

    setState(() {
      activityMap = {
        runningActivityType: ["Chạy bộ", "activity_running.png"],
        cyclingActivityType: ["Đạp xe", "activity_cycling.png"],
      };

      pages = [_getMenuPage(), Container()];
    });
    if (currentActivityType != 0) {
      pages[1] = _getCreateLogPage();
    }
    return pages[currentPageIndex];
  }

  Widget _getMenuPage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DefaultTabController(
        length: 1,
        initialIndex: widget.tabIndex != null ? widget.tabIndex! : 0,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 30,
              height: 8,
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    // <--- use this
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Thêm vào nhật ký",
              style: titleStyle,
            ),
            SizedBox(
              height: 30,
            ),
            TabBar(
              tabs: [
                // Tab(text: "HOẠT ĐỘNG"),
                // Tab(text: "BỮA ĂN"),
                Tab(text: "CÂN NẶNG"),
              ],
              indicatorWeight: 5,
              labelColor: Colors.black,
              labelStyle: tabBarTitleStyle,
              unselectedLabelStyle: tabBarTitleStyle,
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: TabBarView(
                children: [
                  // _getActivityList(),
                  // _getLogMealTabBarView(),
                  _getWeightLogTabBarView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCreateLogPage() {
    Widget currentForm = Container();
    bool hideInputDate = false;
    if (widget.isToday != null) {
      hideInputDate = widget.isToday!;
    }
    switch (currentActivityType) {
      case runningActivityType:
        currentForm = ActivityLogForm(
          hasDistanceField: true,
          showInputDate: !hideInputDate,
        );
        break;
      case cyclingActivityType:
        currentForm = ActivityLogForm(
          hasDistanceField: true,
          showInputDate: !hideInputDate,
        );
        break;
    }
    return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: _getCreateLogForm(activityMap[currentActivityType]![0],
            activityMap[currentActivityType]![1], currentForm));
  }

  Widget _getActivityList() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          _getActivityItem(activityMap[runningActivityType]![0],
              activityMap[runningActivityType]![1], runningActivityType),
          _getActivityItem(activityMap[cyclingActivityType]![0],
              activityMap[cyclingActivityType]![1], cyclingActivityType),
        ],
      ),
    );
  }

  Widget _getActivityItem(
      String title, String imageFilename, int activityType) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: TextButton(
          onPressed: () => _onCreateLogItemTapped(activityType),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  "assets/images/diary/$imageFilename",
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                title,
                style: listItemStyle,
              ),
              SizedBox(width: 90),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              )
            ],
          ),
        ));
  }

  Widget _getWeightLogTabBarView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Cân nặng của bạn hôm nay?",
          style: titleStyle,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: WeightLogForm(),
        )
      ],
    );
  }

  Widget _getLogMealTabBarView() {
    bool hideInputDate = false;
    if (widget.isToday != null) {
      hideInputDate = widget.isToday!;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: MealLogForm(
          showInputDate: !hideInputDate,
        ),
      ),
    );
  }

  Widget _getCreateLogForm(String? title, String? imageFileName, Widget form) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 30,
          height: 8,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.black12,
              shape: RoundedRectangleBorder(
                // <--- use this
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: _onBackButtonTapped,
                icon: Icon(Icons.arrow_back_ios)),
            Text(
              title!,
              style: titleStyle,
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 85,
            child: Image.asset(
              "assets/images/diary/$imageFileName",
              fit: BoxFit.contain,
            )),
        Padding(
          padding: EdgeInsets.all(20),
          child: form,
        )
      ],
    );
  }
}
