import 'EditAlarm.dart';
import 'TaskContainer.dart';
import 'data.dart';
import 'package:flutter/material.dart';

class TaskSelectionWidget extends StatefulWidget {
  final Wrapper wrapper;
  const TaskSelectionWidget(this.wrapper, {super.key});

  @override
  _TaskSelectionWidgetState createState() => _TaskSelectionWidgetState(wrapper);
}

class _TaskSelectionWidgetState extends State<TaskSelectionWidget> {
  final Wrapper wrapper;
  late Wrapper copy;
  _TaskSelectionWidgetState(this.wrapper) {
    copy = Wrapper();
    copy.categories = List.from(wrapper.categories);
    for (int i = 0; i < difficulties.length; i++) {
      selectedDifficulties[i] = (wrapper.difficulty == difficulties[i]);
    }
  }
  late String difficulty = wrapper.difficulty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
        title: const Text('Select Categories'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                wrapper.categories = copy.categories;
                wrapper.difficulty =
                    wrapper.categories.isEmpty ? 'None' : difficulty;
                Navigator.of(context).pop();
              });
            },
            icon: const Icon(Icons.done),
            tooltip: 'Save',
          )
        ],
      ),
      body: GridView
          .count(padding: EdgeInsets.zero, crossAxisCount: 2, children: [
        Center(
            child: TaskContainerWidget(
                const AssetImage('assets/images/task_categories/math.png'),
                'Math',
                copy)),
        Center(
            child: TaskContainerWidget(
                const AssetImage(
                    'assets/images/task_categories/motion_controls.png'),
                'Motion Controls',
                copy)),
        Center(
            child: TaskContainerWidget(
                const AssetImage('assets/images/task_categories/puzzles.png'),
                'Puzzles',
                copy)),
        Center(
            child: TaskContainerWidget(
                const AssetImage('assets/images/task_categories/minigames.png'),
                'Minigames',
                copy)),
        Center(
            child: TaskContainerWidget(
                const AssetImage(
                    'assets/images/task_categories/environment.png'),
                'Environment',
                copy)),
      ]),
      bottomSheet: BottomSheet(
        elevation: 10,
        //backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
        enableDrag: false,
        onClosing: () {},
        builder: (BuildContext context) => Container(
          height: 100,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: ToggleButtons(
            direction: Axis.horizontal,
            onPressed: (int index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < selectedDifficulties.length; i++) {
                  selectedDifficulties[i] = i == index;
                  if (i == index) difficulty = difficulties[i];
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            constraints: const BoxConstraints(
              minHeight: 60.0,
              minWidth: 100.0,
            ),
            isSelected: selectedDifficulties,
            children: difficultyWidgets,
          ),
        ),
      ),
    );
  }
}
