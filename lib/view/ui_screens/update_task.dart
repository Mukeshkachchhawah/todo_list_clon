import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/custom_widgts/custom_cantainer_button.dart';
import 'package:task/custom_widgts/input_textfile.dart';
import 'package:task/modal/db_helper/db_helper.dart';
import 'package:task/ui_helper.dart';

import '../../modal/data_modal.dart/data.dart';

class UpdateTask extends StatefulWidget {
  final DataModal dataModal;

  const UpdateTask({required this.dataModal});
  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  DateTime _seletedDate = DateTime.now();
  // / seleted time
  TimeOfDay seletedTime = TimeOfDay.now();
  var userNameController = TextEditingController();

  var deportmentController = TextEditingController();

  var titleController = TextEditingController();

  var descController = TextEditingController();

  /// seleted Color
  int _selectedColor = 0;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setData();
    super.initState();
  }

  int? dropDownValue;

  int? selectedDate;

  setData() {
    userNameController.text = widget.dataModal.userName ?? '';
    deportmentController.text = widget.dataModal.deportment ?? '';
    titleController.text = widget.dataModal.title ?? '';
    descController.text = widget.dataModal.desc ?? '';
    dropDownValue = widget.dataModal.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Update Task"),
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
                  lebText: "user Name",
                  hinttext: "User Name",
                  controller: userNameController,
                  validator: (p0) {
                    if ((p0 ?? '').isEmpty) {
                      return 'Enter title';
                    } else {
                      return null;
                    }
                  },
                ),
                InputTextFild(
                  lebText: "user Name",
                  hinttext: "deportment",
                  controller: deportmentController,
                  validator: (p0) {
                    if ((p0 ?? '').isEmpty) {
                      return 'Enter title';
                    } else {
                      return null;
                    }
                  },
                ),

                InputTextFild(
                  lebText: "Title",
                  hinttext: "Enter Title",
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
                  hinttext: "Enter Description",
                  controller: descController,
                  validator: (p0) {
                    if ((p0 ?? '').isEmpty) {
                      return 'Enter title';
                    } else {
                      return null;
                    }
                  },
                ),

                InputTextFild(
                  // lebText: "user Name",
                  hinttext: DateFormat.yMd().format(_seletedDate),
                  widget: IconButton(
                      onPressed: () {
                        /// print cureent date
                        GetDatPicker();
                      },
                      icon: Icon(Icons.calendar_month)),
                ),
                InputTextFild(
                  // lebText: "user Name",
                  hinttext: "${DateTime.now()}",
                  widget: IconButton(
                      onPressed: () {
                        GetTImePicker();
                      },
                      icon: Icon(Icons.watch_later)),
                ),
                hSpectre(),

                /// ColorPallets
                // SeletedColor(),

                DropdownButton(
                    isExpanded: true,
                    value: dropDownValue,
                    items: [
                      DropdownMenuItem(
                        child: Text('Pending'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Ongoing'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Completed'),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      dropDownValue = value;
                      setState(() {});
                    }),
                hSpectre(),
                InkWell(
                  onTap: () {
                    print("object");
                    _validDateData();
                  },
                  child: CustomContainerButton(
                    text: "Update Task",
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
      selectedDate = _datePicker.millisecondsSinceEpoch;
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

  Future<void> _validDateData() async {
    if (formKey.currentState!.validate()) {
      print('data  validate');
      await MyDBHelper().updateNotes(
          id: widget.dataModal.id ?? 0,
          department: deportmentController.text.trim(),
          desc: descController.text.trim(),
          dueDate: selectedDate!,
          dueDateTime: 1332323,
          status: dropDownValue ?? 1,
          title: titleController.text.trim(),
          userName: userNameController.text.trim());
      Navigator.pop(context);
    } else {
      print('data not validate');
    }
  }
}
