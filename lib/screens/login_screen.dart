import 'package:personel_takip/responsive/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:personel_takip/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 230,
                      child: const Image(
                        image: AssetImage("assets/images/anibal_logo.png"),
                      ),
                    ),
                    const Center(child: Text("Lütfen bilgilerinizi giriniz.")),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        CustomTextField(
                          label: "Email Adresiniz",
                          prefixIcon: const Icon(Icons.email),
                          textInputType: TextInputType.emailAddress,
                          textEditingController: _emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          label: "Şifreniz",
                          prefixIcon: const Icon(Icons.lock),
                          textInputType: TextInputType.visiblePassword,
                          IsPass: true,
                          textEditingController: _passwordController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                            ),
                            onPressed: loginUser,
                            child: const Text("Giriş Yap!")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
