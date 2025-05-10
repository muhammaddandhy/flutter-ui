import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/doctor.dart';
import '../widgets/doctor_card.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctors = Doctor.generateTopDoctors();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text('👋 Welcome Back',
                style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            const Text("Let's find your top therapist!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: 'Search health issue.......',
                    border: InputBorder.none,
                    icon: Icon(Icons.search)),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Categories',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryItem(
                    iconPath: 'assets/images/fluency.png', title: 'Fluency'),
                CategoryItem(
                    iconPath: 'assets/images/speech.png', title: 'Speech'),
                CategoryItem(
                    iconPath: 'assets/images/language.png', title: 'Language'),
                CategoryItem(
                    iconPath: 'assets/images/cognition.png', title: 'Cognition'),
              ],
            ),
            const SizedBox(height: 24),
            for (var doctor in doctors)
              DoctorCard(doctor: doctor),
          ],
        ),
      ),
    );
  }
}