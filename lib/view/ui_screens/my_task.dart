import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task/custom_widgts/custom_cantainer_button.dart';
import 'package:task/modal/data_modal.dart/data.dart';
import 'package:task/modal/db_helper/db_helper.dart';
import 'package:task/ui_helper.dart';
import 'package:task/util/colors.dart';
import 'package:task/view/ui_screens/add_task.dart';
import 'package:task/view/ui_screens/update_task.dart';

import '../../componant/task_card.dart';

class MyTask extends StatefulWidget {
  const MyTask({super.key});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  List<String> arrList = ["All", "Pending", "Ongaing", "Cormpleted"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: greenColors,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color(0xff77e6b6),
          ),
          backgroundColor: greenColors,
          // backgroundColor: Colors.yellow,
          centerTitle: true,

          bottom: PreferredSize(
            preferredSize: Size(70, 70),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: greenLightColors),
                    borderRadius: BorderRadius.circular(12)),
                child: TabBar(
                  // overlayColor: MaterialStateProperty.all<Color>(Colors.white),

                  // padding: EdgeInsets.symmetric(horizontal: 12),
                  labelStyle: TextStyle(color: Colors.white),
                  unselectedLabelColor: Colors.white,
                  // dividerColor: Colors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  // indicatorPadding: EdgeInsets.all(8),
                  // splashBorderRadius: BorderRadius.circular(10),

                  tabs: const [
                    Tab(
                        child: Text(
                      'All',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Tab(
                        child: Text(
                      'Panding',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Tab(
                        child: Text(
                      'Ongoing',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Tab(
                        child: Text(
                      'Completed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ],
                  indicatorColor: greenLightColors,
                  isScrollable: false,
                  labelColor: Colors.white,
                  indicatorWeight: 0,
                  dividerColor: Colors.transparent,
                  indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: greenLightColors),
                ),
              ),
            ),
          ),
          /* 
           PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: arrList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "${arrList[index]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                hSpecher(mHeight: 40.0)
              ],
            ),
          ),
          */
          title: const Text(
            "My Task",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              AllView(text: "All Task"),
              PendingTask(pendingTask: "Pending"),
              OnGoingtask(onGoingtask: "OnGoing"),
              CompletedTask(completedtask: "Completed"),
            ],
          ),
        ),
      ),
    );
  }
}

/// all view taks
class AllView extends StatefulWidget {
  String text;
  AllView({super.key, required this.text});

  @override
  State<AllView> createState() => _AllViewState();
}

class _AllViewState extends State<AllView> {
  /// First Time empty Data
  List<DataModal> arrTask = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  /// fachData local
  void getData() async {
    arrTask = await MyDBHelper().fetchAllNotes();

    print('total data ${arrTask.length}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.text}",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: greenLightColors),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: arrTask.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    dataModal: arrTask[index],
                    index: index,
                    onUpdate: () async {
                      print('update call');
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateTask(dataModal: arrTask[index]),
                          ));

                      getData();
                    },
                    onDelete: () async {
                      print('call delete');
                      await MyDBHelper().deletNotes("${arrTask[index].id}");

                      getData();
                    },
                    onTap: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// panding task
class PendingTask extends StatefulWidget {
  String pendingTask;
  PendingTask({super.key, required this.pendingTask});

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> {
  /// First Time empty Data
  List<DataModal> arrTask = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  /// fachData local
  void getData() async {
    arrTask = await MyDBHelper().fetchAllPending();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              /// title panding
              "${widget.pendingTask}",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: greenLightColors),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: arrTask.length,
                itemBuilder: (context, index) {
                  var _task = arrTask[index];
                  return TaskCard(
                    dataModal: arrTask[index],
                    index: index,
                    onUpdate: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateTask(dataModal: arrTask[index]),
                          ));

                      getData();
                    },
                    onDelete: () async {
                      await MyDBHelper().deletNotes("${arrTask[index]}");

                      getData();
                    },
                    onTap: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// ongoing task
/// panding task
class OnGoingtask extends StatefulWidget {
  String onGoingtask;
  OnGoingtask({super.key, required this.onGoingtask});

  @override
  State<OnGoingtask> createState() => _OnGoingtaskState();
}

class _OnGoingtaskState extends State<OnGoingtask> {
  /// First Time empty Data
  List<DataModal> arrTask = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  /// fachData local
  void getData() async {
    arrTask = await MyDBHelper().fetchAllOngoing();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              /// title panding
              "${widget.onGoingtask}",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: greenLightColors),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: arrTask.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    dataModal: arrTask[index],
                    index: index,
                    onUpdate: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateTask(dataModal: arrTask[index]),
                          ));

                      getData();
                    },
                    onDelete: () async {
                      await MyDBHelper().deletNotes("${arrTask[index]}");

                      getData();
                    },
                    onTap: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// panding task
class CompletedTask extends StatefulWidget {
  String completedtask;
  CompletedTask({super.key, required this.completedtask});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  /// First Time empty Data
  List<DataModal> arrTask = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  /// fachData local
  void getData() async {
    arrTask = await MyDBHelper().fetchAllCompleted();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              /// title panding
              "${widget.completedtask}",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: greenLightColors),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: arrTask.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    dataModal: arrTask[index],
                    index: index,
                    onUpdate: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateTask(dataModal: arrTask[index]),
                          ));

                      getData();
                    },
                    onDelete: () async {
                      await MyDBHelper().deletNotes("${arrTask[index]}");

                      getData();
                    },
                    onTap: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
