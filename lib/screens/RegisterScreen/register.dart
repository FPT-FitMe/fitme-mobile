import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/screens/RegisterScreen/register_presenter.dart';
import 'package:fitme/screens/RegisterScreen/register_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:fitme/constants/colors.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterView {
  final _formKey = GlobalKey<FormState>();
  late RegisterPresenter _presenter;
  bool _isLoading = false;
  String _errorMessage = "";
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  _RegisterScreenState() {
    _presenter = new RegisterPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Đăng ký",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Nhanh chóng và dễ dàng",
                  style: TextStyle(fontSize: 20, color: AppColors.grayText)),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: _firstNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Họ",
                          hintText: "*",
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Colors.red)),
                      validator: MultiValidator([
                        MaxLengthValidator(20,
                            errorText: "Họ không được dài quá 20 kí tự"),
                        RequiredValidator(errorText: "* Bắt buộc")
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: _lastNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Tên",
                          hintText: "*",
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Colors.red)),
                      validator: MultiValidator([
                        MaxLengthValidator(30,
                            errorText: "Tên không được dài quá 30 kí tự"),
                        RequiredValidator(errorText: "* Bắt buộc")
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "*",
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Colors.red)),
                      validator: MultiValidator(
                          [RequiredValidator(errorText: "* Bắt buộc")]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          hintText: "*",
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Colors.red)),
                      validator: RequiredValidator(errorText: "* Bắt buộc"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Xác nhận mật khẩu",
                      ),
                      validator: (val) =>
                          MatchValidator(errorText: "Mật khẩu không trùng khớp")
                              .validateMatch(
                                  val.toString(), _passwordController.text),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
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
                                "Đăng ký",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bạn đã là thành viên của FitMe ?",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              child: Text(
                " Đăng nhập tại đây",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void registerFail(errorMessage) {
    setState(() {
      _isLoading = false;
      _errorMessage = errorMessage;
    });
  }

  @override
  void registerSuccess(user) {
    Fluttertoast.showToast(msg: "Thành công");
    setState(() {
      _isLoading = false;
    });
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.newUserInfo, (routes) => false,
        arguments: {
          'user': user,
        });
  }

  void submitForm() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _presenter.register(email, password, firstName, lastName);
    }
  }
}
