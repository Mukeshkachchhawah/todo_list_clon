import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/custom_widgts/custom_cantainer_button.dart';
import 'package:task/custom_widgts/input_textfile.dart';
import 'package:task/modal/db_helper/db_helper.dart';
import 'package:task/ui_helper.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // seleted date
  DateTime _seletedDate = DateTime.now();
  // / seleted time
  TimeOfDay seletedTime = TimeOfDay.now();
  var userNameController = TextEditingController();

  var deportmentController = TextEditingController();

  var titleController = TextEditingController();

  var descController = TextEditingController();

  /// seleted Color
  int? seletedDate;
  int _selectedColor = 0;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputTextFild(
                  lebText: "User Name",
                  hinttext: "User Name",
                  controller: userNameController,
                  validator: (p0) {
                    if ((p0 ?? '').isEmpty) {
                      return 'Enter user name';
                    } else {
                      return null;
                    }
                  },
                ),
                InputTextFild(
                  lebText: "Deportment Name",
                  hinttext: "deportment",
                  controller: deportmentController,
                  validator: (p0) {
                    if ((p0 ?? '').isEmpty) {
                      return 'Enter department name';
                    } else {
                      return null;
                    }
                  },
                ),

                InputTextFild(
                  lebText: "Title",
                  hinttext: "Title",
                  controller: titleController,
                  validator: (p0) {
                    if ((p0 ?? '').isEmpty) {
                      return 'Enter title';
                    } else {
                      return null;
                    }
                  },
                ),
                InputTextFild(
                  lebText: "Description",
                  hinttext: "Description",
                  controller: descController,
                  validator: (p0) {
                    if ((p0 ?? '').isEmpty) {
                      return 'Enter description';
                    } else {
                      return null;
                    }
                  },
                ),
                InputTextFild(
                  hinttext: DateFormat.yMd().format(_seletedDate),
                  // lebText: "Date",
                  widget: IconButton(
                      onPressed: () {
                        /// print cureent date
                        GetDatPicker();
                      },
                      icon: Icon(Icons.calendar_month)),
                ),

                InputTextFild(
                  hinttext: "${seletedTime.hour}: ${seletedTime.minute}",
                  //  lebText: "Time",
                  widget: IconButton(
                      onPressed: () {
                        /// print cureent TIme
                        GetTImePicker();
                      },
                      icon: Icon(Icons.watch_later_sharp)),
                ),

                hSpectre(),

                /// ColorPallets
                // SeletedColor(),
                hSpectre(),
                InkWell(
                  onTap: () {
                    print("object");
                    _validDateData();
                  },
                  child: CustomContainerButton(
                    text: "Add Task",
                    mHight: 40,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// datapicker
  void GetDatPicker() async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2121));

    /// check condition date
    if (_datePicker != null) {
      seletedDate = _datePicker.millisecondsSinceEpoch;
      setState(() {});
      print(_seletedDate);
    } else {
      print("Nothing is wall");
    }
  }

  /// get Time picker
  void GetTImePicker() async {
    TimeOfDay? _seleted =
        await showTimePicker(context: context, initialTime: seletedTime);

    /// check condition date
    if (seletedTime != null) {
      seletedTime = _seleted!;
      setState(() {});
    }
  }

  Widget SeletedColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colors",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        hSpectre(),
        Wrap(
            children: List<Widget>.generate(3, (int index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedColor = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: index == 0
                    ? Colors.blue
                    : index == 1
                        ? Colors.red
                        : index == 2
                            ? Colors.yellow
                            : Color(0xfffef)
                //or
                //  backgroundColor: arrColor[index],

                ,
                child: _selectedColor == index
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Container(),
              ),
            ),
          );
        })),
      ],
    );
  }

  void _validDateData() {
    if (formKey.currentState!.validate()) {
      print('data not validate');
      MyDBHelper().addNote(
          department: deportmentController.text.trim(),
          desc: descController.text.trim(),
          dueDate: seletedDate!,
          dueDateTime: seletedTime.hourOfPeriod,
          status: 1,
          title: titleController.text.trim(),
          userName: userNameController.text.trim());
      Navigator.pop(context);
    } else {
      print('data not validate');
    }
    //   if(titleController.text.isNotEmpty&& descController.text.isNotEmpty&& userNameController.text.isNotEmpty)
  }
}
