import 'package:flutter/gestures.dart'; //
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO: 1. Deklarasikan variabel
  final TextEditingController _usernameController =
      TextEditingController(); //[cite: 4]
  final TextEditingController _passwordController =
      TextEditingController(); //[cite: 4]

  String _errorText = ''; //[cite: 4]
  bool _isSignedIn = false; //[cite: 4]
  bool _obscurePassword = true; //[cite: 4]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang AppBar
      appBar: AppBar(title: const Text('Sign In')), //[cite: 4]
      // TODO: 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          //[cite: 4, 5]
          child: Padding(
            padding: const EdgeInsets.all(16), //[cite: 4, 5]
            child: Form(
              child: Column(
                // TODO: 4. Atur alignment
                mainAxisAlignment: MainAxisAlignment.center, //[cite: 4]
                crossAxisAlignment: CrossAxisAlignment.center, //[cite: 4]
                children: [
                  // TODO: 5. Pasang TextFormField nama pengguna
                  TextFormField(
                    controller: _usernameController, //[cite: 4]
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna', //[cite: 4]
                      border: OutlineInputBorder(), //[cite: 4]
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TODO: 6. Pasang TextFormField kata sandi
                  TextFormField(
                    controller: _passwordController, //[cite: 4]
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi', //[cite: 4]
                      errorText: _errorText.isNotEmpty
                          ? _errorText
                          : null, //[cite: 4]
                      border: const OutlineInputBorder(), //[cite: 4]
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword; //[cite: 4]
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility, //[cite: 4]
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword, //[cite: 4]
                  ),
                  const SizedBox(height: 20),

                  // TODO: 7. Pasang ElevatedButton Sign In
                  ElevatedButton(
                    onPressed: () {}, //[cite: 4]
                    child: const Text('Sign In'), //[cite: 4]
                  ),
                  const SizedBox(height: 10),

                  // TODO: 8. Pasang TextButton Sign Up / RichText
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ', //[cite: 4]
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple, //[cite: 4]
                      ),
                      children: [
                        TextSpan(
                          text: 'Daftar di sini.', //[cite: 4]
                          style: const TextStyle(
                            color: Colors.blue, //[cite: 4]
                            decoration: TextDecoration.underline, //[cite: 4]
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {}, //[cite: 4]
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
