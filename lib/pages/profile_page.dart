import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Damsik Tugas Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80, // Setengah dari diameter
              backgroundImage: AssetImage('assets/images/my_logo.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Damsik',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'NIM: 236250069',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100, vertical: 15),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 167, 0, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}