import 'package:first_flutter_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserModel>(context, listen: true).userData;
    return userData != null
        ? Text('${userData.userId} ${userData.userName}')
        : const Text("No user signed in");
  }
}
