import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../services/storage_service.dart';
import '../services/certificate_service.dart';

class UploadCertificateScreen extends StatefulWidget {
  final String userId;
  const UploadCertificateScreen({super.key, required this.userId});

  @override
  State<UploadCertificateScreen> createState() =>
      _UploadCertificateScreenState();
}

class _UploadCertificateScreenState extends State<UploadCertificateScreen> {
  File? _file;
  bool _loading = false;

  final StorageService _storageService = StorageService();
  final CertificateService _certificateService = CertificateService();

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  Future<void> _upload() async {
    if (_file == null) return;

    setState(() => _loading = true);

    try {
      final url = await _storageService.uploadCertificate(
        file: _file!,
        uid: widget.userId,
      );

      await _certificateService.saveCertificate(
        uid: widget.userId,
        url: url,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Certificate uploaded")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Certificate")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text("Pick PDF"),
            ),
            const SizedBox(height: 15),
            if (_file != null) Text(_file!.path.split('/').last),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _loading ? null : _upload,
              child: _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}
