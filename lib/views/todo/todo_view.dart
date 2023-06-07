import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  List _elements = [
    {'name': 'John', 'group': 'Today'},
    {'name': 'Will', 'group': 'Team B'},
    {'name': 'Beth', 'group': 'Today'},
    {'name': 'Miranda', 'group': 'Team B'},
    {'name': 'Mike', 'group': 'Team C'},
    {'name': 'Danny', 'group': 'Today'},
  ];

  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, String>(
      elements: _elements,
      groupBy: (element) => element['group'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.only(left: 8.0 ,right: 8 ,top: 16),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      itemBuilder: (c, element) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(width: 0.0, color: Colors.transparent),
          ),
          elevation: 0.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: SizedBox(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              leading: const Icon(Icons.today_outlined),
              title: Text(element['name']),
              trailing: const Icon(Icons.menu),
            ),
          ),
        );
      },
    );
  }
}
