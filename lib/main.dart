import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String email;
  final String phone;

  Contact({required this.name, required this.email, required this.phone});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'John Doe', email: 'john.doe@example.com', phone: '1234567890'),
    Contact(name: 'Jane Smith', email: 'jane.smith@example.com', phone: '9876543210'),
    Contact(name: 'Alice Johnson', email: 'alice.johnson@example.com', phone: '5555555555'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].email),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              SizedBox(height: 8.0),
              Text('Phone: ${contact.phone}'),
            ],
          ),
        );
      },
    );
  }
}
