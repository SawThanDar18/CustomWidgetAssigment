import 'package:custom_widget_assignment/resources/colors.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GRADIENT_START_COLOR,
        title: const Text(
            "Account Page"
        ),
      ),
    );
  }
}
