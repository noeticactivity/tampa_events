import 'package:flutter/material.dart';
import 'package:tampa_events/models/event.dart'; // Make sure this import points to your Event model

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            event.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200, // Fixed height for the card's image
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Icon(Icons.favorite_border), // Heart icon
              color: Colors.red,
              onPressed: () {
                // TODO: Implement favorite/unfavorite logic
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'attending - ${event.location.city}, ${event.location.country}',
                  style: TextStyle(color: Colors.white),
                ),
                // Add more details as required
              ],
            ),
          ),
        ],
      ),
    );
  }
}
