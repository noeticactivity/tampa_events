import 'package:flutter/material.dart';
import 'package:tampa_events/repositories/event_repository.dart';

class EventsPage extends StatelessWidget {
  final EventsRepository eventsRepository =
      EventsRepository([]); // Placeholder for actual repository initialization

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events')),
      body: FutureBuilder<EventsRepository>(
        future: EventsRepository.loadFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }
          final events = snapshot.data!.allEvents;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return ListTile(
                title: Text(event.name),
                subtitle: Text(event.description),
                leading: Image.network(event.image, width: 100),
              );
            },
          );
        },
      ),
    );
  }
}
