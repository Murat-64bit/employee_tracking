import 'package:personel_takip/resources/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:personel_takip/screens/acc_management_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/global_variables.dart';
import 'login_screen.dart';

class AccInfoScreen extends StatelessWidget {
  final uid;
  AccInfoScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hesap Bilgilerim"),
          backgroundColor: Colors.grey.shade400,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('E-Posta Yönetimi'),
                  trailing: Icon(Icons.arrow_right_rounded),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => AccManagementScreen(
                              selectedManage: ChooseManage.Mail,
                              uid: uid,
                            )));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.password),
                  title: Text('Şifre Yönetimi'),
                  trailing: Icon(Icons.arrow_right_rounded),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => AccManagementScreen(
                              selectedManage: ChooseManage.Password,
                              uid: uid,
                            )));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
