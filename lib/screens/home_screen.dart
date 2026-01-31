import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.verified_user, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              "Welcome to Virtual Internship App",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              user?.email ?? "No email available",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.card_membership),
              title: const Text("View Certificate"),
              subtitle: const Text("Download & verify your certificate"),
              onTap: () {
                // NEXT STEP: Certificate feature
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text("Verify Certificate"),
              subtitle: const Text("Scan QR to verify"),
              onTap: () {
                // NEXT STEP: QR verification
              },
            ),
          ],
        ),
      ),
    );
  }
}
