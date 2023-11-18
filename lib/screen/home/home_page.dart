import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/todo_item.dart';
import 'package:todo_list/screen/home/api_service.dart';
import 'package:todo_list/screen/home/api_service2.dart';
import 'package:todo_list/screen/home/page2.dart';
import 'package:todo_list/screen/home/page3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  List<Item>? _itemList;
  String? _error;

  void getTodo() async {
    try {
      setState(() {
        _error = null;
      });

      // await Future.delayed(const Duration(seconds: 3), () {});

      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/comments');
      debugPrint(response.data.toString());
      // parse
      List list = jsonDecode(response.data.toString());
      setState(() {
        _itemList = list.map((item) => Item.fromJson(item)).toList();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      debugPrint('เกิดข้อผิดพลาด: ${e.toString()}');
    }
  }

  @override //do it one time
  void initState() {
    super.initState();
    getTodo();
  }

  void handleClickGo() {
    // Navigate to Page2 when the button is clicked
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Page2(
                apiService: ApiService(),
              )),
    );
  }

  void handleClickGo2() {
    // Navigate to Page2 when the button is clicked
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Page3(
                apiService: ApiService2(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_error != null) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_error!),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              getTodo();
            },
            child: const Text('RETRY'),
          )
        ],
      );
    } else if (_itemList == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('../assets/images/profile1.jpg'),
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('AT069'),
                ),
              ],
            ),
            Image(
              image: AssetImage('../assets/images/02.jpg'),
              height: 400,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _itemList!.length,
                itemBuilder: (context, index) {
                  var doItem = _itemList![index];
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
                                        doItem.id.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Color.fromARGB(255, 204, 231, 255),
                                    ),
                                    Container(
                                      child: Text(
                                        '   ' + doItem.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text('    ' + doItem.body),
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: handleClickGo,
                    backgroundColor: Colors.blue,
                    child: Text(
                      'All Post',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: handleClickGo2,
                    backgroundColor: Colors.blue,
                    child: Text(
                      'Users',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(body: body);
  }
}
