import 'package:personel_takip/resources/auth_methods.dart';
import 'package:personel_takip/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personel_takip/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/global_variables.dart';
import '../utils/utils.dart';

class AccManagementScreen extends StatefulWidget {
  ChooseManage selectedManage;
  final uid;
  AccManagementScreen(
      {Key? key, required this.selectedManage, required this.uid})
      : super(key: key);

  @override
  State<AccManagementScreen> createState() => AccManagementScreenState();
}

class AccManagementScreenState extends State<AccManagementScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var userData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            chooseWidget(),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                  onPressed: chooseButtonAction,
                  child: const Text("Değiştir!")),
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  chooseWidget() {
    if (widget.selectedManage == ChooseManage.Mail) {
      return mailColumn();
    } else if (widget.selectedManage == ChooseManage.Password) {
      return passwordColumn();
    }
  }

  chooseButtonAction() async {
    if (widget.selectedManage == ChooseManage.Mail) {
      AuthMethods().updateMail(_emailController.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('email');
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginScreen()),
        ModalRoute.withName('/'),
      );
    } else if (widget.selectedManage == ChooseManage.Password) {
      AuthMethods().updatePassword(_passwordController.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('email');
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginScreen()),
        ModalRoute.withName('/'),
      );
    }
  }

  Column mailColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "E-Posta Yönetim",
          style: TextStyle(fontSize: 28, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
            label: "Yeni Email Adresiniz",
            prefixIcon: Icon(Icons.mail),
            textInputType: TextInputType.emailAddress,
            IsPass: false,
            textEditingController: _emailController),
      ],
    );
  }

  Column passwordColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Şifre Yönetimi",
          style: TextStyle(fontSize: 28, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          label: "Şifreniz",
          prefixIcon: Icon(Icons.password),
          textInputType: TextInputType.visiblePassword,
          IsPass: true,
          textEditingController: _passwordController,
        ),
      ],
    );
  }
}
