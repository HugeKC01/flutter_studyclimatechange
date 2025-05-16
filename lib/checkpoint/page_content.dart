import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:climatechange/checkpoint/page_select.dart';
import 'package:climatechange/checkpoint/checkpoint.dart';

const String strapiUrl = 'http://localhost:1337';

Color appBarColor = Color(0xFFF8F8F8);

class PageContent extends StatelessWidget {
  final String bookId;
  const PageContent({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      scaffoldBackgroundColor: Color(0xFFF8F8F8), // Soft white
    ),
      home: PageContentScreen(bookId: bookId),
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
      backgroundColor: appBarColor,
      appBar: AppBar(
            backgroundColor: appBarColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(_createPopupRoute(PageSelect(bookId: widget.bookId)));
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
  //var bookId = 

  //remove background
  content = removeBackgroundStyles(content);
  // Split into a list of pages
  List<String> pages = content.split('<strong>&lt;endpage&gt;</strong>');

  // Optionally, trim whitespace from each page
  pages = pages.map((e) => e.trim()).toList();

  if (Theme.of(context).platform == TargetPlatform.android) {
    content = content.replaceAll('http://localhost:1337', 'http://10.0.2.2:1337');
  }
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    content = content.replaceAll('http://localhost:1337', '127.0.0.1');
  }

  /* final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    content = '<div style="columns:2; -webkit-columns:2; -moz-columns:2; column-gap:20px;">$content</div>';
  } */

  return Scaffold(
    appBar: AppBar(
      backgroundColor: appBarColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).push(_createPopupRoute(PageSelect(bookId: widget.bookId)));
        },
      ),
    ),
    body: ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: pages.length + 1, // +1 for the title at the top
      itemBuilder: (context, index) {
        if (index == 0) {
          // Show the title at the top
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'JS-Jindara',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        // Show each page as HTML
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: HtmlWidget(
                pages[index - 1],
                textStyle: TextStyle(
                  fontFamily: 'JS-Jindara',
                  fontSize: 25,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
  }

  Route _createPopupRoute(Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
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

  String removeBackgroundStyles(String html) {
    // Remove inline background-color styles
    final bgStyleRegex = RegExp(r'background(-color)?:\s*[^;"]+;?', caseSensitive: false);
    return html.replaceAllMapped(bgStyleRegex, (match) => '');
  }
}