import 'package:flutter/material.dart';
import 'product_page.dart';

class LoginPage extends StatelessWidget {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Đăng nhập")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _usernameCtrl, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: _passwordCtrl, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_usernameCtrl.text == 'test' && _passwordCtrl.text == '123') {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProductPage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sai thông tin đăng nhập")));
                }
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
