import 'package:cloud_firestore/cloud_firestore.dart';

class Personal {
  final String uid;
  final String name;
  final String adress;
  final String phone;
  final String role;
  final String salary;
  final int dailyFood;
  final int dailyElectric;
  final int roadMoney;

  const Personal({
    required this.uid,
    required this.name,
    required this.adress,
    required this.phone,
    required this.role,
    required this.salary,
    required this.dailyFood,
    required this.dailyElectric,
    required this.roadMoney,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "adress": adress,
        "phone": phone,
        "role": role,
        "salary": salary,
        "dailyFood": dailyFood,
        "dailyElectric": dailyElectric,
        "roadMoney": roadMoney,
      };

  static Personal fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Personal(
      uid: snapshot["uid"],
      name: snapshot["name"],
      adress: snapshot["adress"],
      phone: snapshot["phone"],
      role: snapshot["role"],
      salary: snapshot["salary"],
      dailyFood: snapshot["dailyFood"],
      dailyElectric: snapshot["dailyElectric"],
      roadMoney: snapshot["roadMoney"],
    );
  }
}
