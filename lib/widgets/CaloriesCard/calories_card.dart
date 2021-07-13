import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/models/weight_log.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:fitme/widgets/CaloriesCard/calories_card_presenter.dart';
import 'package:fitme/widgets/CaloriesCard/calories_card_view.dart';
import 'package:fitme/widgets/custom_line_chart.dart';
import 'package:flutter/material.dart';

class CaloriesCard extends StatefulWidget {
  final User? user;
  const CaloriesCard({Key? key, required this.user}) : super(key: key);

  @override
  _CaloriesCardState createState() => _CaloriesCardState();
}

class _CaloriesCardState extends State<CaloriesCard>
    implements CaloriesCardView {
  late CaloriesCardPresenter _presenter;
  List<WeightLog> _listWeightLogs = [];
  bool _isLoading = true;

  _CaloriesCardState() {
    _presenter = new CaloriesCardPresenter(this);
    _presenter.loadAllWeightLog();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.fromLTRB(16, 16, 32, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide.none),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            offset: Offset.fromDirection(1, 20),
            color: Color(0xFF000A3E).withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tiến độ luyện tập",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          _isLoading
              ? LoadingScreen()
              : _listWeightLogs.isNotEmpty
                  ? Expanded(
                      child: CustomLineChart(listWeightLogs: _listWeightLogs),
                    )
                  : Container(
                      height: 200,
                      child: Center(
                        child: Text("Bạn chưa log cân nặng"),
                      ),
                    ),
          SizedBox(
            height: 10,
          ),
          !_isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Mục tiêu"),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[700],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cân nặng đã giảm"),
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  @override
  void loadAllWeightLog(List<WeightLog> listWeightLogs) {
    setState(() {
      this._listWeightLogs = listWeightLogs;
      this._isLoading = false;
    });
  }
}
