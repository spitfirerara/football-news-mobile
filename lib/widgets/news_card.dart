import 'package:flutter/material.dart';
import 'package:football_news_mobile/screens/newslist_form.dart';
import 'package:football_news_mobile/screens/news_entry_list.dart';
import 'package:football_news_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function(BuildContext) onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Tambahkan CookieRequest agar bisa akses session Django
    final request = context.watch<CookieRequest>();

    return InkWell(
      onTap: () async {
        // Jalankan aksi default (navigasi atau snackbar)
        onTap(context);

        // ✅ Jika tombol ini adalah Logout
        if (label == "Logout") {
          // Ganti URL sesuai dengan backend kamu
          // Emulator Android: http://10.0.2.2:8000/
          // Chrome/Web: http://localhost:8000/
          final response = await request.logout(
            "http://localhost:8000/auth/logout/",
          );

          String message = response["message"];

          if (context.mounted) {
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("$message See you again, $uname."),
                ),
              );

              // Arahkan kembali ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            }
          }
        }
      },
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
