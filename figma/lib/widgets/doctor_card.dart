import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String role;
  final double rating;
  final String image;

  const DoctorCard({
    super.key,
    required this.name,
    required this.role,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(role, style: const TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.green, size: 16),
                    Text(
                      rating.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB28DFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Appointment"),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}
