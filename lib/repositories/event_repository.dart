import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tampa_events/models/event.dart';

class EventsRepository {
  final List<Event> _events;

  EventsRepository(this._events);

  List<Event> get allEvents => _events;

  static Future<EventsRepository> loadFromFirebase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("events");

    DatabaseEvent databaseEvent = await ref.once();
    List<Event> events = [];
    // Check if the snapshot's value is a list
    if (databaseEvent.snapshot.value != null &&
        databaseEvent.snapshot.value is List) {
      List<dynamic> values =
          List<dynamic>.from(databaseEvent.snapshot.value as List);
      // Iterate over the list to convert each map into an Event object
      events = values
          .map((value) {
            if (value is Map<dynamic, dynamic>) {
              return Event.fromJson(Map<String, dynamic>.from(value));
            }
            return null;
          })
          .whereType<Event>()
          .where((event) =>
              event.image.isNotEmpty) // Exclude events with empty image URLs
          .toList(); // Filter out any nulls that might have been added
    } else {
      print("ERROR GETTING THE EVENTS :( ");
    }
    return EventsRepository(events);
  }

  // static Future<EventsRepository> loadFromFirebase() async {
  //   await Firebase.initializeApp();
  //   DatabaseReference ref = FirebaseDatabase.instance.ref("events");

  //   DatabaseEvent databaseEvent = await ref.once();
  //   List<Event> events = [];
  //   if (databaseEvent.snapshot.value != null && databaseEvent.snapshot.value is Map) {
  //     Map<dynamic, dynamic> values = Map<dynamic, dynamic>.from(databaseEvent.snapshot.value as Map);
  //     events = values.entries.map((entry) {
  //       return Event.fromJson(Map<String, dynamic>.from(entry.value));
  //     }).toList();
  //   }
  //   return EventsRepository(events);
  // }
}
