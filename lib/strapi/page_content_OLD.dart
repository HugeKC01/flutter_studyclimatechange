import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../component/appbar.dart';

const String strapiUrl = 'http://localhost:1337';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArticleScreen(articleIndex: 0),
    );
  }
}

class ArticleScreen extends StatefulWidget {
  final int articleIndex;
  const ArticleScreen({super.key, required this.articleIndex});

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  List articles = [];
  Map? selectedArticle;

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
      if (widget.articleIndex >= 0 && widget.articleIndex < articles.length) {
        selectedArticle = articles[widget.articleIndex];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        selectedArticle != null && selectedArticle!['title'] != null
            ? selectedArticle!['title']
            : 'Strapi + Flutter',
        context,
      ),
      body: selectedArticle == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (selectedArticle!['cover'] != null && selectedArticle!['cover']['url'] != null)
                            Image.network('$strapiUrl${selectedArticle!['cover']['url']}'),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedArticle!['title'],
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(selectedArticle!['description'] ?? ''),
                                SizedBox(height: 10),
                                if (selectedArticle!['blocks'] != null && (selectedArticle!['blocks'] as List).isNotEmpty)
                                  ...List<Widget>.from(
                                    (selectedArticle!['blocks'] as List).map((block) {
                                      if (block == null || block['__component'] == null) return SizedBox.shrink();
                                      switch (block['__component']) {
                                        case 'shared.rich-text':
                                          return Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(12),
                                            margin: EdgeInsets.only(top: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Colors.grey[300]!)),
                                            child: Text(
                                              block['body']?.toString() ?? '',
                                              style: TextStyle(fontSize: 16, color: Colors.black87),
                                            ),
                                          );
                                        case 'shared.quote':
                                          return Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(top: 12, bottom: 12),
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.blue[50],
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Colors.blue[200]!)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  block['body']?.toString() ?? '',
                                                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                                                ),
                                                if (block['title'] != null)
                                                  Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Text('- ${block['title']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                                  ),
                                              ],
                                            ),
                                          );
                                        default:
                                          return SizedBox.shrink();
                                      }
                                    })
                                  ),
                                if (selectedArticle!['content'] != null)
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.only(top: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey[300]!),
                                    ),
                                    child: Text(
                                      selectedArticle!['content'],
                                      style: TextStyle(fontSize: 16, color: Colors.black87),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}