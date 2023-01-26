import 'package:flutter/material.dart';

class TaskSelectionWidget extends StatefulWidget {
  const TaskSelectionWidget({Key? key}) : super(key: key);

  @override
  _TaskSelectionWidgetState createState() => _TaskSelectionWidgetState();
}

class _TaskSelectionWidgetState extends State<TaskSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Categories'),
        centerTitle: true,
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.done),
            tooltip: 'Save',
          )
        ],
      ),
      body: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        children: List.generate(7, (index) {
          return Text('Item $index');
        }),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
