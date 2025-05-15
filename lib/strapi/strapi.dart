import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'page_select.dart';

const String strapiUrl = 'http://localhost:1337';

double imageWidth = 200.0;
double imageHeight = 100.0;

double gridCrossAxisSpacing = 10.0;

double coverImagePadding = gridCrossAxisSpacing * 0.8;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArticleScreen(),
    );
  }
}

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  List articles = [];
  Map<String, List> articlesByCategory = {};

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final String response = await rootBundle.loadString('lib/temp/articles.json');
    final data = jsonDecode(response)['data'];
    setState(() {
      articles = data;
      articlesByCategory = {};
      for (var article in articles) {
        final category = article['category']?['name'] ?? 'Uncategorized';
        if (!articlesByCategory.containsKey(category)) {
          articlesByCategory[category] = [];
        }
        articlesByCategory[category]!.add(article);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Strapi + Flutter')),
      body: articlesByCategory.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: articlesByCategory.entries.map((entry) {
                final category = entry.key;
                final categoryArticles = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Text(
                        category,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      ),
                      itemCount: categoryArticles.length,
                      itemBuilder: (context, index) {
                        var article = categoryArticles[index];
                        final coverUrl = article['cover'] != null && article['cover']['url'] != null
                            ? '$strapiUrl${article['cover']['url']}'
                            : null;
                        return Card(
                          shadowColor: Colors.cyan[200],
                          elevation: 4.0,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Stack(
                            children: [
                              coverUrl != null
                                  ? Image.network(
                                      coverUrl,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Container(
                                        height: 200,
                                        color: Colors.grey[300],
                                        child: Icon(Icons.broken_image, size: 48, color: Colors.grey[600]),
                                      ),
                                    )
                                  : Container(
                                      height: 200,
                                      color: Colors.grey[300],
                                      child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey[600]),
                                    ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  color: Colors.black38,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          article['title'],
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          article['description'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      final articleIndex = articles.indexOf(article);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PageSelect(articleIndex: articleIndex),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
    );
  }
}