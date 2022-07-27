import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personel_takip/resources/firestore_methods.dart';
import 'package:personel_takip/widgets/custom_button.dart';
import 'package:personel_takip/widgets/custom_textfield.dart';

class PersonalManage extends StatefulWidget {
  PersonalManage({Key? key}) : super(key: key);

  @override
  State<PersonalManage> createState() => _PersonalManageState();
}

class _PersonalManageState extends State<PersonalManage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _dailyFoodController = TextEditingController();
  final TextEditingController _dailyElectricController =
      TextEditingController();
  final TextEditingController _roadMoneyController = TextEditingController();
  final Stream<QuerySnapshot> _personnals = FirebaseFirestore.instance
      .collection('personnals')
      .snapshots(includeMetadataChanges: true);
  final List<String> genderItems = [
    'Muraat Türk',
    'Murat',
    'Murat Türkkk',
  ];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: StreamBuilder<QuerySnapshot>(
          stream: _personnals,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownSearch<String>(
                  items: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        return data["name"];
                      })
                      .toList()
                      .cast<String>(),
                  onChanged: (value) {
                    setState(() async {
                      var _personelInfo;
                      _personelInfo = await FirebaseFirestore.instance
                          .collection('personnals')
                          .doc(value)
                          .get();
                      _nameController.text = _personelInfo.data()!['name'];
                      _phoneController.text = _personelInfo.data()!['phone'];
                      _adressController.text = _personelInfo.data()!['adress'];
                      _dailyElectricController.text =
                          _personelInfo.data()!['dailyElectric'].toString();
                      _dailyFoodController.text =
                          _personelInfo.data()!['dailyFood'].toString();
                      _roadMoneyController.text =
                          _personelInfo.data()!['roadMoney'].toString();
                      _roleController.text = _personelInfo.data()!['role'];
                      _salaryController.text =
                          _personelInfo.data()!['salary'].toString();
                    });
                  },
                  popupProps: PopupPropsMultiSelection.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hinttext: "Ad Soyad",
                    label: "Ad Soyad",
                    textEditingController: _nameController),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hinttext: "Adres",
                    label: "Adres",
                    textEditingController: _adressController),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hinttext: "Telefon",
                    label: "Telefon",
                    textEditingController: _phoneController),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hinttext: "Rol",
                    label: "Rol",
                    textEditingController: _roleController),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hinttext: "Maaş",
                    label: "Maaş",
                    textEditingController: _salaryController),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hinttext: "Günlük Yemek Ücreti",
                    label: "Günlük Yemek Ücreti",
                    textEditingController: _dailyFoodController),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hinttext: "Günlük Elektrik Ücreti",
                    label: "Günlük Elektrik Ücreti",
                    textEditingController: _dailyElectricController),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hinttext: "Yol Parası",
                    label: "Yol Parası",
                    textEditingController: _roadMoneyController),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        borderRadius: 16,
                        child: Text(
                          "Kaydet",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          FirestoreMethods().savePersonal(
                              _nameController.text,
                              _adressController.text,
                              _phoneController.text,
                              _roleController.text,
                              int.parse(_salaryController.text),
                              int.parse(_dailyFoodController.text),
                              int.parse(_dailyElectricController.text),
                              int.parse(_roadMoneyController.text));
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        borderRadius: 16,
                        child: Text(
                          "Güncelle",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.orange,
                        onPressed: () {
                          FirestoreMethods().updatePersonal(
                              _nameController.text,
                              _adressController.text,
                              _phoneController.text,
                              _roleController.text,
                              int.parse(_salaryController.text),
                              int.parse(_dailyFoodController.text),
                              int.parse(_dailyElectricController.text),
                              int.parse(_roadMoneyController.text));
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        borderRadius: 16,
                        child: Text(
                          "Sil",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        onPressed: () {
                          FirestoreMethods()
                              .deletePersonal(_nameController.text);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    ));
  }
}
