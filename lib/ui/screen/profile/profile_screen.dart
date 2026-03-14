import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ithubmobile/ui/screen/auth/auth_screen.dart';
import 'package:ithubmobile/user/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  UserModel? _user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() {
    final json = Hive.box('user').get('current') as Map<String, dynamic>?;
    if (json != null) {
      _user = UserModel.fromJson(json);
      _nameController.text = _user!.name;
      _emailController.text = _user!.email;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSave() {
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

    if (password.isNotEmpty) {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пароли не совпадают')),
        );
        return;
      }
      if (password.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Пароль должен быть не менее 6 символов'),
          ),
        );
        return;
      }
      Hive.box('user').put('password', password);
    }

    final updatedUser = UserModel(
      id: _user?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      avatarUrl: _user?.avatarUrl,
    );

    Hive.box('user').put('current', updatedUser.toJson());

    _passwordController.clear();
    _confirmPasswordController.clear();

    setState(() => _user = updatedUser);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Профиль сохранён')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Имя',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Новый пароль',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Подтвердите пароль',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onSubmitted: (_) => _onSave(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _onSave,
                child: const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AuthScreen()),
            (route) => true,
          );
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
