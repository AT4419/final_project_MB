import 'package:flutter/material.dart';
import '../../models/item_post.dart';
import 'api_service.dart';

class Page2 extends StatefulWidget {
  final ApiService apiService;

  Page2({required this.apiService});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late Future<List<ItemPost>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = widget.apiService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Post'),
      ),
      body: Center(
        child: FutureBuilder<List<ItemPost>>(
          future: _posts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No data available');
            } else {
              List<ItemPost> posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  ItemPost post = posts[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        post.id.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Color.fromARGB(255, 204, 231, 255),
                                    ),
                                    Container(
                                      child: Text(
                                        '   ' + post.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text('    ' + post.body),
                                      margin: EdgeInsets.all(10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page2(apiService: apiService),
    );
  }
}
