import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ithubmobile/ui/screen/login/login_screen.dart';
import 'package:ithubmobile/ui/screen/main_screen.dart';
import 'package:ithubmobile/user/user_model.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _onLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните имя и email')),
      );
      return;
    }
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пароли не совпадают')),
      );
      return;
    }
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пароль должен быть не менее 6 символов')),
      );
      return;
    }

    final user = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
    );

    Hive.box('user').put('current', user.toJson());
    Hive.box('user').put('password', password);

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
              Text('Auth Screen'),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Имя'),
                textInputAction: TextInputAction.next,
              ),
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
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Подтвердите пароль',
                ),
                obscureText: true,
                onSubmitted: (_) => _onRegister(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onRegister,
                child: const Text('Register'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _onLogin(context),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}