import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/events.dart';

class EventRepository {
  final CollectionReference eventsCollection = FirebaseFirestore.instance.collection('events');

  Future<List<Eventss>> fetchEvents() async {
    try {
      final QuerySnapshot snapshot = await eventsCollection.get();

      List<Eventss> eventsList = snapshot.docs.map((doc) {
        return Eventss.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      return eventsList;
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }
}