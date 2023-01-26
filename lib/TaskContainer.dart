import 'EditAlarm.dart';
import 'package:flutter/material.dart';

class TaskContainerWidget extends StatefulWidget {
  final Wrapper wrapper;
  AssetImage backgroundImage;
  String title;
  TaskContainerWidget(this.backgroundImage, this.title, this.wrapper);

  @override
  TaskContainerWidgetState createState() =>
      TaskContainerWidgetState(backgroundImage, title, wrapper);
}

class TaskContainerWidgetState extends State<TaskContainerWidget> {
  final Wrapper wrapper;
  AssetImage backgroundImage;
  String title;
  TaskContainerWidgetState(this.backgroundImage, this.title, this.wrapper);

  late bool selected = wrapper.categories.contains(title);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
            if (selected && !wrapper.categories.contains(title)) {
              wrapper.categories.add(title);
            } else {
              wrapper.categories.remove(title);
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
              border: selected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.secondary, width: 5)
                  : null,
              image: DecorationImage(image: backgroundImage, fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          padding: const EdgeInsets.only(bottom: 20, left: 15),
          //margin: const EdgeInsets.all(12),
          width: 186,
          height: 174,
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
        ));
  }
}
