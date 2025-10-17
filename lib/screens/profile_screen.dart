import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage('https://example.com/profile.jpg')), // Placeholder
            title: Text('Hi, Shahzeb Naqvi'),
            subtitle: Text('Welcome to Quick Medical Store'),
          ),
          ListTile(title: const Text('Edit Profile'), trailing: const Icon(Icons.arrow_forward), onTap: () {}),
          ListTile(title: const Text('My Orders'), trailing: const Icon(Icons.arrow_forward), onTap: () {}),
          ListTile(title: const Text('Billing'), trailing: const Icon(Icons.arrow_forward), onTap: () {}),
          ListTile(title: const Text('Faq'), trailing: const Icon(Icons.arrow_forward), onTap: () {}),
        ],
      ),
    );
  }
}