import 'package:flutter/material.dart';
import 'package:task/custom_widgts/custom_cantainer_button.dart';
import 'package:task/ui_helper.dart';
import 'package:task/view/ui_screens/add_task.dart';
import 'package:task/view/ui_screens/my_task.dart';
import 'package:intl/intl.dart';
import 'package:task/view/ui_screens/profile.dart';

import '../../modal/data_modal.dart/data.dart';
import '../../modal/db_helper/db_helper.dart';
import '../../util/colors.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List<DataModal> pandingList = [];
  List<DataModal> ongoingList = [];
  List<DataModal> CompletedList = [];

  @override
  void initState() {
    fetchCount();
    super.initState();
  }

  Future fetchCount() async {
    /// fatch panding notes
    pandingList = await MyDBHelper().fetchAllPending();
    print('pending data ${pandingList.length}');

    /// fatch ongoing notes
    ongoingList = await MyDBHelper().fetchAllOngoing();
    print('ongoing data ${ongoingList.length}');

//// fatch completed notes
    CompletedList = await MyDBHelper().fetchAllCompleted();
    print('Completed notes ${ongoingList.length}');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return await fetchCount();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: greenColors,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                    ),
                    SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff77e6b6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddTask(),
                                  ));
                            },
                            child: Text(
                              "CREATE TICKET",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff2c806e),
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                    // hSpecher(mHeight: 5)
                  ],
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 80, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, Jhon Steward",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(DateFormat.yMMMM().format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff60c8a2))),

                                // Text("Monday, 17 Jan 2023",
                                //     style: TextStyle(
                                //         fontSize: 16, color: Color(0xff60c8a2)))
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_active_sharp,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        hSpectre(mHeight: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// task Panding
                            UpdateTask(pandingList.length, "Tasks\nPanding"),
                            //// task progress
                            UpdateTask(
                                ongoingList.length, 'Tasks\nIn Progress'),
                            //// task completed
                            UpdateTask(CompletedList.length, "Tasks\nCompleted")
                          ],
                        ),
                        showGridWidget(),
                        hSpectre(mHeight: 50.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget showGridWidget() {
    return SizedBox(
      height: 400,
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          CustomGideViewBox(
            subtext: "new task added",
            text: "My Task",
            img: "assets/images/task.png",
            ontaped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyTask(),
                  ));
            },
          ),
          CustomGideViewBox(
            subtext: "You have 424 Ticket",
            text: "My Ticket",
            img: "assets/images/task-list-png.png",
            ontaped: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => MyTask(),
              //     ));
            },
          ),
          CustomGideViewBox(
            subtext: "see all your report",
            text: "Report",
            img: "assets/images/analytics-icon-8.png",
            ontaped: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => MyTask(),
              //     ));
            },
          ),
          CustomGideViewBox(
            subtext: "saad inn Sayeed",
            text: "My Profile",
            img: "assets/images/profile.png",
            ontaped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          )
        ],
      ),
    );
  }

  Widget UpdateTask(int number, String text) {
    return Column(
      children: [
        Text(
          "${number}",
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xff60c8a2)),
        ),
        Text("$text",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))
      ],
    );
  }
}
