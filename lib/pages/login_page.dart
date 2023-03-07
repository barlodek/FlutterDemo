import 'package:first_flutter_app/providers/user_provider.dart';
import 'package:first_flutter_app/widgets/button.dart';
import 'package:first_flutter_app/widgets/custom_text_field.dart';
import 'package:first_flutter_app/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required String title}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (context, userModel, child) {
      return _LoginPageWithProvider(title: _title, userModel: userModel);
    });
  }
}

class _LoginPageWithProvider extends StatefulWidget {
  const _LoginPageWithProvider({super.key, required title, required userModel})
      : _title = title,
        _userModel = userModel;

  final String _title;
  final UserModel _userModel;

  @override
  State<_LoginPageWithProvider> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPageWithProvider> {
  String _login = "";
  String _password = "";

  void onLoginChanged(String login) {
    setState(() {
      _login = login;
    });
  }

  void onPasswordChanged(String password) {
    setState(() {
      _password = password;
    });
  }

  void onSignInPressed() {
    widget._userModel.userData = UserData(userId: "123asd", userName: _login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UserInfo(),
                CustomTextField(
                  label: "login",
                  onChanged: onLoginChanged,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                ),
                CustomTextField(
                  label: "password",
                  onChanged: onPasswordChanged,
                  secured: true,
                ),
                Button(
                  label: 'Login',
                  onPressed: onSignInPressed,
                )
              ],
            ),
          ),
        ));
  }
}
