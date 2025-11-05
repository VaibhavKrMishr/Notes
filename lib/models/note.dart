class Note {
  int? id;
  String title;
  String content;
  int timestamp;

  Note({this.id, required this.title, required this.content, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'timestamp': timestamp,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      timestamp: map['timestamp'],
    );
  }
}