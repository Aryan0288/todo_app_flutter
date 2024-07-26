import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data_structure/data_format.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartProvider extends ChangeNotifier {
  List<dynamic> addTaskList = [];

  TextEditingController taskControllerEdit = TextEditingController();

  void addToTask(String s, BuildContext context) {
    if (s.length == 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Warning",
            style: TextStyle(color: Colors.red),
          ).centered(),
          content: const Text("Task cannot be empty"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }
    var data = Item(task: s, isChecked: false, editStatus: true).toMap();
    addTaskList.add(data);
    notifyListeners();
  }

  void clickCheckbox(bool value, int index) {
    addTaskList[index]['isChecked'] = value;
    notifyListeners();
  }

  // status change for edit the text

  void changeStatus(String str,int index) {
    bool status = addTaskList[index]['editStatus'];
    if (status) {
      String s = addTaskList[index]['task'];
      taskControllerEdit = TextEditingController(text: s);
      addTaskList[index]['editStatus'] = false;
    } else {
      addTaskList[index]['task']=str;
      addTaskList[index]['editStatus'] = true;
    }
    notifyListeners();
  }
}
