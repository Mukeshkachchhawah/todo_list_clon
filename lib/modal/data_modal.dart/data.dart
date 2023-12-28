class DataModal {
  int? id;
  String? title;
  String? desc;
  String? userName;
  String? deportment;
  int? dueDate;
  int? dueTime;
  int? status;

  DataModal(
      {this.id,
      this.title,
      this.desc,
      this.userName,
      this.deportment,
      this.dueDate,
      this.dueTime,
      this.status});

  factory DataModal.formMap(Map<String, dynamic> map) {
    return DataModal(
      id: map['note_id'],
      title: map['title'],
      desc: map['desc'],
      userName: map['userName'],
      deportment: map['userDeportment'],
      dueDate: map['dueDate'],
      dueTime: map['dueTime'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.title;
    data['desc'] = this.desc;
    data['userName'] = this.userName;
    data['userDeportment'] = this.deportment;
    data['dueDate'] = this.dueDate;
    data['dueTime'] = this.dueTime;
    data['status'] = this.status;

    return data;
  }
}
