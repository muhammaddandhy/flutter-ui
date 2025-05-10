class Doctor {
  final String name;
  final String specialty;
  final String location;
  final double rating;
  final String imageAsset;

  Doctor({
    required this.name,
    required this.specialty,
    required this.location,
    required this.rating,
    required this.imageAsset,
  });

  static List<Doctor> generateTopDoctors() => [
        Doctor(
          name: 'Saparov Merdan',
          specialty: 'Speech therapist',
          location: 'Ashgabat',
          rating: 4.8,
          imageAsset: 'assets/images/doc1.png',
        ),
        Doctor(
          name: 'Chariveya Leyla',
          specialty: 'Language therapist',
          location: 'Ashgabat',
          rating: 4.6,
          imageAsset: 'assets/images/doc2.png',
        ),
      ];
}
