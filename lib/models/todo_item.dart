// {
//   "postId": 1,
//   "id": 1,
//   "name": "id labore ex et quam laborum",
//   "email": "Eliseo@gardner.biz",
//   "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
// },

import 'dart:html';

class Item {
  //final String useId;
  final int id;
  final String name;
  final String email;
  final String body;

  Item(
      {
      //required this.useId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory Item.fromJson(Map<String, dynamic> json) {
    //factory constructor
    return Item(
      //useId: json['useId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}

// class Item {
//   final String message;
//   final 

//   Item(
//       {
//       //required this.useId,
//       required this.id,
//       required this.title,
//       required this.body
//       });

//   factory Item.fromJson(Map<String, dynamic> json) {
//     //factory constructor
//     return Item(
//       //useId: json['useId'],
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }
