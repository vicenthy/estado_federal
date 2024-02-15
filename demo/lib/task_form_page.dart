import 'package:demo/global.dart';
import 'package:estado_federal/estado_federal.dart';
import 'package:flutter/material.dart';

class TaskFormPage extends StatelessWidget {
  const TaskFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: EstadoFederalWidget(
        state: taskState,
        builder: (List<String> tasks) {
          return Column(
            children: [
              const Text("New Task"),
              TextField(
                controller: textController,
                onSubmitted: (value) {
                  tasks.add(textController.text);
                  taskState.update();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
