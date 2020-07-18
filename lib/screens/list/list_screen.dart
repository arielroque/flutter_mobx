import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobx/screens/list/stores/list_store.dart';
import 'package:fluttermobx/widgets/custom_icon_button.dart';
import 'package:fluttermobx/widgets/custom_text_field.dart';
import '../login/login_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListStore listStore = new ListStore();
  final todoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return CustomTextField(
                              hint: 'Tarefa',
                              controller: todoController,
                              onChanged: (todo) {
                                listStore.setNewTodoTitle(todo);
                              },
                              suffix: CustomIconButton(
                                radius: 32,
                                iconData:
                                    listStore.isFormValid ? Icons.add : null,
                                onTap: () {
                                  listStore.addTodoList();
                                  todoController.clear();
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Observer(
                            builder: (_) {
                              return ListView.separated(
                                itemCount: listStore.todoList.length,
                                itemBuilder: (_, index) {
                                  final todo = listStore.todoList[index];

                                  return ListTile(
                                    title: Observer(
                                      builder: (_) {
                                        return Text(
                                          todo.title,
                                          style: TextStyle(
                                              decoration: todo.done
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              color: todo.done
                                                  ? Colors.grey
                                                  : Colors.black),
                                        );
                                      },
                                    ),
                                    onTap: () {
                                      todo.toggleDone();
                                    },
                                  );
                                },
                                separatorBuilder: (_, __) {
                                  return Divider();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
