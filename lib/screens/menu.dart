import 'package:flutter/material.dart';
import 'package:football_news_mobile/widgets/left_drawer.dart';
import 'package:football_news_mobile/widgets/news_card.dart';
import 'package:football_news_mobile/screens/newslist_form.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    'Football News',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  centerTitle: true, // judul di tengah
  backgroundColor: Theme.of(context).colorScheme.primary,
  foregroundColor: Colors.white,
),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // === Informasi Mahasiswa ===
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  InfoCard(title: "NPM", value: "2406433112"),
                  InfoCard(title: "Name", value: "Naira Ammara Putri"),
                  InfoCard(title: "Class", value: "B"),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                "Selamat datang di Football News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),

              // === Tombol Menu ===
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  // Tombol 1: See Football News
                  MenuCard(
                    icon: Icons.list,
                    label: "See Football News",
                    onTap: (context) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Kamu telah menekan tombol See Football News!"),
                          ),
                        );
                      // TODO: Navigasi ke halaman list berita (belum dibuat)
                    },
                  ),

                  // Tombol 2: Add News
                  MenuCard(
                    icon: Icons.add,
                    label: "Add News",
                    onTap: (context) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                              content:
                              Text("Kamu telah menekan tombol Add News!")),
                        );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewsFormPage(),
                        ),
                      );
                    },
                  ),

                  // Tombol 3: Logout
                  MenuCard(
                    icon: Icons.logout,
                    label: "Logout",
                    onTap: (context) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                              content: Text("Kamu telah menekan tombol Logout!")),
                        );
                      // TODO: Tambahkan aksi logout nanti
                    },
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

// === Widget InfoCard (Kartu Identitas) ===
class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
