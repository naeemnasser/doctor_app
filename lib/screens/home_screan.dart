import 'package:flutter/material.dart';
import 'package:hospital_app/screens/doctor_profile.dart';
import '../models/doctor.dart'; // Adjust the import path as necessary
import 'patient_screans.dart'; // Import the PatientScreen
import 'contactus_screen.dart'; // Import the ContactUsScreen
import 'book_appoinment_screens.dart'; // Import the BookAppointmentScreen

class HomePage extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. John Doe',
      specialty: 'Cardiologist',
      image: 'assets/doctor.jpeg',
      rating: 4.5,
    ),
    Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Neurologist',
      image: 'assets/doctor.jpeg',
      rating: 4.7,
    ),
    Doctor(
      name: 'Dr. Emily Johnson',
      specialty: 'Pediatrician',
      image: 'assets/doctor.jpeg',
      rating: 4.8,
    ),
    Doctor(
      name: 'Dr. Michael Brown',
      specialty: 'Dermatologist',
      image: 'assets/doctor.jpeg',
      rating: 4.6,
    ),
    Doctor(
      name: 'Dr. Sarah Davis',
      specialty: 'Oncologist',
      image: 'assets/doctor.jpeg',
      rating: 4.9,
    ),
    Doctor(
      name: 'Dr. David Wilson',
      specialty: 'Orthopedic',
      image: 'assets/doctor.jpeg',
      rating: 4.4,
    ),
    Doctor(
      name: 'Dr. Laura Martinez',
      specialty: 'Gynecologist',
      image: 'assets/doctor.jpeg',
      rating: 4.7,
    ),
    Doctor(
      name: 'Dr. James Anderson',
      specialty: 'Psychiatrist',
      image: 'assets/doctor.jpeg',
      rating: 4.8,
    ),
    Doctor(
      name: 'Dr. Linda Thomas',
      specialty: 'Ophthalmologist',
      image: 'assets/doctor.jpeg',
      rating: 4.6,
    ),
    Doctor(
      name: 'Dr. Robert Jackson',
      specialty: 'Urologist',
      image: 'assets/doctor.jpeg',
      rating: 4.5,
    ),
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
                backgroundImage: AssetImage(doctor.image),
              ),
              title: Text(
                doctor.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.specialty,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        i < doctor.rating ? Icons.star : Icons.star_border,
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
                      builder: (context) => DoctorProfilePage(doctor: doctor),
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
        selectedItemColor: Colors.blue, // Set the color for the selected item
        unselectedItemColor:
            Colors.grey, // Set the color for the unselected items
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookAppointmentScreen(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientScreen(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactUsScreen(),
                ),
              );
              break;
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('View Doctors'),
              onTap: () {
                // Navigate to View Doctors page
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Reports'),
              onTap: () {
                // Navigate to Reports page
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: () {
                // Navigate to Account page
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to Settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}
