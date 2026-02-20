import 'package:flutter/material.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient'),
      ),
      body: const Center(
        child: Text('Add Patient Page'),
      ),
    );
  }
}
