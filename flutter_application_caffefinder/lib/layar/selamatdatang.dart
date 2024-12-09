import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'daftar.dart';  // Pastikan DaftarPage sudah diimpor

class SelamatDatangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay sebelum pindah ke halaman DaftarPage
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DaftarPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lingkaran dengan gambar
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.brown,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logocaffe.png', // Pastikan path ini benar
                  fit: BoxFit.cover,
                  width: 140,
                  height: 140,
                ),
              ),
            ),
            SizedBox(height: 24),

            // Teks deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Sebuah aplikasi yang dirancang untuk memudahkan pengguna menemukan cafe terbaik di sekitar Jambi.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.brown,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
