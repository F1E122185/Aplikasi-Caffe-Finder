import 'package:flutter/material.dart';

class TambahDataPage extends StatelessWidget {
  const TambahDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Text(
                'Data Cafe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Ganti warna tulisan menjadi hitam
                ),
              ),
            ),
            SizedBox(height: 20),

            // Nama Cafe
            Text(
              'Nama Cafe',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Ganti warna tulisan menjadi hitam
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.brown[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Logo Cafe
            Text(
              'Logo Cafe',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Ganti warna tulisan menjadi hitam
            ),
            SizedBox(height: 8),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(Icons.add_a_photo, size: 40, color: Colors.brown),
              ),
            ),
            SizedBox(height: 16),

            // Foto Cafe
            Text(
              'Foto Cafe',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Ganti warna tulisan menjadi hitam
            ),
            SizedBox(height: 8),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(Icons.add_a_photo, size: 40, color: Colors.brown),
              ),
            ),
            SizedBox(height: 16),

            // Lokasi
            Text(
              'Lokasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Ganti warna tulisan menjadi hitam
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.brown[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Deskripsi Cafe
            Text(
              'Deskripsi Cafe',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Ganti warna tulisan menjadi hitam
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.brown[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Daftar Menu
            Text(
              'Daftar Menu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Ganti warna tulisan menjadi hitam
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.brown[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 24),

            // Tombol Simpan
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi simpan data di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[200],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Ganti warna tulisan menjadi hitam
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
