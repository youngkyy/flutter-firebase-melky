import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homePage.dart'; // Halaman Home setelah login berhasil
import 'registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? errorMessage;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      setState(() {
        errorMessage = "Login failed. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, // Mengubah warna AppBar ke orange
        title: Text('Login', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Judul Halaman dengan Tampilan Lebih Menarik
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange, // Judul berwarna orange
              ),
            ),
            SizedBox(height: 20),

            // Input Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle:
                    TextStyle(color: Colors.orange), // Warna label orange
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
                labelStyle:
                    TextStyle(color: Colors.orange), // Warna label orange
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

            // Menampilkan pesan error jika ada
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),

            // Tombol Login
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange, // Warna tombol orange (perbaikan di sini)
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),  
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 15),

            // Link ke halaman register
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                'Don\'t have an account? Register',
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
