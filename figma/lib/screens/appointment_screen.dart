import 'package:flutter/material.dart';
import '../models/doctor.dart';

class AppointmentScreen extends StatelessWidget {
  final Doctor doctor;

  const AppointmentScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Booking with Dr. ${doctor.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Preferred Date'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Preferred Time'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Confirm Appointment'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
