import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/LoginScreen/login_presenter.dart';
import 'package:fitme/screens/LoginScreen/login_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView {
  final _formKey = GlobalKey<FormState>();
  late LoginPresenter _presenter;
  String _errorMessage = "";
  bool _isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _LoginScreenState() {
    _presenter = new LoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bạn chưa có tài khoản ? ",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
              child: Text(
                "Đăng ký tại đây",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "assets/images/fitme_icon_transparent.png",
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Text("Xin chào",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Vui lòng đăng nhập để tiếp tục",
                  style: TextStyle(fontSize: 18, color: AppColors.grayText)),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      validator: MultiValidator([
                        EmailValidator(errorText: "Email không hợp lệ"),
                        RequiredValidator(errorText: "* Bắt buộc")
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      validator: RequiredValidator(errorText: "* Bắt buộc"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Quên mật khẩu",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(
                          color: AppColors.red500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          submitForm();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: _isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                              )
                            : Text(
                                "Đăng nhập",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void loginFail(errorMessage) {
    setState(() {
      _isLoading = false;
      _errorMessage = errorMessage;
    });
  }

  @override
  void loginSuccess(user) {
    Fluttertoast.showToast(msg: "Đăng nhập thành công");
    setState(() {
      _isLoading = false;
    });
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.mainScreen, (route) => false);
  }

  void submitForm() {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _presenter.login(email, password);
    }
  }
}
