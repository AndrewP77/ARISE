import 'data.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:timelines/timelines.dart';

class PointsWidget extends StatefulWidget {
  @override
  _PointsWidgetState createState() => _PointsWidgetState();
}

class _PointsWidgetState extends State<PointsWidget> {
  //from db probably
  int totalPoints = 265; //total points collected
  int currentStreak = 4; //streak days

  //the rest is calculated...
  late int level = getLevel();
  late int progress = totalPoints - levelThresholds[level];
  late double levelPoints = levelThresholds[level+1].toDouble() - levelThresholds[level].toDouble();
  late ValueNotifier<double> progressNotifier = ValueNotifier(progress.toDouble());

  //TODO: "Balancing"...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Points & Stats'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
        ),
        body: Center(
            child: ListView (
    children: [
            Column(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text(
                'Level $level',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 50),
              SimpleCircularProgressBar(
                maxValue: levelPoints,
                animationDuration: 1,
                progressStrokeWidth: 25,
                backStrokeWidth: 30,
                size: 180,
                progressColors: const [
                  Colors.cyan,
                  Colors.green,
                  Colors.amberAccent,
                  Colors.redAccent,
                  Colors.purpleAccent
                ],
                backColor: Colors.blueGrey.shade500,
                valueNotifier: progressNotifier,
                mergeMode: true,
                onGetText: (double value) {
                  return Text('${value.toInt()}/${levelPoints.toInt()} points',
                      style: Theme.of(context).textTheme.titleMedium);
                },
              ),
              const SizedBox(height: 35),
              ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
              const Text('Next Level Rewards:'),
              ToggleButtons(
                  onPressed: (int index) {},
                  direction: Axis.horizontal,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  constraints: const BoxConstraints(
                    minHeight: 60.0,
                    minWidth: 130.0,
                  ),
                  isSelected: List<bool>.generate(
                      levelRewards[level].length, (index) => true),
                  children: List<Widget>.generate(levelRewards[level].length,
                      (index) => Text(levelRewards[level][index]))),
              const SizedBox(height: 15),
        ]),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.star_rate_rounded),
                title: Text(
                  '$progress/${levelPoints.toInt()} points',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Text(
                    "${levelThresholds[level+1] - totalPoints} points to reach level ${level + 1}!",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.caption),
              ),
              ListTile(
                leading: const Icon(Icons.local_fire_department_rounded),
                title: Text(
                  'Streak: $currentStreak days!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Text(
                    "You haven't snoozed in $currentStreak days. Good job!",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.caption),
              ),
              const Divider(),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: Timeline.tileBuilder(
                      theme: TimelineThemeData(
                          direction: Axis.horizontal,
                          color: Theme.of(context).primaryColorLight
                      ),
                      builder: TimelineTileBuilder.connectedFromStyle(
                        lastConnectorStyle: ConnectorStyle.dashedLine,
                        connectorStyleBuilder: (context, index) {
                          return (streakRewards.keys.elementAt(index) > currentStreak-1)
                              ? ConnectorStyle.dashedLine
                              : ConnectorStyle.solidLine;
                        },
                        indicatorStyleBuilder: (context, index) {
                          if (streakRewards.keys.elementAt(index) < currentStreak) {
                            return IndicatorStyle.dot;
                          } else {
                            return (streakRewards.keys.elementAt(index) == currentStreak)
                                ? IndicatorStyle.dot
                                : IndicatorStyle.outlined;
                          }
                        },
                        contentsAlign: ContentsAlign.reverse,
                        contentsBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(streakRewards.values.elementAt(index),
                                style: (streakRewards.keys.elementAt(index) != currentStreak)
                                    ? Theme.of(context).textTheme.caption
                                    : Theme.of(context).textTheme.titleLarge),
                          );
                        },
                        oppositeContentsBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text('${streakRewards.keys.elementAt(index)} day streak reward'),
                          );
                        },
                        itemCount: streakRewards.length,
                      )))
            ])
        )
    );
  }

  getLevel() {
    int temp = 0;
    for (var index = 0; index<levelThresholds.length; index++) {
      if (totalPoints>levelThresholds[index]) {
        temp = index;
      }
    }
    return temp;
  }
  showDays(index) {
    if (index < currentStreak - 1 || index > currentStreak + 1) {
      return Text('${index + 1} day streak reward');
    } else if (index == currentStreak - 1) {
      return const Text("Previous streak reward");
    } else if (index == currentStreak) {
      return const Text("Today's streak reward");
    } else {
      return const Text("Next streak reward");
    }
  }
}
