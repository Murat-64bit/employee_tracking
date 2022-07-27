import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final String name;
  final int salary;
  final int dailyFood;
  final int dailyElectric;
  final int roadMoney;
  final int totalMoney;
  final String dateTime;

  const History({
    required this.name,
    required this.salary,
    required this.dailyFood,
    required this.dailyElectric,
    required this.roadMoney,
    required this.totalMoney,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "salary": salary,
        "dailyFood": dailyFood,
        "dailyElectric": dailyElectric,
        "totalMoney": totalMoney,
        "roadMoney": roadMoney,
        "dateTime": dateTime,
      };

  static History fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return History(
      name: snapshot["name"],
      salary: snapshot["salary"],
      dailyFood: snapshot["dailyFood"],
      dailyElectric: snapshot["dailyElectric"],
      roadMoney: snapshot["roadMoney"],
      totalMoney: snapshot["totalMoney"],
      dateTime: snapshot["dateTime"],
    );
  }
}
