import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/factory/home_factory.dart';
import 'package:test_flutter/feature/home/domain/usecase/add_task_usecase.dart';
import 'package:test_flutter/feature/home/domain/usecase/get_all_tasks_usecase.dart';
import 'package:test_flutter/feature/home/presetation/controller/home_store.dart';
import 'package:test_flutter/routes/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<HomeStore>(
          create: (_) => HomeStore(
            addTaskUsecase: AddTaskUsecase(
              repository: HomeFactory.repository,
            ),
            getAllTasksUsecase: GetAllTasksUsecase(
              repository: HomeFactory.repository,
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(0, 12, 230, 12),
        ),
      ),
      routes: Routes.routes,
      initialRoute: Routes.login,
      debugShowCheckedModeBanner: false,
    );
  }
}
