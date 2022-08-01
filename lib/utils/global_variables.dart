import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personel_takip/screens/acc_info_screen.dart';
import 'package:personel_takip/screens/calculate_screen.dart';
import 'package:personel_takip/screens/history_screen.dart';
import 'package:personel_takip/screens/personal_manage_screen.dart';
import 'package:personel_takip/screens/workers_screen.dart';

final homeScreenItems = [
  PersonalManage(),
  CalculateScreen(),
  AccInfoScreen(uid: FirebaseAuth.instance.currentUser!.uid),
];

enum ChooseManage { Mail, Password }


