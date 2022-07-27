import 'package:flutter/material.dart';
import 'package:personel_takip/models/history.dart';

class HistoryItem extends StatefulWidget {
  const HistoryItem({Key? key, required this.snap}) : super(key: key);

  final snap;

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: Card(
                  child: ListTile(
                    leading: Text(widget.snap["name"]),
                    title: Text("Toplam: "+
                      widget.snap["totalMoney"].toString() + " TL",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            "MAAŞ:" + widget.snap["salary"].toString() + " TL"),
                        Text("Günlük Yemek:" +
                            widget.snap["dailyFood"].toString() +
                            " TL"),
                        Text("Günlük Elektrik" +
                            widget.snap["dailyElectric"].toString() +
                            " TL"),
                        Text("Yol Parası:" +
                            widget.snap["roadMoney"].toString()),
                      ],
                    ),
                    trailing: Text(widget.snap["dateTime"]),
                    isThreeLine: true,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
