class Book {
  final String id;
  final String title;
  final String authors;
  final String description;
  final String thumbnail;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnail,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? 'No title available',
      authors: (json['volumeInfo']['authors'] as List?)?.join(', ') ??
          'Unknown authors',
      description:
          json['volumeInfo']['description'] ?? 'No description available',
      thumbnail: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
    );
  }
}
