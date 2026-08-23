class Eventss {
  final String id;
  final String name;
  final String graphicType;
  final String expDate;
  final String imageLink;
  final String videoLink;
  final String createdAt;

  Eventss({
    required this.id,
    required this.name,
    required this.graphicType,
    required this.expDate,
    required this.imageLink,
    required this.videoLink,
    required this.createdAt,
  });

  // Factory constructor to convert Firestore document to Event object
  factory Eventss.fromMap(Map<String, dynamic> map, String documentId) {
    return Eventss(
      id: documentId,
      name: map['name'] as String,
      graphicType: map['graphic_type'] as String,
      expDate: map['exp_date'] as String,
      imageLink: map['image_link'] as String,
      videoLink: map['video_link'] as String,
      createdAt: map['createdAt'] as String,
    );
  }
}