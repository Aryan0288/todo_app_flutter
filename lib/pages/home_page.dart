import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:todo_app/pages/show_tabs.dart';
import 'package:todo_app/providers/add_to_cart_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Consumer<AddToCartProvider>(
        builder: (context, value, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _taskController,
                decoration: const InputDecoration(
                    hintText: "write your task here.....",
                    label: Text("Add Task"),
                    icon: Icon(Icons.add_task_rounded)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                value.addToTask(_taskController.text, context);
                _taskController.clear();
              },
              child: const Text("Add task"),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(tabs: [
                      Tab(
                        icon: Icon(Icons.task),
                      ),
                      Tab(
                        icon: Icon(Icons.task_alt),
                      )
                    ]),
                    Expanded(
                        child: TabBarView(
                      children: [
                        value.addTaskList
                                .where((task) => !task['isChecked'])
                                .isEmpty
                            ? Center(
                                child: const Icon(Icons.emoji_emotions_outlined)
                                    .scale(scaleValue: 3),
                              )
                            : ListView.builder(
                                itemCount: value.addTaskList
                                    .where((task) => !task['isChecked'])
                                    .length,
                                itemBuilder: (context, index) {
                                  final allTask = value.addTaskList
                                      .where((task) => !task['isChecked'])
                                      .toList();
                                  final itemData = allTask[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 16),
                                    child: Card(
                                      elevation: 12,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 24),
                                        child: Row(
                                          children: [
                                            Checkbox(
                                                value: itemData['isChecked'],
                                                onChanged: (v) {
                                                  value.clickCheckbox(
                                                      v ?? false,
                                                      value.addTaskList
                                                          .indexOf(itemData));
                                                }),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  itemData['editStatus']
                                                      ? Text(itemData['task'])
                                                          .text
                                                          .xl
                                                          .semiBold
                                                          .make()
                                                      : Expanded(
                                                          child: TextField(
                                                            controller: value
                                                                .taskControllerEdit,
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  "Edit task",
                                                              label: Text(
                                                                  "Edit Task"),
                                                            ),
                                                          ),
                                                        ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      value.changeStatus(value.taskControllerEdit.text,value.addTaskList
                                                          .indexOf(itemData));
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.deepPurple,
                                                    ),
                                                    child: Text(
                                                      itemData['editStatus']
                                                          ? "Edit"
                                                          : "Done",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                        value.addTaskList
                                .where((task) => task['isChecked'])
                                .isEmpty
                            ? Center(
                                child: const Icon(Icons.emoji_emotions_sharp)
                                    .scale(scaleValue: 3),
                              )
                            : ListView.builder(
                                itemCount: value.addTaskList
                                    .where((task) => task['isChecked'])
                                    .length,
                                itemBuilder: (context, index) {
                                  final completedList = value.addTaskList
                                      .where((task) => task['isChecked'])
                                      .toList();
                                  final itemData = completedList[index];
                                  if (completedList.isEmpty) {
                                    return const Center(
                                      child: Column(
                                        children: [
                                          Text("Add More Items"),
                                          Icon(Icons.today_outlined)
                                        ],
                                      ),
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 16),
                                    child: Card(
                                      elevation: 12,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 24),
                                        child: Row(
                                          children: [
                                            Checkbox(
                                                value: itemData['isChecked'],
                                                onChanged: (v) {
                                                  value.clickCheckbox(
                                                      v ?? false,
                                                      value.addTaskList
                                                          .indexOf(itemData));
                                                }),
                                            "${itemData['task']}"
                                                .text
                                                .xl
                                                .semiBold
                                                .make()
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}


















































// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/providers/add_to_cart_provider.dart';
// import 'package:velocity_x/velocity_x.dart';

// class HomePage extends StatelessWidget {
//   final TextEditingController _taskController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Consumer<AddToCartProvider>(
//           builder: (context, value, child) => Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: TextField(
//                   controller: _taskController,
//                   decoration: const InputDecoration(
//                     hintText: "Write your task here...",
//                     label: Text("Add Task"),
//                     icon: Icon(Icons.add_task_rounded),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {
//                   value.addToTask(_taskController.text);
//                   _taskController.clear();
//                 },
//                 child: const Text("Add Task"),
//               ),
//               const SizedBox(height: 30),
//               Expanded(
//                 child: DefaultTabController(
//                   length: 2,
//                   child: Column(
//                     children: [
//                      const TabBar(
//                         tabs: [
//                           Tab(
//                             icon: Icon(Icons.task),
//                             text: "All Tasks",
//                           ),
//                           Tab(
//                             icon: Icon(Icons.task_alt),
//                             text: "Completed Tasks",
//                           ),
//                         ],
//                       ),
//                       Expanded(
//                         child: TabBarView(
//                           children: [
//                             ListView.builder(
//                               itemCount: value.addTaskList.where((task) => !task['isChecked']).length,
//                               itemBuilder: (context, index) {
//                                 final uncompletedTasks = value.addTaskList.where((task) => !task['isChecked']).toList();
//                                 final itemData = uncompletedTasks[index];
//                                 return Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
//                                   child: Card(
//                                     elevation: 12,
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//                                       child: Row(
//                                         children: [
//                                           Checkbox(
//                                             value: itemData['isChecked'],
//                                             onChanged: (v) {
//                                               value.clickCheckbox(v ?? false, value.addTaskList.indexOf(itemData));
//                                             },
//                                           ),
//                                           "${itemData['task']}".text.xl.semiBold.make(),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             ListView.builder(
//                               itemCount: value.addTaskList.where((task) => task['isChecked']).length,
//                               itemBuilder: (context, index) {
//                                 final completedTasks = value.addTaskList.where((task) => task['isChecked']).toList();
//                                 final itemData = completedTasks[index];
//                                 return Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
//                                   child: Card(
//                                     elevation: 12,
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//                                       child: Row(
//                                         children: [
//                                           Checkbox(
//                                             value: itemData['isChecked'],
//                                             onChanged: (v) {
//                                               value.clickCheckbox(v ?? false, value.addTaskList.indexOf(itemData));
//                                             },
//                                           ),
//                                           "${itemData['task']}".text.xl.semiBold.make(),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

