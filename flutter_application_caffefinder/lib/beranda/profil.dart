import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tambah_data.dart'; // Pastikan file tambah_data.dart sudah tersedia

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Map<String, dynamic>> cafes = [
    {
      'name': 'Nyaman Hati',
      'image': 'assets/images/nyamanhati.jpg',
      'logo': 'assets/images/logo_nyamanhati.jpg',
      'address': 'Mendalo Darat, Kec. Jambi Luar Kota, Kabupaten Muaro Jambi, Jambi 36361',
      'location': 'https://maps.app.goo.gl/ASCke3waRQKUfCbN7',
      'description':
          'Caffe Nyaman Hati adalah cafe yang mengutamakan kenyamanan dan suasana yang menyenangkan. Tempat ini dikenal dengan desain interior yang menenangkan, dengan pencahayaan lembut dan dekorasi yang menciptakan suasana santai.',
      'menu': [
        'Pasta: Spaghetti aglio olio, lasagna.',
        'Minuman: Latte hazelnut, rose tea.',
        'Dessert: Tiramisu, panna cotta.'
      ]
    },
  ];

  // Menyimpan index BottomNavigationBar yang aktif
  int _currentIndex = 1;  // 1 berarti "Profile" aktif

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profil Pengguna
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/fotoadmin.jpg'), // Sesuaikan dengan path
                ),
                SizedBox(height: 8),
                Text(
                  "Tiaraa",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {}, // Fungsi tab jika ada
                  child: Text("Caffe"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // List Caffe
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Card Cafe Nyaman Hati
                  ...cafes.map((cafe) {
                    return Card(
                      color: Colors.brown[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              cafe['image'],
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(cafe['logo']),
                            ),
                            title: Text(
                              cafe['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cafe['address']),
                                TextButton.icon(
                                  onPressed: () => _launchURL(cafe['location']),
                                  icon: Icon(Icons.map, size: 16),
                                  label: Text("Lihat Maps"),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                  // Card baru dengan hanya tanda tambah
                  Card(
                    color: Colors.brown[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TambahDataPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // BottomNavigationBar dengan profile aktif
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,  // Menentukan item yang aktif
        onTap: (index) {
          setState(() {
            _currentIndex = index;  // Ubah index jika ada tap
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
