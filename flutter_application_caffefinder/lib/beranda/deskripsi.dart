import 'package:flutter/material.dart';

class DeskripsiPage extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final List<String> menu;

  // Konstruktor untuk menerima parameter
  DeskripsiPage({
    required this.name,
    required this.image,
    required this.description,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name), // Nama kafe yang diklik
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar utama kafe
              Image.asset(image, width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 16),
              
              // Nama kafe
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              
              // Deskripsi kafe
              Text(
                description,
                style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(height: 16),
              
              // Daftar menu kafe
              Text(
                'Menu:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...menu.map((item) => Text(
                    '- $item',
                    style: TextStyle(fontSize: 16),
                  )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

