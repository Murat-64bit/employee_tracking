import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personel_takip/resources/auth_methods.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen.dart';
import '../screens/signin_screen.dart';
import '../utils/global_variables.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();
  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<PlutoMenuItem> getMenus(BuildContext context) {
    return [
      PlutoMenuItem(
        title: 'Personeller',
        icon: Icons.supervisor_account,
        onTap: () => page.jumpToPage(0),
      ),
      PlutoMenuItem(
        title: 'Geçmiş ve Ücretlendirme',
        icon: Icons.calculate,
        onTap: () => page.jumpToPage(1),
      ),
      PlutoMenuItem(
        title: 'Hesap Bilgilerim',
        onTap: () => page.jumpToPage(2),
        icon: Icons.person,
      ),
      PlutoMenuItem(
        title: 'Çıkış',
        icon: Icons.exit_to_app,
        onTap: () async {
          AuthMethods().signOut();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('email');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => SignInScreen()));
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 75,
            child: Expanded(
              child: PlutoMenuBar(
                backgroundColor: Color.fromARGB(255, 50, 54, 69),
                activatedColor: Colors.grey,
                unselectedColor: Color.fromARGB(255, 50, 54, 69),
                indicatorColor: Colors.white,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                height: 65,
                menuIconColor: Colors.white,
                menuIconSize: 26,
                moreIconColor: Colors.white,
                menus: getMenus(context),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: homeScreenItems,
            ),
          ),
        ],
      ),
    );
  }
}
