class Event {
  final String id;
  final String name;
  final String description;
  final String image;
  final String startDate;
  final String endDate;
  final Location location;
  final String category;
  final List<String> tags;
  final bool isFree;
  final Map<String, dynamic> priceRange;
  final String url;
  final Organizer organizer;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.category,
    required this.tags,
    required this.isFree,
    required this.priceRange,
    required this.url,
    required this.organizer,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      location: Location.fromJson(json['location']),
      category: json['category'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      isFree: json['is_free'],
      priceRange: json['price_range'],
      url: json['url'],
      organizer: Organizer.fromJson(json['organizer']),
    );
  }
}

class Location {
  final String country;
  final String city;
  final String streetAddress;
  final String postalCode;
  final bool virtual;

  Location({
    required this.country,
    required this.city,
    required this.streetAddress,
    required this.postalCode,
    required this.virtual,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      city: json['city'],
      streetAddress: json['street_address'],
      postalCode: json['postal_code'],
      virtual: json['virtual'],
    );
  }
}

class Organizer {
  final String name;
  final String url;
  final String description;

  Organizer({
    required this.name,
    required this.url,
    required this.description,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      name: json['name'],
      url: json['url'],
      description: json['description'],
    );
  }
}
