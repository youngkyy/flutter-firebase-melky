import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homePage.dart'; // Halaman Home setelah registrasi berhasil
import 'loginPage.dart'; // Tautan untuk kembali ke halaman login

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? errorMessage;

  Future<void> _register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      setState(() {
        errorMessage = "Registration failed. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Register', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Judul Halaman
            Text(
              'Create Account',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),

            // Input Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.orange),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Input Password
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.orange),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Pesan Error jika ada
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),

            // Tombol Register
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 15),

            // Tautan ke halaman Login
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Already have an account? Login',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
