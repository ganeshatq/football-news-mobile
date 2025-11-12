import 'package:flutter/material.dart';
import 'package:football_news/screens/menu.dart';
<<<<<<< HEAD
import 'package:football_news/screens/newslist_form.dart';
=======
import 'package:football_news/screens/newslist_form.dart'; // TODO: Impor halaman NewsFormPage jika sudah dibuat
import 'package:football_news/screens/news_entry_list.dart';
>>>>>>> 573c579 (Tutorial 8)

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
<<<<<<< HEAD
            decoration: BoxDecoration(color: Colors.blue),
=======
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
>>>>>>> 573c579 (Tutorial 8)
            child: Column(
              children: [
                Text(
                  'Football News',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Seluruh berita sepak bola terkini di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
<<<<<<< HEAD
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
=======
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
>>>>>>> 573c579 (Tutorial 8)
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add News'),
<<<<<<< HEAD
            // Bagian redirection ke NewsFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NewsFormPage()),
=======
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewsFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text('See News'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(), // TODO FOR LAB NEXT WEEK PROBABLY
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('News List'),
            onTap: () {
              // Route to news list page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewsEntryListPage()),
>>>>>>> 573c579 (Tutorial 8)
              );
            },
          ),
        ],
      ),
    );
  }
}