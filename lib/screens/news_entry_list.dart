import 'package:flutter/material.dart';
import 'package:football_news/models/news_entry.dart';
import 'package:football_news/widgets/left_drawer.dart';
import 'package:football_news/screens/news_detail.dart';
import 'package:football_news/widgets/news_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class NewsEntryListPage extends StatefulWidget {
  const NewsEntryListPage({super.key});

  @override
  State<NewsEntryListPage> createState() => _NewsEntryListPageState();
}

class _NewsEntryListPageState extends State<NewsEntryListPage> {
  Future<List<NewsEntry>> fetchNews(CookieRequest request) async {
    // GANTI URL INI SESUAI ENDPOINT JSON DI DJANGO
    // Jika pakai Flutter Web (Chrome), gunakan localhost
    // final response = await request.get('http://localhost:8000/football-news/json/');

    // Jika pakai emulator Android, gunakan 10.0.2.2
    final response =
        await request.get('http://localhost:8000/json/');

    // response sudah berupa List<dynamic> dari CookieRequest
    List<NewsEntry> listNews = [];
    for (var d in response) {
      if (d != null) {
        listNews.add(NewsEntry.fromJson(d));
      }
    }
    return listNews;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<NewsEntry>>(
        future: fetchNews(request),
        builder: (context, snapshot) {
          // 1. Masih loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Ada error dari request
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi error saat mengambil data:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          // 3. Tidak ada data
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'There are no news in football news yet.',
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          }

          // 4. Ada data → tampilkan list
          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) => NewsEntryCard(
              news: data[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailPage(
                      news: data[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
