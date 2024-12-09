import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart'; // Tautan untuk logout dan kembali ke login

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Home', style: TextStyle(color: Colors.white)),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${user?.email ?? "Guest"}!',
              style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
