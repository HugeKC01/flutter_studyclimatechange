import 'package:climatechange/checkpoint/checkpoint.dart';
import 'package:climatechange/checkpoint/page_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String strapiUrl = 'http://localhost:1337';

class PageSelect extends StatelessWidget {
  final String bookId;
  const PageSelect({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF8F8F8), // Soft white
      ),
      home: PageSelectScreen(bookId: bookId),
    );
  }
}

class PageSelectScreen extends StatefulWidget {
  final String bookId;
  const PageSelectScreen({super.key, required this.bookId});

  @override
  _PageSelectScreenState createState() => _PageSelectScreenState();
}

class _PageSelectScreenState extends State<PageSelectScreen> {
  List books = [];

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final response =
        await http.get(Uri.parse('$strapiUrl/api/books?populate=*'));
    if (response.statusCode == 200) {
      //print('Raw API Response: ${jsonEncode(response.body)}');
      final data = jsonDecode(response.body)['data'];
      // filter by  book_id
      final filtered = data.where((books) => books['book_id'] == widget.bookId).toList();
      setState(() {
        books = filtered;
      });
    }
  }

  @override
    Widget build(BuildContext context) {
      if (books.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF8F8F8),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(_createPopupRoute());
              },
            ),
          ),
          body: Center(child: CircularProgressIndicator()),
        );
      }

      var book = books[0];
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFF8F8F8),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(_createPopupRoute());
              },
            ),
          ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              child: SizedBox(
                height: 200,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWide = constraints.maxWidth > 600;
                    return Row(
                      children: [
                      Expanded(
                        flex: isWide ? 1 : 1,
                        child: Image.network(
                          '$strapiUrl${book['cover']['url']}',
                          height: 200,
                          //fit: BoxFit.contain,
                          fit: BoxFit.cover, //crop image but will fill card which looks good
                        ),
                      ),
                      Expanded(
                        flex: isWide ? 3 : 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                //color: Colors.deepOrange,
                                child: ScaleDownText(
                                  text: book['title'] ?? '',
                                  //text: 'TopicTopicTopicTopicTopicTopicTopicTopicTopicTopicTopicTopicTopicTopicTopicTopicTopic',
                                  maxFontSize: 18,
                                  minFontSize: 6,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                //color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    book['description'] ?? '',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    );
                  }
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: ListView.builder(
                    itemCount: book['num_chapter'] ?? 0,
                    itemBuilder: (context, index) {
                      //var book = books[index];
                      //debugPrint(book.toString());
                      return Card(
                        color: Color.fromARGB(255, 247, 243, 243),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => PageContent(bookId: book['book_id'] ?? '')),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0).copyWith(top: 4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Chapter ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

  Route _createPopupRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MainApp(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
    );
  }


}

class ScaleDownText extends StatelessWidget {
  final String text;
  final double maxFontSize;
  final double minFontSize;
  final int maxLines;
  final TextStyle? style;

  const ScaleDownText({
    super.key,
    required this.text,
    this.maxFontSize = 18,
    this.minFontSize = 10,
    this.maxLines = 3,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = maxFontSize;
        span(double size) => TextSpan(
              text: text,
              style: style?.copyWith(fontSize: size) ?? TextStyle(fontSize: size),
            );
        tp(double size) => TextPainter(
              text: span(size),
              maxLines: maxLines,
              textDirection: TextDirection.ltr,
              ellipsis: '…',
            )..layout(maxWidth: constraints.maxWidth);

        // Try to find the largest font size that fits in 3 lines
        while (fontSize > minFontSize) {
          final painter = tp(fontSize);
          if (!painter.didExceedMaxLines) break;
          fontSize -= 1;
        }

        return Text(
          text,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
        );
      },
    );
  }
}