import 'package:flutter/material.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import 'widgets/login_footer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              LoginHeader(),
              SizedBox(height: 40),
              LoginForm(),
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
