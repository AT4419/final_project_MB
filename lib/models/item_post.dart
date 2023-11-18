class ItemPost {
  final int id;
  final String title;
  final String body;

  ItemPost({
    required this.id,
    required this.title,
    required this.body,
  });

  factory ItemPost.fromJson(Map<String, dynamic> json) {
    return ItemPost(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
