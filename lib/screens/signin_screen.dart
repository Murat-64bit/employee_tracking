// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personel_takip/widgets/custom_textfield2.dart';
import 'package:personel_takip/widgets/custom_button2.dart';
import 'package:personel_takip/widgets/cutom_image.dart';
import 'package:personel_takip/widgets/text_widget.dart';
import 'package:personel_takip/widgets/wsized.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/auth_methods.dart';
import '../responsive/main_layout.dart';
import '../utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loginUser() async {
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', _emailController.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => MyHomePage()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
            color: const Color.fromARGB(255, 40, 42, 57),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Image(image: AssetImage("assets/images/anibal_logo.png")),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                      WSizedBox(wval: 0.1, hval: 0),
                    ],
                  ),
                  WSizedBox(wval: 0, hval: 0.2),
                  Row(
                    children: [
                      WSizedBox(wval: 0.05, hval: 0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WSizedBox(wval: 0, hval: 0.02),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextWidget(
                                text: 'Hesabınıza Giriş Yapınız.',
                                textcolor: Colors.white,
                                textsize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                height: 10,
                                width: 10,
                              ),
                            ],
                          ),
                          WSizedBox(wval: 0, hval: 0.03),
                          WSizedBox(wval: 0, hval: 0.03),
                          CustomTextField(
                              borderradius: 20,
                              bordercolor: Color.fromARGB(255, 50, 54, 69),
                              widh: 0.32,
                              height: 0.05,
                              icon: Icons.mail,
                              iconColor: Colors.grey,
                              controller: _emailController,
                              hinttext: 'email',
                              hintColor: Colors.grey,
                              fontsize: 15,
                              obscureText: false),
                          WSizedBox(wval: 0, hval: 0.02),
                          CustomTextField(
                              borderradius: 20,
                              bordercolor: Color.fromARGB(255, 50, 54, 69),
                              widh: 0.32,
                              height: 0.05,
                              icon: Icons.lock,
                              controller: _passwordController,
                              iconColor: Colors.grey,
                              hinttext: 'password',
                              hintColor: Colors.grey,
                              fontsize: 15,
                              obscureText: true),
                          WSizedBox(wval: 0, hval: 0.04),
                          CustomButton(
                            buttontext: 'Hesabıma giriş yap',
                            width: 0.32,
                            height: 0.05,
                            bordercolor: Color.fromARGB(255, 29, 144, 244),
                            borderradius: 25,
                            fontsize: 12,
                            fontweight: FontWeight.bold,
                            fontcolor: Colors.white,
                            onPressed: loginUser,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
          const CustomImageWidget(
            height: 1,
            width: 0.5,
            imgpath: 'assets/images/bg.png',
          ),
        ],
      ),
    );
  }
}
