import 'package:flutter/material.dart';
import 'widgets/signup_header.dart';
import 'widgets/signup_form.dart';
import 'widgets/signup_footer.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SignupHeader(),
              SizedBox(height: 30),
              SignupForm(),
              SizedBox(height: 30),
              SignupFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
