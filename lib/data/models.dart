class Character {

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;

  Character.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        status = jsonMap['status'],
        species = jsonMap['species'],
        type = jsonMap['type'],
        gender = jsonMap['gender'],
        origin = Origin.fromJson(jsonMap['origin']),
        location = Location.fromJson(jsonMap['location']),
        image = jsonMap['image'],
        assert(id != null),
        assert(name != null),
        assert(status != null),
        assert(species != null),
        assert(type != null),
        assert(gender != null),
        assert(origin != null),
        assert(location != null),
        assert(image != null);
}

class Origin {

  final String name;

  Origin.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        assert(name != null);
}

class Location {

  final String name;

  Location.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        assert(name != null);
}