class Category {
  final String title;
  final String iconUrl;

  Category({
    required this.title,
    required this.iconUrl,
  });

  // Add fromJson method to convert JSON into Category object
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'] as String,  // Ensure 'title' is present in JSON
      iconUrl: json['iconUrl'] as String,  // Ensure 'iconUrl' is present in JSON
    );
  }
}