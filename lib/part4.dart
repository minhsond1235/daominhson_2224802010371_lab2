import 'package:flutter/material.dart';


void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
    ); // MaterialApp
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Application')),
      body: SingleChildScrollView( // tránh overflow
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Image.asset('images/3d_avatar_21.png', width: 100, height: 100),
            
            CustomTextField(
              label: 'First Name',
              controller: firstNameController,
            ), // CustomTextField
            CustomTextField(
              label: 'Last Name',
              controller: lastNameController,
            ), // CustomTextField
            
            const CustomTextField(
              label: 'Email',
              suffixText: '@mlritm.ac.in',
            ), // CustomTextField
            const CustomTextField(
              prefixText: '+91 ',
              label: 'Phone Number',
              keyboardType: TextInputType.phone,
              maxLength: 10,
            ), // CustomTextField
            
            const Divider(indent: 8, endIndent: 8),
            
            const CustomTextField(label: 'Username'),
            const CustomTextField(label: 'Password', obscureText: true),
            const CustomTextField(label: 'Confirm Password', obscureText: true),
            
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final fullName = '${firstNameController.text} ${lastNameController.text}';
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Registration Successful"),
                    content: Text("Welcome, $fullName"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ), // TextButton
                    ],
                  ), // AlertDialog
                );
              },
              child: const Text('Register'),
            ), // ElevatedButton
            const SizedBox(height: 24),
          ], // <Widget>[]
        ), // Column
      ), // SingleChildScrollView
    ); // Scaffold
  }
}

// Widget CustomTextField do tôi bổ sung dựa theo UI Result
// (Vì đoạn code này bị thiếu trên hình ảnh của bạn)
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? suffixText;
  final String? prefixText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.suffixText,
    this.prefixText,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          suffixText: suffixText,
          prefixText: prefixText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
