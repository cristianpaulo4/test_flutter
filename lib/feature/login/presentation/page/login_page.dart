import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/routes/app_routes.dart';
import 'package:test_flutter/shared/colors/colors_app.dart';
import 'package:test_flutter/shared/launcher/launcher_app.dart';
import 'package:test_flutter/shared/mixin/mixin_app.dart';
import 'package:test_flutter/shared/widgets/input.dart';
import 'package:test_flutter/shared/widgets/size_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

const userMock = {
  "user": "admin",
  "password": "123",
};

class _LoginPageState extends State<LoginPage> with MixinApp {
  final formKey = GlobalKey<FormState>();
  final user = TextEditingController();
  final password = TextEditingController();
  final regex = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
  ];
  bool obscureText = true;

  void login() {
    if (formKey.currentState!.validate()) {
      if (userMock['user'] == user.text.trim() &&
          userMock['password'] == password.text.trim()) {
        Navigator.popAndPushNamed(context, Routes.home);
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            password.text.length <= 2
                ? "Senha muito curta."
                : "Usuário ou senha inválida!",
          ),
          backgroundColor:
              password.text.length <= 2 ? Colors.orange : Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ColorsApp.backgroundColor,
            begin: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Input(
                  icon: const Icon(Icons.person),
                  label: "Usuário",
                  validator: validator,
                  controller: user,
                  maxLength: 20,
                ),
                SizeApp.sizeHeight8,
                Input(
                  icon: const Icon(Icons.vpn_key),
                  label: "Senha",
                  obscureText: obscureText,
                  validator: validator,
                  controller: password,
                  maxLength: 20,
                  inputFormatters: regex,
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      obscureText = !obscureText;
                    }),
                    icon: Icon(
                      obscureText ? Icons.lock : Icons.lock_open_outlined,
                    ),
                  ),
                ),
                SizeApp.sizeHeight32,
                SizedBox(
                  height: 60,
                  width: 250,
                  child: FilledButton(
                    onPressed: login,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.green,
                      ),
                    ),
                    child: const Text("Entrar"),
                  ),
                ),
                const Spacer(),
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
      ),
    );
  }
}
