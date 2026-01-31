import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/certificate_service.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCertificateScreen extends StatelessWidget {
  const UserCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(title: const Text("My Certificate")),
      body: StreamBuilder(
        stream: CertificateService().getCertificate(uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("No certificate issued yet"));
          }

          final url = snapshot.data!['url'];

          return Center(
            child: ElevatedButton(
              onPressed: () async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: const Text("Download Certificate"),
            ),
          );
        },
      ),
    );
  }
}
