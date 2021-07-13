import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/PaymentScreen/payment_presenter.dart';
import 'package:fitme/screens/PaymentScreen/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> implements PaymentView {
  late PaymentPresenter _presenter;

  _PaymentScreenState() {
    _presenter = new PaymentPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "FitMe PRO",
          style: TextStyle(color: AppColors.primary),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              "assets/images/pro_image.svg",
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    CommunityMaterialIcons.checkbox_marked_circle,
                    color: AppColors.green500,
                  ),
                  title: Text(
                    '100+ công thức tốt cho sức khỏe',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    CommunityMaterialIcons.checkbox_marked_circle,
                    color: AppColors.green500,
                  ),
                  title: Text('Bữa ăn dành riêng cho bạn'),
                ),
                ListTile(
                  leading: Icon(
                    CommunityMaterialIcons.checkbox_marked_circle,
                    color: AppColors.green500,
                  ),
                  title: Text(
                      '50+ bài tập nâng cao từ những huấn luyện viên chuyên nghiệp'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  _presenter.buySubscription();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Thanh toán",
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
    );
  }

  @override
  void success() async {
    Fluttertoast.showToast(msg: "Bạn giờ đã là thành viên pro");
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.mainScreen, (route) => false);
  }
}
