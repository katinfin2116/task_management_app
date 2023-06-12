import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:intl/intl.dart';

class DoneView extends StatefulWidget {
  const DoneView({Key? key}) : super(key: key);

  @override
  State<DoneView> createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView> {
  int get count => list.length;

  List<Map> list = [];

  @override
  void initState() {
    super.initState();
  }

  void load() {
    //print("load");
    setState(() {
      list = [
        {
          "time": "2020-06-16T10:31:12.000Z",
          "message":
              "P2 BGM-01 HV buiten materieel (Gas lekkage) Franckstraat Arnhem 073631"
        },
        {
          "time": "2020-06-16T10:29:35.000Z",
          "message": "A1 Brahmslaan 3862TD Nijkerk 73278"
        },
        {
          "time": "2020-06-16T10:29:35.000Z",
          "message":
              "A2 NS Station Rheden Dr. Langemijerweg 6991EV Rheden 73286"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        },
        {
          "time": "2020-06-15T09:41:18.000Z",
          "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
        },
        {
          "time": "2020-06-14T09:40:58.000Z",
          "message":
              "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
        }
      ];

      // list.addAll(List.generate(5, (v) => v));
      //print("data count = ${list.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: LoadMore(
          isFinish: count >= 5,
          onLoadMore: _loadMore,
          whenEmptyLoad: true,
          delegate: const DefaultLoadMoreDelegate(),
          textBuilder: DefaultLoadMoreTextBuilder.english,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                bool isSameDate = true;
                final String dateString = list[index]['time'];
                final DateTime date = DateTime.parse(dateString);
                final item = list[index];
                if (index == 0) {
                  isSameDate = false;
                } else {
                  final String prevDateString = list[index - 1]['time'];
                  final DateTime prevDate = DateTime.parse(prevDateString);
                  isSameDate = date.isSameDate(prevDate);
                }
                if (index == 0 || !(isSameDate)) {
                  return Column(children: [
                    Text(date.formatDate()),
                    ListTile(title: Text('item $index'))
                  ]);
                } else {
                  return ListTile(title: Text('item $index'));
                }
              }),
          // itemBuilder: (context, element) {
          //   return ListTile(
          //     title: Text('${list[element]["topicName"]}'),
          //     subtitle: Text('${list[element]["group"]}'),
          //   );
          // },
          // itemCount: count,
        ),
      ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(const Duration(seconds: 1, milliseconds: 100));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 100));
    list.clear();
    load();
  }
}

const String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
