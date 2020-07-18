import 'package:fluttermobx/screens/list/stores/todo_store.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodoTitle = "";

  @action
  void setNewTodoTitle(String title) => newTodoTitle = title;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  @observable
  ObservableList<TodoStore> todoList = new ObservableList<TodoStore>();

  @action
  void addTodoList() {
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = "";
  }
}
