import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login.dart';

class DaftarPage extends StatefulWidget {
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Fungsi untuk melakukan registrasi pengguna
  Future<void> registerUser() async {
    String nama = namaController.text;
    String email = emailController.text;
    String password = passwordController.text;

    final String apiUrl = 'http://localhost:5050/user/registrasi';

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'userName': nama,
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (!data['error']) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Pendaftaran berhasil!')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['msg'])),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pendaftaran gagal, coba lagi')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan, coba lagi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Daftar',
                style: GoogleFonts.poppins(
                  color: Colors.brown,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.brown,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logocaffe.png',
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
              SizedBox(height: 24),
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  hintText: 'Nama',
                  filled: true,
                  fillColor: Colors.brown[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.brown[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Kata Sandi',
                  filled: true,
                  fillColor: Colors.brown[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: registerUser, // Panggil fungsi registrasi saat tombol ditekan
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah Punya Akun?',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                        color: Colors.brown,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
