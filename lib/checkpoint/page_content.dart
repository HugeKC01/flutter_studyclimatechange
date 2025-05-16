import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:climatechange/checkpoint/page_select.dart';
import 'package:climatechange/checkpoint/checkpoint.dart';

const String strapiUrl = 'http://localhost:1337';

class PageContent extends StatelessWidget {
  final String bookId;
  const PageContent({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      scaffoldBackgroundColor: Color(0xFFF8F8F8), // Soft white
    ),
      home: PageContentScreen(bookId: bookId,),
    );
  }
}

class PageContentScreen extends StatefulWidget {
  final String bookId;
  const PageContentScreen({super.key, required this.bookId});

  @override
  _PageContentScreenState createState() => _PageContentScreenState();
}

class _PageContentScreenState extends State<PageContentScreen> {
  List book_contents = [];

  @override
  void initState() {
    super.initState();
    fetchbooks();
  }

  Future<void> fetchbooks() async {
    final response =
        await http.get(Uri.parse('$strapiUrl/api/book-contents?populate=book'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      print('Fetched data: $data');
      print('Looking for bookId: ${widget.bookId}');
      // Filter by bookId
      final filtered = data.where((item) => item['book']['book_id'] == '${widget.bookId}').toList();
      print('Filtered: $filtered');
      setState(() {
        book_contents = filtered;
      });
    }
}

  @override
  Widget build(BuildContext context) {
  if (book_contents.isEmpty || book_contents[0]?['content'] == null) {
    return Scaffold(
      appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(_createPopupRoute());
              },
            ),
          ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  var content = book_contents[0]['content'];
  var title = book_contents[0]['book']['title'];
  if (Theme.of(context).platform == TargetPlatform.android) {
    content = content.replaceAll('http://localhost:1337', 'http://10.0.2.2:1337');
  }
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    content = content.replaceAll('http://localhost:1337', '127.0.0.1');
  }

  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    content = '<div style="columns:2; -webkit-columns:2; -moz-columns:2; column-gap:20px;">$content</div>';
  }

  return Scaffold(
    appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(_createPopupRoute());
            },
          ),
        ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'JS-Jindara',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              //color: Colors.amber,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: HtmlWidget(
                  content,
                  textStyle: TextStyle(
                    fontFamily: 'JS-Jindara',
                    fontSize: 25,
                  ),
                  ),
              ),
            ),
          ),
        ],
      ),
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