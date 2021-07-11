import 'package:fitme/models/user.dart';
import 'package:fitme/screens/AccountDetailScreen/account_detail_presenter.dart';
import 'package:fitme/screens/AccountDetailScreen/account_detail_view.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AccountDetailScreen extends StatefulWidget {
  @override
  _AccountDetailScreenState createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen>
    implements AccountDetailView {
  final _formKey = GlobalKey<FormState>();
  late AccountDetailPresenter _presenter;
  bool _isUploadingImage = false;
  bool _isLoading = true;
  String? _imageUrl;
  User? user;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  _AccountDetailScreenState() {
    _presenter = new AccountDetailPresenter(this);
    _presenter.loadUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hồ sơ người dùng",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: user == null
          ? LoadingScreen()
          : Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _showImagePicker();
                        },
                        child: CircleAvatar(
                          radius: 40,
                          child: _imageUrl != null
                              ? null
                              : _isUploadingImage
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    )
                                  : Icon(Icons.add_a_photo),
                          backgroundImage: _imageUrl != null
                              ? NetworkImage(_imageUrl.toString())
                              : null,
                        ),
                      ),
                    ),
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
                            readOnly: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Bắt buộc"),
                              EmailValidator(errorText: "Email không hợp lệ")
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            autofocus: true,
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "Số điện thoại",
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
                            validator:
                                RequiredValidator(errorText: "* Bắt buộc"),
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
                            validator: (val) => MatchValidator(
                                    errorText: "Mật khẩu không trùng khớp")
                                .validateMatch(
                                    val.toString(), _passwordController.text),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18),
        child: SizedBox(
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
                    "Cập nhật thông tin",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate() && _isLoading == false) {
      setState(() {
        _isLoading = true;
      });
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String phone = _phoneController.text;
      User updatedUser = User(
        userID: user!.userID,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        traineeFavoriteMeals: user!.traineeFavoriteMeals,
        traineeFavoriteWorkouts: user!.traineeFavoriteWorkouts,
        age: user!.age,
        dietPreferenceType: user!.dietPreferenceType,
        exerciseFrequencyType: user!.exerciseFrequencyType,
        gender: user!.gender,
        height: user!.height,
        isPremium: user!.isPremium,
        phone: phone,
        profileImageUrl: _imageUrl,
        role: user!.role,
        workoutIntensity: user!.workoutIntensity,
      );
      _presenter.updateUser(updatedUser);
    }
  }

  void _showImagePicker() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _isUploadingImage = true;
      });
      _presenter.uploadImage(image.path);
      _isLoading = true;
    }
  }

  @override
  void loadUser(User user) {
    setState(() {
      this.user = user;
      _isLoading = false;
    });
    _firstNameController.text = user.firstName;
    _lastNameController.text = user.lastName;
    _emailController.text = user.email;
    _phoneController.text = user.phone!;
    _imageUrl = user.profileImageUrl;
  }

  @override
  void showFailedModal(String message) {
    setState(() {
      _isLoading = false;
      _isUploadingImage = false;
    });
    Alert(
      context: context,
      type: AlertType.error,
      title: message,
      buttons: [],
    ).show();
  }

  @override
  void showSuccessModal(User updatedUser, String message) {
    setState(() {
      _isLoading = false;
      _isUploadingImage = false;
    });
    Alert(
      context: context,
      type: AlertType.success,
      title: message,
      buttons: [],
    ).show();
  }

  @override
  void updateImageUrl(String imageUrl) {
    setState(() {
      _isUploadingImage = false;
      _imageUrl = imageUrl;
      _isLoading = false;
    });
  }
}
