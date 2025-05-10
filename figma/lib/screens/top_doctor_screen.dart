import 'package:flutter/material.dart';
import '../widgets/doctor_card.dart';

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Top Doctor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search health issue.......',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            DoctorCard(
              name: "Merdan",
              role: "Speech therapist, (Ashgabat)",
              rating: 4.8,
              image: "assets/doctor1.jpg",
            ),
            DoctorCard(
              name: "Meredov Suleyman",
              role: "Language therapist, (Ashgabat)",
              rating: 4.5,
              image: "assets/doctor2.jpg",
            ),
            DoctorCard(
              name: "Chariyeva Leyla",
              role: "Language therapist, (Ashgabat)",
              rating: 4.8,
              image: "assets/doctor3.jpg",
            ),
            DoctorCard(
              name: "Myrat",
              role: "Speech therapist, (Ashgabat)",
              rating: 4.1,
              image: "assets/doctor4.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
