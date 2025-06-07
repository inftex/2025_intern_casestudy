import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String error = '';

  void _login() {
    if (usernameController.text == 'test' &&
        passwordController.text == '123') {
      Navigator.pushReplacementNamed(context, '/products');
    } else {
      setState(() {
        error = 'Sai tên đăng nhập hoặc mật khẩu';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đăng nhập')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Tên đăng nhập'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Mật khẩu'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Đăng nhập')),
            if (error.isNotEmpty)
              Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
