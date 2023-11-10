import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/feature/home/presetation/controller/home_store.dart';
import 'package:test_flutter/feature/home/presetation/widgets/list_tile_task.dart';
import 'package:test_flutter/shared/colors/colors_app.dart';
import 'package:test_flutter/shared/launcher/launcher_app.dart';
import 'package:test_flutter/shared/mixin/mixin_app.dart';
import 'package:test_flutter/shared/widgets/input.dart';
import 'package:test_flutter/shared/widgets/size_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MixinApp {
  late final HomeStore controller;
  final text = TextEditingController();
  final FocusNode _focus = FocusNode();
  final formKey = GlobalKey<FormState>();
  int? indexTaskEdit;

  @override
  void initState() {
    controller = context.read<HomeStore>();
    controller.init();
    super.initState();
  }

  void onDelete(int index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Deletar task?"),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                controller.removeTask(index);
              },
              child: const Text("Deletar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ColorsApp.backgroundColor,
            begin: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizeApp.sizeHeight64,
              const Text(
                "Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Observer(builder: (_) {
                    if (controller.listTask.isEmpty) {
                      return const Center(child: Text("Você não possui tasks"));
                    }
                    return ListView.separated(
                      itemCount: controller.listTask.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final task = controller.listTask.elementAt(index);
                        return ListTileTask(
                          text: task,
                          onEdit: () {
                            indexTaskEdit = index;
                            text.text = task;
                            _focus.requestFocus();
                          },
                          onDelete: () {
                            onDelete(index);
                          },
                        );
                      },
                    );
                  }),
                ),
              ),
              Input(
                controller: text,
                hint: "Digite o texto",
                focusNode: _focus,
                onFieldSubmitted: (value) {
                  if (formKey.currentState!.validate()) {
                    if (indexTaskEdit != null) {
                      controller.updateTask(indexTaskEdit!, value);
                      indexTaskEdit = null;
                    } else {
                      controller.addTask(value);
                    }

                    text.clear();
                    _focus.requestFocus();
                  }
                },
                validator: validator,
              ),
              SizeApp.sizeHeight64,
              TextButton(
                onPressed: () async {
                  await LauncherApp.web();
                },
                child: const Text(
                  "Políticas de privacidade",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizeApp.sizeHeight8,
            ],
          ),
        ),
      ),
    );
  }
}
