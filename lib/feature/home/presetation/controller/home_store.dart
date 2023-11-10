import 'package:mobx/mobx.dart';
import 'package:test_flutter/feature/home/domain/usecase/add_task_usecase.dart';
import 'package:test_flutter/feature/home/domain/usecase/get_all_tasks_usecase.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase({
    required this.addTaskUsecase,
    required this.getAllTasksUsecase,
  });

  final AddTaskUsecase addTaskUsecase;
  final GetAllTasksUsecase getAllTasksUsecase;
  final listTask = ObservableList<String>.of([]);
  String taskKey = "itens";

  @action
  init() async {
    var list = await getAllTasksUsecase.call(key: taskKey);
    listTask.addAll(list!);
  }

  @action
  void addTask(String text) async {
    var list = await getAllTasksUsecase.call(key: taskKey);
    list!.add(text);
    bool res = await addTaskUsecase.call(key: taskKey, tasks: list);
    if (res) {
      listTask.clear();
      listTask.addAll(list);
    }
  }

  @action
  void removeTask(int text) async {
    listTask.removeAt(text);
    await addTaskUsecase.call(key: taskKey, tasks: listTask);
  }

  @action
  void updateTask(int index, String text) async {
    listTask[index] = text;
    await addTaskUsecase.call(key: taskKey, tasks: listTask);
  }
}
