import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'layar/selamatdatang.dart'; // ganti dengan path yang sesuai

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selamat Datang App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: SelamatDatangPage(),
    );
  }
}
