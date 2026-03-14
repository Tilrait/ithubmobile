import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ithubmobile/ui/screen/auth/auth_screen.dart';
import 'package:ithubmobile/ui/screen/main_screen.dart';
import 'package:ithubmobile/user/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните email и пароль')),
      );
      return;
    }

    final box = Hive.box('user');
    final rawCurrent = box.get('current');
    final rawPassword = box.get('password');

    if (rawCurrent == null || rawPassword == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Аккаунт не найден. Сначала зарегистрируйтесь'),
        ),
      );
      return;
    }

    final json = Map<String, dynamic>.from(rawCurrent as Map);
    final storedPassword = rawPassword.toString();

    if (storedPassword != password) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный пароль')),
      );
      return;
    }

    final user = UserModel.fromJson(json);
    if (user.email != email) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный email')),
      );
      return;
    }

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text('Login'),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                onSubmitted: (_) => _onLogin(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onLogin,
                child: const Text('Login'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                ),
                child: const Text('Возврат к регистрации'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
