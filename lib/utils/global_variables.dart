import 'package:flutter/material.dart';
import 'package:personel_takip/screens/calculate_screen.dart';
import 'package:personel_takip/screens/workers_screen.dart';

final homeScreenItems = [
  WorkersScreen(),
  CalculateScreen(),
  Container(
    color: Colors.white,
    child: const Center(
      child: Text(
        'Geçmiş Kayıtlar',
        style: TextStyle(fontSize: 35),
      ),
    ),
  ),
];

