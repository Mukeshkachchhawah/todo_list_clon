import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task/util/colors.dart';

import '../custom_widgts/custom_cantainer_button.dart';
import '../modal/data_modal.dart/data.dart';
import '../ui_helper.dart';
import '../util/task_color.dart';

class TaskCard extends StatelessWidget {
  final DataModal dataModal;
  final int index;
  final Function onTap;
  final Function onDelete;
  final Function onUpdate;
  const TaskCard(
      {super.key,
      required this.dataModal,
      required this.index,
      required this.onTap,
      required this.onUpdate,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(index.toString()),
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          onDelete();
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('update 1');
                  onUpdate();
                },
                child: CustomContainerButton(
                  text: "Update",
                  mHight: 30,
                  mWidgth: 100,
                ),
              ),
              hSpectre(),
              InkWell(
                onTap: () async {
                  print("Delete");
                  onDelete();
                },
                child: CustomContainerButton(
                  text: "Delete",
                  mHight: 30,
                  mWidgth: 100,
                ),
              )
            ],
          )
        ],
      ),
      direction: Axis.horizontal,
      child: Card(
        elevation: 5,
        child: Container(
          height: 180,
          width: double.infinity,
          // color: Colors.red,
          child: Row(
            children: [
              Container(
                height: 90,
                width: 5,
                decoration: BoxDecoration(
                    color: colorByStatus(dataModal.status ?? 0),
                    borderRadius: BorderRadius.circular(10)),
              ),
              wSpecher(mWidth: 15.0),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.import_contacts),
                              wSpecher(),
                              const Text("SER13312")
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.watch_later_outlined),
                              wSpecher(),
                              const Text("Tomorrow"),
                              const Text("-"),
                              const Text("12:32 PM")
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: 0.75,
                                backgroundColor: lightGreen3,
                                color: lightGreen2,
                              ),
                              Text(
                                '75%',
                                style: TextStyle(
                                    color: greenColors,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      wSpecher(mWidth: 8.0),
                    ],
                  ),
                  hSpectre(),

                  /// user task title and desc
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "${dataModal.title}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),

                  Text(
                    "${dataModal.desc}",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  hSpectre(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Image.network(
                          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      wSpecher(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${dataModal.userName}",
                            // "User Name",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "${dataModal.deportment}",
                            //   "user Deportment"
                          )
                        ],
                      ),
                      wSpecher(mWidth: 60.0),
                      statusButton(dataModal.status ?? 1),
                      wSpecher(mWidth: 8.0),
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget statusButton(int status) {
    var statusText = '';

    if (status == 1) {
      statusText = "PENDING";
    } else if (status == 2) {
      statusText = "ONGOING";
    } else if (status == 3) {
      statusText = "COMPLETED";
    }
    return Container(
      height: 35,
      width: 130,
      decoration: BoxDecoration(
          color: colorbgColor(dataModal.status ?? 0),
          border: Border.all(color: colorByStatusButton(dataModal.status ?? 0)),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          statusText,
          style: TextStyle(
            fontSize: 16,
            color: colorByStatusButton(dataModal.status ?? 0),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
