import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String text = todoController.text;
                      setState(() {
                        todos.add(text);
                      });
                      todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00d7f3),
                      padding: EdgeInsets.all(14),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (String todo in todos)
                      ListTile(
                        title: Text(todo),
                        onTap: () {
                          print('tarefa $todo');
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Você possui 0 tarefas pendentes',
                    ),
                  ),
                  SizedBox(
                    width: (8),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Limpar Tudo',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00d7f3),
                      padding: EdgeInsets.all(14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
