import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_caffefinder/beranda/beranda.dart';
import 'daftar.dart'; // Ganti dengan path Beranda Anda

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk login
  Future<void> login(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Validasi input kosong
    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Login Gagal"),
          content: Text("Username dan kata sandi tidak boleh kosong."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    // Kirim data login ke API
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5050/user/login'), // Ganti dengan URL API Anda
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'userName': username,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      // Cek status respons dari server
      if (response.statusCode == 200) {
        if (data['error'] == false) {
          // Login berhasil, arahkan ke Beranda
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Beranda()),
          );
        } else {
          // Login gagal, tampilkan pesan kesalahan
          _showErrorDialog(context, data['msg']);
        }
      } else {
        // Terjadi kesalahan saat menghubungi server
        _showErrorDialog(context, 'Terjadi kesalahan pada server.');
      }
    } catch (e) {
      // Error saat koneksi
      _showErrorDialog(context, 'Tidak dapat terhubung ke server.');
    }
  }

  // Tampilkan dialog error
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Login Gagal"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Masuk',
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
              // TextField untuk Username
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username', // Placeholder untuk Username
                  filled: true,
                  fillColor: Colors.brown[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // TextField untuk Password
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
                  onPressed: () {
                    login(context); // Panggil fungsi login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Masuk',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum Punya Akun?',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DaftarPage()),
                      );
                    },
                    child: Text(
                      'Daftar',
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
