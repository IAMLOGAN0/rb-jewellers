class Notifications {
  final String title;
  final String message;
  final String dateTime;

  Notifications({required this.title, required this.message, required this.dateTime});

  factory Notifications.fromMap(Map<String, dynamic> data) {
    return Notifications(
      title: data['title'] ?? '',
      message: data['message'] ?? '',
      dateTime: data['dateTime'] ?? '',
    );
  }
}
