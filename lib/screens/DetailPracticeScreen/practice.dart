import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/screens/DetailPracticeScreen/detail_practice_presenter.dart';
import 'package:fitme/screens/DetailPracticeScreen/detailt_practice_view.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PracticeScreen extends StatefulWidget {
  final int? workoutID;
  const PracticeScreen({Key? key, this.workoutID}) : super(key: key);

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen>
    implements DetailPracticeView {
  late DetailPracticePresenter _presenter;
  bool _isLoading = true;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late Workout? _workout;
  late int? _workoutID;

  _PracticeScreenState() {
    _presenter = new DetailPracticePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _workoutID = widget.workoutID;
    print(_workoutID);
    _presenter.loadWorkoutByID(_workoutID!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quay lại",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              // hình ảnh hiện tại chỉ mang tính chất tượng trưng
              // TODO: add to favorite list
              Icon(Icons.favorite_outline),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _isLoading == true
          ? LoadingScreen()
          : SmartRefresher(
              controller: _refreshController,
              onRefresh: refresh,
              child: Container(
                child: Column(
                  children: [
                    // hình và tiêu đề
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                            child: Image.network(
                              _workout!.imageUrl,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            _workout!.name,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //hard code
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "với " + _workout!.coachProfile!.name,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(CommunityMaterialIcons
                                      .clock_time_three_outline),
                                  Text(
                                    convertDuration(int.parse(_workout!
                                        .estimatedDuration
                                        .toString())),
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(CommunityMaterialIcons.arm_flex_outline),
                                  Text(
                                    '${_workout!.estimatedCalories} cals',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    //cac buoc tap
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: _workout!.workoutExercises.isNotEmpty
                              ? Column(children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        _workout!.workoutExercises.length,
                                    itemBuilder: (context, index) {
                                      Exercise exercise = _workout!
                                          .workoutExercises[index].exerciseID;
                                      return _smallExercise(
                                          exercise.name,
                                          exercise.imageUrl,
                                          exercise.baseRepPerRound,
                                          exercise.baseDuration);
                                    },
                                  ),
                                ])
                              : Center(
                                  child: Text("Không có bài tập nào"),
                                ),
                        ),
                      ),
                    ),
                    //nut Bat dau
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            _startExercise(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            "Bắt đầu",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void _startExercise(BuildContext ctx) {
    //truyen list bai tap nho vo trong day
    //thời gian lúc bắt đầu bài tap
    DateTime _startTime = DateTime.now();
    Navigator.pushNamed(ctx, AppRoutes.practiceSet, arguments: {
      'startTime': _startTime,
      'workout': _workout,
    });
  }

  Widget _smallExercise(
      String title, String imageUrl, int numOfDoExercise, int? duration) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
              ),
            ),
            numOfDoExercise == 1
                ? Text('${duration} giây')
                : Text('x${numOfDoExercise} lần'),
          ],
        ),
      ),
    );
  }

  @override
  void loadWorkoutDetail(Workout workout) {
    setState(() {
      _isLoading = false;
      this._workout = workout;
    });
  }

  @override
  Future<void> refresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _presenter.loadWorkoutByID(_workoutID!);
    _refreshController.refreshCompleted();
  }

  @override
  void showEmptyList() {
    setState(() {
      _isLoading = false;
    });
    _refreshController.refreshCompleted();
  }

  @override
  void showFailedModal(String message) {
    setState(() {
      _isLoading = false;
    });
    Alert(
      context: context,
      type: AlertType.error,
      title: message,
      buttons: [],
    ).show();
  }

  String convertDuration(int duration) {
    var d = Duration(minutes: duration);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')} giờ ${parts[1].padLeft(2, '0')} phút';
  }
}
