import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. John Doe',
      'specialty': 'Cardiologist',
      'image': 'assets/doctor.jpeg',
      'rating': 4.5,
    },
    {
      'name': 'Dr. Jane Smith',
      'specialty': 'Neurologist',
      'image': 'assets/doctor.jpeg',
      'rating': 4.7,
    },
    {
      'name': 'Dr. Emily Johnson',
      'specialty': 'Pediatrician',
      'image': 'assets/doctor.jpeg',
      'rating': 4.8,
    },
    {
      'name': 'Dr. Michael Brown',
      'specialty': 'Dermatologist',
      'image': 'assets/doctor.jpeg',
      'rating': 4.6,
    },
    {
      'name': 'Dr. Sarah Davis',
      'specialty': 'Oncologist',
      'image': 'assets/doctor.jpeg',
      'rating': 4.9,
    },
    {
      'name': 'Dr. David Wilson',
      'specialty': 'Orthopedic',
      'image': 'assets/doctor.jpeg',
      'rating': 4.4,
    },
    {
      'name': 'Dr. Laura Martinez',
      'specialty': 'Gynecologist',
      'image': 'assets/doctor.jpeg',
      'rating': 4.7,
    },
    {
      'name': 'Dr. James Anderson',
      'specialty': 'Psychiatrist',
      'image': 'assets/doctor.jpeg',
      'rating': 4.8,
    },
    {
      'name': 'Dr. Linda Thomas',
      'specialty': 'Ophthalmologist',
      'image': 'assets/doctor.jpeg',
      'rating': 4.6,
    },
    {
      'name': 'Dr. Robert Jackson',
      'specialty': 'Urologist',
      'image': 'assets/doctor.jpeg',
      'rating': 4.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Hospital App'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(doctor['image']),
              ),
              title: Text(
                doctor['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor['specialty'],
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        i < doctor['rating'] ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDetailsPage(doctor: doctor),
                    ),
                  );
                },
                child: Text('View Profile'),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Book Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact Us',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Navigate to Book Appointment page
              break;
            case 1:
              // Navigate to Patients page
              break;
            case 2:
              // Navigate to Contact Us page
              break;
          }
        },
      ),
    );
  }
}

class DoctorDetailsPage extends StatelessWidget {
  final Map<String, dynamic> doctor;

  DoctorDetailsPage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(doctor['image']),
              ),
            ),
            SizedBox(height: 20),
            Text(
              doctor['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              doctor['specialty'],
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              children: List.generate(5, (i) {
                return Icon(
                  i < doctor['rating'] ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 24,
                );
              }),
            ),
            SizedBox(height: 20),
            Text(
              'Biography',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Dr. ${doctor['name']} is a renowned ${doctor['specialty']} with over 20 years of experience. He/She has been recognized for his/her outstanding contributions to the field and has received numerous awards.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
