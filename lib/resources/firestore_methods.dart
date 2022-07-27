import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personel_takip/models/history.dart';
import 'package:personel_takip/models/personal.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> savePersonal(
    String name,
    String adress,
    String phone,
    String role,
    int salary,
    int dailyFood,
    int dailyElectric,
    int roadMoney,
  ) async {
    String res = 'some error occurred';

    try {
      Personal personal = Personal(
        name: name,
        adress: adress,
        phone: phone,
        role: role,
        salary: salary,
        dailyFood: dailyFood,
        dailyElectric: dailyElectric,
        roadMoney: roadMoney,
      );
      _firestore.collection("personnals").doc(name).set(personal.toJson());
      res = "succes";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> saveHistoryData(
    String name,
    int salary,
    int dailyFood,
    int dailyElectric,
    int roadMoney,
    int totalMoney,
    String dateTime,
  ) async {
    String res = 'some error occurred';
    String uid = const Uuid().v1();

    try {
      History history = History(
        name: name,
        salary: salary,
        dailyFood: dailyFood,
        dailyElectric: dailyElectric,
        roadMoney: roadMoney,
        totalMoney: totalMoney,
        dateTime: dateTime,
      );
      _firestore.collection("history").doc(uid).set(history.toJson());
      res = "succes";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updatePersonal(
    String name,
    String adress,
    String phone,
    String role,
    int salary,
    int dailyFood,
    int dailyElectric,
    int roadMoney,
  ) async {
    String res = 'some error occurred';

    try {
      Personal history = Personal(
        name: name,
        adress: adress,
        phone: phone,
        role: role,
        salary: salary,
        dailyFood: dailyFood,
        dailyElectric: dailyElectric,
        roadMoney: roadMoney,
      );
      _firestore.collection("personnals").doc(name).update(history.toJson());
      res = "succes";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> deletePersonal(String name) async {
    try {
      await _firestore.collection('personnals').doc(name).delete();
    } catch (err) {
      print(err.toString());
    }
  }
}
