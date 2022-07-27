import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:personel_takip/resources/auth_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen.dart';
import '../utils/global_variables.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            // onDisplayModeChanged: (mode) {
            //   print(mode);
            // },
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
            ),
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child:
                        Image(image: AssetImage("assets/images/anibal_logo.png")),
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'www.muratturk.org',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Personeller',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.supervisor_account),
                // badgeContent: const Text(
                //   '3',
                //   style: TextStyle(color: Colors.white),
                // ),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Ücret Hesapla',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.calculate),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Geçmiş Kayıtlar',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.history),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Hesap Bilgilerim',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.person),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Exit',
                onTap: () async {
                 AuthMethods().signOut();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('email');
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => LoginScreen()));
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
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
