import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personel_takip/resources/firestore_methods.dart';
import 'package:personel_takip/widgets/custom_button.dart';
import 'package:personel_takip/widgets/custom_textfield.dart';

class CalculateScreen extends StatefulWidget {
  CalculateScreen({Key? key}) : super(key: key);

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  final Stream<QuerySnapshot> _personnals = FirebaseFirestore.instance
      .collection('personnals')
      .snapshots(includeMetadataChanges: true);
  final Stream<QuerySnapshot> _history = FirebaseFirestore.instance
      .collection('history')
      .snapshots(includeMetadataChanges: true);
  final TextEditingController _home = TextEditingController();
  final TextEditingController _office = TextEditingController();
  String? selectedValue;
  String name = "";
  int dailyElectric = 0;
  var now = new DateTime.now();
  int dailyFood = 0;
  int roadMoney = 0;
  int salary = 0;
  int total = 0;
  bool sort = true; // or `false`...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _history,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                if (snapshot.hasData) {
                  List<DataCell> displayedDataCell = [];

                  for (var item in snapshot.data!.docs) {
                    displayedDataCell.add(
                      DataCell(
                        Text(
                          item['name'].toString(),
                        ),
                      ),
                    );
                    displayedDataCell.add(
                      DataCell(
                        Text(
                          item['salary'].toString() + " TL",
                        ),
                      ),
                    );
                    displayedDataCell.add(
                      DataCell(
                        Text(
                          item['roadMoney'].toString() + " TL",
                        ),
                      ),
                    );
                    displayedDataCell.add(
                      DataCell(
                        Text(
                          item['dailyElectric'].toString() + " TL",
                        ),
                      ),
                    );
                    displayedDataCell.add(
                      DataCell(
                        Text(
                          item['dailyFood'].toString() + " TL",
                        ),
                      ),
                    );
                    displayedDataCell.add(
                      DataCell(
                        Text(
                          item['totalMoney'].toString() + " TL",
                        ),
                      ),
                    );
                    displayedDataCell.add(
                      DataCell(
                        Text(
                          item['dateTime'].toString(),
                        ),
                      ),
                    );
                  }

                  return DataTable2(
                    sortAscending: sort,
                    sortColumnIndex: 0,
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white12),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Ad Soyad',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Maaş',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Yol Ücreti',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Günlük Elektrik',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Günlük Yemek',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Toplam Para',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Tarih',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      for (int i = 0; i < displayedDataCell.length; i += 7)
                        DataRow(cells: [
                          displayedDataCell[i],
                          displayedDataCell[i + 1],
                          displayedDataCell[i + 2],
                          displayedDataCell[i + 3],
                          displayedDataCell[i + 4],
                          displayedDataCell[i + 5],
                          displayedDataCell[i + 6],
                        ])
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 5,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: _personnals,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            var _personelInfo;
                            setState(() async {
                              _personelInfo = await FirebaseFirestore.instance
                                  .collection('personnals')
                                  .doc(value)
                                  .get();
                              name = _personelInfo.data()!['name'];
                              dailyElectric =
                                  _personelInfo.data()!['dailyElectric'];
                              dailyFood = _personelInfo.data()!['dailyFood'];
                              roadMoney = _personelInfo.data()!['roadMoney'];
                              salary = _personelInfo.data()!['salary'];
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
                        CustomTextField(
                          hinttext: "Evden çalıştığı gün sayısı",
                          label: "Ev",
                          textEditingController: _home,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hinttext: "Ofisten çalıştığı gün sayısı",
                          label: "Ofis",
                          textEditingController: _office,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Elektrik Parası:" + dailyElectric.toString()),
                            Text("Yol Parası:" + roadMoney.toString()),
                            Text("Yemek Parası:" + dailyFood.toString()),
                            Text("Maaş:" + salary.toString()),
                            Text(
                              "Toplam Ödenecek:" + total.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
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
                                  "Hesapla",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    dailyElectric *= int.parse(_home.text);
                                    dailyFood = int.parse(_home.text);
                                    roadMoney *= int.parse(_office.text);
                                    total = dailyElectric +
                                        dailyFood +
                                        roadMoney +
                                        salary;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                borderRadius: 16,
                                onPressed: () {
                                  setState(() {
                                    now = new DateTime.now();

                                    var dateTime =
                                        DateFormat('dd/MM/yyyy').format(now);

                                    dailyElectric *= int.parse(_home.text);
                                    dailyFood = int.parse(_home.text);
                                    roadMoney *= int.parse(_office.text);
                                    total = dailyElectric +
                                        dailyFood +
                                        roadMoney +
                                        salary;
                                    FirestoreMethods().saveHistoryData(
                                        name,
                                        salary,
                                        dailyFood,
                                        dailyElectric,
                                        roadMoney,
                                        total,
                                        dateTime);
                                  });
                                },
                                child: Text(
                                  "Veriyi Kaydet",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        )
                      ]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
