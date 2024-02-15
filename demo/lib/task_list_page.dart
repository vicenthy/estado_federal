import 'package:demo/global.dart';
import 'package:demo/task_form_page.dart';
import 'package:estado_federal/estado_federal.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TESTE')),
      body: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskFormPage()));
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Task"),
          ),
          EstadoFederalWidget(
            state: taskState,
            builder: (List<String> tasks) {
              return SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          tasks.removeAt(index);
                          taskState.update();
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Theme.of(context).dividerColor.withOpacity(.5),
                      thickness: .2,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
