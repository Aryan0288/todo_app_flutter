import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataFormat {}

class Item {
  String task;
  bool isChecked;
  bool editStatus;
  Item({
    required this.task,
    required this.isChecked,
    required this.editStatus,
  });
  

  Item copyWith({
    String? task,
    bool? isChecked,
    bool? editStatus,
  }) {
    return Item(
      task: task ?? this.task,
      isChecked: isChecked ?? this.isChecked,
      editStatus: editStatus ?? this.editStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'task': task,
      'isChecked': isChecked,
      'editStatus': editStatus,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      task: map['task'] as String,
      isChecked: map['isChecked'] as bool,
      editStatus: map['editStatus'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Item(task: $task, isChecked: $isChecked, editStatus: $editStatus)';

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
  
    return 
      other.task == task &&
      other.isChecked == isChecked &&
      other.editStatus == editStatus;
  }

  @override
  int get hashCode => task.hashCode ^ isChecked.hashCode ^ editStatus.hashCode;
}
