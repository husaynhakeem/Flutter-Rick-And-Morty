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
        name = valueOrDefaultValue(jsonMap['name']),
        status = valueOrDefaultValue(jsonMap['status']),
        species = valueOrDefaultValue(jsonMap['species']),
        type = valueOrDefaultValue(jsonMap['type']),
        gender = valueOrDefaultValue(jsonMap['gender']),
        origin = Origin.fromJson(jsonMap['origin']),
        location = Location.fromJson(jsonMap['location']),
        image = valueOrDefaultValue(jsonMap['image']),
        assert (origin != null),
        assert (location != null);
}

class Origin {

  final String name;

  Origin.fromJson(Map jsonMap)
      : name = valueOrDefaultValue(jsonMap['name']);
}

class Location {

  final String name;

  Location.fromJson(Map jsonMap)
      : name = valueOrDefaultValue(jsonMap['name']);
}

String valueOrDefaultValue(String value) {
  return (value == null || value.isEmpty) ? "-" : value;
}