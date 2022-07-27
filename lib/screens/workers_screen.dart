// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:personel_takip/screens/personal_manage_screen.dart';
// import 'package:pluto_grid/pluto_grid.dart';

// class WorkersScreen extends StatefulWidget {
//   const WorkersScreen({Key? key}) : super(key: key);

//   @override
//   State<WorkersScreen> createState() => _WorkersScreenState();
// }

// class _WorkersScreenState extends State<WorkersScreen> {

//   final List<PlutoColumn> columns = <PlutoColumn>[
//     PlutoColumn(
//       title: 'Id',
//       field: 'id',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'İSİM',
//       field: 'name',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'ADRES',
//       field: 'adress',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'TELEFON',
//       field: 'phone',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Role',
//       field: 'role',
//       type: PlutoColumnType.select(<String>[
//         'Programmer',
//         'Designer',
//         'Owner',
//       ]),
//     ),
//     PlutoColumn(
//       title: 'MAAŞ',
//       field: 'salary',
//       type: PlutoColumnType.number(),
//     ),
//     PlutoColumn(
//       title: 'Günlük Yemek Ücreti',
//       field: 'dailyFood',
//       type: PlutoColumnType.number(),
//     ),
//     PlutoColumn(
//       title: 'Günlük Elektrik Ücreti',
//       field: 'dailyElectric',
//       type: PlutoColumnType.number(),
//     ),
//     PlutoColumn(
//       title: 'Yol Parası',
//       field: 'roadMoney',
//       type: PlutoColumnType.number(),
//     ),
//   ];

//   final List<PlutoRow> rows = [
//     PlutoRow(
//       cells: {
//         'id': PlutoCell(value: 'user1'),
//         'name': PlutoCell(value: 'Murat Türk'),
//         'adress': PlutoCell(
//             value: 'Leylekler mahallesinin önünde ki caminin karşısı'),
//         'phone': PlutoCell(value: '534 861 8084'),
//         'role': PlutoCell(value: 'Programmer'),
//         'salary': PlutoCell(value: 0),
//         'dailyFood': PlutoCell(value: 47),
//         'dailyElectric': PlutoCell(value: 20),
//         'roadMoney': PlutoCell(value: 15),
//       },
//     ),
//     PlutoRow(
//       cells: {
//         'id': PlutoCell(value: 'user1'),
//         'name': PlutoCell(value: 'Murat Türk'),
//         'adress': PlutoCell(
//             value: 'Leylekler mahallesinin önünde ki caminin karşısı'),
//         'phone': PlutoCell(value: '534 861 8084'),
//         'role': PlutoCell(value: 'Programmer'),
//         'salary': PlutoCell(value: 0),
//         'dailyFood': PlutoCell(value: 47),
//         'dailyElectric': PlutoCell(value: 20),
//         'roadMoney': PlutoCell(value: 15),
//       },
//     ),
//     PlutoRow(
//       cells: {
//         'id': PlutoCell(value: 'user1'),
//         'name': PlutoCell(value: 'Murat Türk'),
//         'adress': PlutoCell(
//             value: 'Leylekler mahallesinin önünde ki caminin karşısı'),
//         'phone': PlutoCell(value: '534 861 8084'),
//         'role': PlutoCell(value: 'Programmer'),
//         'salary': PlutoCell(value: 0),
//         'dailyFood': PlutoCell(value: 47),
//         'dailyElectric': PlutoCell(value: 20),
//         'roadMoney': PlutoCell(value: 15),
//       },
//     ),
//     PlutoRow(
//       cells: {
//         'id': PlutoCell(value: 'user1'),
//         'name': PlutoCell(value: 'Murat Türk'),
//         'adress': PlutoCell(
//             value: 'Leylekler mahallesinin önünde ki caminin karşısı'),
//         'phone': PlutoCell(value: '534 861 8084'),
//         'role': PlutoCell(value: 'Programmer'),
//         'salary': PlutoCell(value: 0),
//         'dailyFood': PlutoCell(value: 47),
//         'dailyElectric': PlutoCell(value: 20),
//         'roadMoney': PlutoCell(value: 15),
//       },
//     ),
//     PlutoRow(
//       cells: {
//         'id': PlutoCell(value: 'user1'),
//         'name': PlutoCell(value: 'Murat Türk'),
//         'adress': PlutoCell(
//             value: 'Leylekler mahallesinin önünde ki caminin karşısı'),
//         'phone': PlutoCell(value: '534 861 8084'),
//         'role': PlutoCell(value: 'Programmer'),
//         'salary': PlutoCell(value: 0),
//         'dailyFood': PlutoCell(value: 47),
//         'dailyElectric': PlutoCell(value: 20),
//         'roadMoney': PlutoCell(value: 15),
//       },
//     ),
//   ];

//   /// columnGroups that can group columns can be omitted.
//   final List<PlutoColumnGroup> columnGroups = [
//     PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
//     PlutoColumnGroup(
//         title: 'Çalışan Bilgileri', fields: ['name', 'adress', 'phone']),
//     PlutoColumnGroup(title: 'Durum', children: [
//       PlutoColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
//       PlutoColumnGroup(
//           title: 'ÜCRETLER.',
//           fields: ['salary', 'dailyFood', 'roadMoney', 'dailyElectric']),
//     ]),
//   ];

//   /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
//   /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
//   late final PlutoGridStateManager stateManager;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (ctx) => PersonalManage()));
//         },
//         label: const Text('Veri İşlemleri'),
//         icon: const Icon(Icons.person),
//         backgroundColor: Colors.green,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: PlutoGrid(
//           columns: columns,
//           rows: rows,
//           columnGroups: columnGroups,
//           onLoaded: (PlutoGridOnLoadedEvent event) {
//             stateManager = event.stateManager;
//           },
//           onChanged: (PlutoGridOnChangedEvent event) {
//             print(event);
//           },
//           configuration: const PlutoGridConfiguration(),
//         ),
//       ),
//     );
//   }
// }
