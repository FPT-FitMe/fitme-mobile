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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
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
                      ),
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
                      ),
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
                      ),
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
                      ),
                      validator: RequiredValidator(errorText: "* Bắt buộc"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Xác nhận mật khẩu",
                      ),
                      validator: RequiredValidator(errorText: "* Bắt buộc"),
                    ),
                    SizedBox(
                      height: 35,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
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
                Navigator.pushNamed(context, '/login');
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
  void registerFail() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void registerSuccess() {
    Fluttertoast.showToast(msg: "Thành công");
    setState(() {
      _isLoading = false;
    });
    Navigator.pushNamed(context, '/newUserInfo');
    // TODO: navigate sang home va xoa stack
  }

  void submitForm() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _lastNameController.text;
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _presenter
          .register(new User(email: email, password: password, name: name));
    }
  }
}
