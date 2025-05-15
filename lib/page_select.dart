import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';

const String strapiUrl = 'http://localhost:1337';

class PageSelect extends StatelessWidget {
  final int articleIndex;
  const PageSelect({super.key, required this.articleIndex});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageSelectScreen(articleIndex: articleIndex),
    );
  }
}

class PageSelectScreen extends StatefulWidget {
  final int articleIndex;
  const PageSelectScreen({super.key, required this.articleIndex});

  @override
  _PageSelectScreenState createState() => _PageSelectScreenState();
}

class _PageSelectScreenState extends State<PageSelectScreen> {
  List articles = [];
  Map? selectedArticle;

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final String response = await DefaultAssetBundle.of(context).loadString('lib/temp/articles.json');
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
      appBar: AppBar(
        title: Text('Strapi + Flutter'),
      ),
      body: selectedArticle == null
          ? Center(child: CircularProgressIndicator())
          : Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 4),
                child: Column(
                  children: [
                    Text(
                      selectedArticle!['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 400,
                      width: 350,
                      child: selectedArticle!['blocks'] != null && (selectedArticle!['blocks'] as List).isNotEmpty
                          ? ListView(
                              children: [
                                for (final block in selectedArticle!['blocks'])
                                  if (block['__component'] == 'shared.rich-text')
                                    Html(data: block['body'] ?? '')
                                  else if (block['__component'] == 'shared.quote')
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.blue[200]!),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            block['body'] ?? '',
                                            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                                          ),
                                          if (block['title'] != null)
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text('- ${block['title']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                            ),
                                        ],
                                      ),
                                    )
                                  else
                                    SizedBox.shrink(),
                              ],
                            )
                          : Html(data: '${selectedArticle!['content']}'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}