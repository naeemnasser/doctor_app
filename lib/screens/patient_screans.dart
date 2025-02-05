import 'package:flutter/material.dart';

import '../models/patient.dart';

class PatientScreen extends StatelessWidget {
  final List<Patient> patients = [
    Patient(
      name: 'John Doe',
      age: 30,
      image: 'assets/patient.png',
      condition: 'Flu',
    ),
    Patient(
      name: 'Jane Smith',
      age: 25,
      image: 'assets/patient.png',
      condition: 'Asthma',
    ),
    Patient(
      name: 'Emily Johnson',
      age: 40,
      image: 'assets/patient.png',
      condition: 'Diabetes',
    ),
    Patient(
      name: 'Michael Brown',
      age: 50,
      image: 'assets/patient.png',
      condition: 'Hypertension',
    ),
    Patient(
      name: 'Sarah Davis',
      age: 35,
      image: 'assets/patient.png',
      condition: 'Arthritis',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Patients'),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(patient.image),
              ),
              title: Text(
                patient.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Age: ${patient.age}\nCondition: ${patient.condition}',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PatientProfilePage(patient: patient),
                    ),
                  );
                },
                child: Text('View Profile'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PatientProfilePage extends StatelessWidget {
  final Patient patient;

  PatientProfilePage({required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(patient.image),
              ),
            ),
            SizedBox(height: 20),
            Text(
              patient.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Age: ${patient.age}',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Condition',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              patient.condition,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
