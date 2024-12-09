import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'deskripsi.dart'; // Import halaman deskripsi
import 'profil.dart'; //Import halaman profile

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final List<Map<String, dynamic>> cafes = [
    {
    'name': 'Caffe Teanol',
    'image': 'assets/images/teanol.jpg',
    'logo': 'assets/images/logo_teanol.jpg',
    'address': 'Jl. Sersan M. Yunus No.88, The Hok, Kec. Jambi Sel., Kota Jambi, Jambi 36125',
    'location': 'https://maps.app.goo.gl/mYZBsKWMG8jFv48T7',
    'description': 'Caffe Teanol adalah kafe yang menawarkan suasana modern dengan berbagai minuman khas kopi yang dibuat dari biji kopi lokal pilihan.',
    'menu': ['Espresso', 'Cappuccino', 'Teanol Special Latte', 'Croissant', 'Brownie']
  },
    {
      'name': 'Foresthree',
      'image': 'assets/images/foresthere.jpg',
      'logo': 'assets/images/logo_doresthere.jpg',
      'address': 'Jl. Makalam, Cemp. Putih, Kec. Jelutung, Kota Jambi, Jambi 36123',
      'location': 'https://maps.app.goo.gl/VQF1XmV9uWc4WkHs6',
      'description': 'Caffe Foresthree adalah Kafe bertema alam yang mengedepankan pengalaman menyatu dengan hutan. Dilengkapi dekorasi tanaman dan minuman berbasis buah segar.',
      'menu': ['Signature Drink: Forest Smoothie Berry Delight', 'Healthy Bowl: Granola tropical, mixed berry parfait.', 'Snack: Waffle pandan, toast alpukat.']
    },
    {
      'name': 'Senyala Kopi',
      'image': 'assets/images/senyala_kopi.jpg',
      'logo': 'assets/images/logo_senyalakopi.jpg',
      'address': 'Jl. Sunan Giri No.81, Simpang III Sipin, Kec. Kota Baru, Kota Jambi, Jambi 36124',
      'location': 'https://maps.app.goo.gl/dbKv4v6pJXRbJyJQ7',
      'description': 'Caffe Senyala Kopi adalah Kafe dengan suasana lokal dan sederhana yang menyajikan kopi tradisional dengan sentuhan modern. Fokus pada pengalaman kopi Nusantara.',
      'menu': ['Kopi Nusantara: Kopi Tubruk, Kopi Gayo, Kopi Kintamani.','Snack: Pisang goreng madu, singkong keju.','Dessert: Es kopi kelapa, kue pukis modern.']
    },
    {
      'name': 'Nyaman Hati',
      'image': 'assets/images/nyamanhati.jpg',
      'logo': 'assets/images/logo_nyamanhati.jpg',
      'address': 'Mendalo Darat, Kec. Jambi Luar Kota, Kabupaten Muaro Jambi, Jambi 36361',
      'location': 'https://maps.app.goo.gl/ASCke3waRQKUfCbN7',
      'description': 'Caffe Nyaman Hati adalah Nyaman Hati adalah cafe yang mengutamakan kenyamanan dan suasana yang  menyenangkan. Tempat ini dikenal dengan desain interior yang  menenangkan, dengan pencahayaan lembut dan dekorasi yang menciptakan  suasana santai. Menu di Nyaman Hati berfokus pada hidangan yang lezat  dan minuman yang menyegarkan, termasuk berbagai kopi, teh, dan camilan.',
      'menu': ['Pasta: Spaghetti aglio olio, lasagna.','Minuman: Latte hazelnut, rose tea.','Dessert: Tiramisu, panna cotta.']
    },
    {
      'name': 'La Terra',
      'image': 'assets/images/laterra.jpg',
      'logo': 'assets/images/logo_latera.jpg',
      'address': 'Jl. Kol Abunjani, Tugu, Juang Jambi, Kota Jambi, Jambi 36129',
      'location': 'https://maps.app.goo.gl/ZyFSUD3xFUYMzX7L8',
      'description': 'Caffe La Terra adalah Kafe berkonsep Eropa klasik dengan suasana romantis dan elegan. Cocok untuk menikmati waktu bersama pasangan.',
      'menu': ['']
    },
    {
      'name': 'Hello Sapa',
      'image': 'assets/images/hellosapa.jpg',
      'logo': 'assets/images/logo_helosapa.jpg',
      'address': 'Jl. Slamet Riyadi No.5B, RT.4, Sungai Putri, Kec. Telanaipura, Kota Jambi, Jambi 36124',
      'location': 'https://maps.app.goo.gl/E3Bd1MNtjk47WhrR6',
      'description': 'Caffe Hello Sapa adalah Kafe berkonsep tropis dengan cita rasa menu khas Indonesia Timur. Cocok untuk pecinta budaya dan kuliner tradisional.',
      'menu': ['Signature Drink: Kopi Sapa, Mocktail Flores Lime.', 'Makanan: Nasi kuning Manado, ikan dabu-dabu.','Dessert: Kue sagu kenari, dadar gulung kelapa.']
    },
    {
      'name': 'Jkov Koffie',
      'image': 'assets/images/jkovcoffe.jpg',
      'logo': 'assets/images/logo_jkovkoffie.jpg',
      'address': 'Jl. Sunan Drajat No.42, Suka Karya, Kec. Kota Baru, Kota Jambi, Jambi 36129',
      'location': 'https://maps.app.goo.gl/6LUXFi75cQhdyMoa9',
      'description': 'Caffe Jkov Koffie adalah Kafe minimalis modern yang fokus pada kopi berbasis espresso dan menu pastry ala Eropa.',
      'menu': ['Kopi: Espresso tonic, caramel macchiato.','Pastry: Croissant almond, eclair cokelat.','Sandwich: Turkey sandwich, caprese panini.']
    },
    {
      'name': 'Djelita House',
      'image': 'assets/images/djelitahouse.jpg',
      'logo': 'assets/images/logo_djelita.jpg',
      'address': 'Lorong Bunga Raya 3, RT.13/RW.3, Murni, Kec. Danau Tlk., Kota Jambi, Jambi 36121',
      'location': 'https://maps.app.goo.gl/XFSknM6w4xb86mYL7',
      'description': 'Caffe Djelita House adalah Kafe dengan nuansa vintage yang elegan. Dikenal dengan berbagai teh herbal dan makanan ringan bercita rasa lokal.',
      'menu': ['Minuman: Teh serai jahe, es teh rosella.','Snack: Martabak mini, pastel isi ayam.','Dessert: Cake talas Bogor, klepon modern.']
    },
    {
      'name': 'Koffiekopi',
      'image': 'assets/images/koffiecafe.jpg',
      'logo': 'assets/images/logo_koffiekopi.jpg',
      'address': 'Simpang IV Sipin, Kec. Telanaipura, Kota Jambi, Jambi 36361',
      'location': 'https://maps.app.goo.gl/TJGo2S1VdvDcjUAx5',
      'description': 'Caffe Kofflekopi adalah Kafe urban dengan fokus pada racikan kopi otentik untuk generasi muda.',
      'menu': ['Kopi: Cold brew, cappuccino.','Snack: Donat gula aren, churros cokelat.','Signature Dish: Kopi susu pandan, es kopi gula semut.']
    },
    {
      'name': 'Keyo Coffee & Eatery',
      'image': 'assets/images/keyocaffe.jpg',
      'logo': 'assets/images/logo_keyo.jpg',
      'address': 'Keyo Kost & Guest House, Jl. Zaidi Saleh No.4, RT.33, Paal Lima, Kec. Kota Baru, Kota Jambi, Jambi 36128',
      'location': 'https://maps.app.goo.gl/jg4LaqHDFCvASaP69',
      'description': 'Caffe Keyo Coffe & Eatery adalah Kafe keluarga dengan menu kopi berkualitas serta berbagai makanan berat yang cocok untuk makan bersama.',
      'menu': ['Kopi: Ice americano, vanilla latte.','Main Course: Beef burger, pasta carbonara.','Dessert: Brownies lava, affogato.']
    },

        {
      'name': 'Co.Sera',
      'image': 'assets/images/cosera.jpg',
      'logo': 'assets/images/logo_cosera.jpg',
      'address': 'Co.Sera, JL. Prof DR Sumantri Brojonegoro 119, Jambi, 36251, Payo Lebar, Kec. Jelutung, Kota Jambi, Jambi 36124',
      'location': 'https://g.co/kgs/tAWdTj2',
      'description': 'Co.Sera adalah sebuah kafe modern yang menghadirkan suasana hangat dan nyaman bagi para pelanggan. Dengan interior minimalis yang elegan, Co.Sera menjadi tempat ideal untuk bersantai, bekerja, atau menghabiskan waktu bersama teman dan keluarga. Kafe ini mengusung konsep "Coffee & Serenity," menawarkan pengalaman minum kopi yang menenangkan dan penuh inspirasi.Kami menggunakan biji kopi pilihan dari petani lokal yang diolah dengan penuh dedikasi oleh barista profesional. Selain itu, Co.Sera juga menyediakan berbagai pilihan makanan ringan dan berat yang cocok untuk segala suasana',
      'menu': ['Kopi: Espresso, Americano, Cappuccino, Latte.','Main Course: Churros with Chocolate Sauce, rench Fries with Cheese Dip, Croissant Butter.','Dessert: Lava Cake with Ice Cream, Cheesecake.']
    },
    // Data kafe lainnya tetap sama...
  ];

   String searchQuery = ""; // Query pencarian

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Map<String, dynamic>> get filteredCafes {
    if (searchQuery.isEmpty) {
      return cafes; // Jika query kosong, tampilkan semua data
    }
    return cafes
        .where((cafe) =>
            cafe['name'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList(); // Saring berdasarkan nama kafe
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logocaffe.png'),
              radius: 18,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 190, 92, 35),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari kafe...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // Update query pencarian
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search query: $searchQuery");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 4,
          ),
          itemCount: filteredCafes.length, // Gunakan daftar yang sudah difilter
          itemBuilder: (context, index) {
            final cafe = filteredCafes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeskripsiPage(
                      name: cafe['name'],
                      image: cafe['image'],
                      description: cafe['description'],
                      menu: List<String>.from(cafe['menu']),
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        child: Image.asset(
                          cafe['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(cafe['logo']),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cafe['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  cafe['address'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                TextButton.icon(
                                  onPressed: () => _launchURL(cafe['location']),
                                  icon: Icon(Icons.map, size: 16),
                                  label: Text('Maps'),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(30, 30),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
 bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Halaman beranda aktif
        onTap: (index) {
          if (index == 0) {
            // Tetap di halaman Beranda
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(), // Pindah ke halaman profil
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}