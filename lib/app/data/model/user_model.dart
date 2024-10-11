class UserModel {
  final String? gender;
  final Name? name;
  final Location? location;
  final String? email;
  final Login? login;
  final Dob? dob;
  final Registered? registered;
  final String? phone;
  final String? cell;
  final Id? id;
  final Picture? picture;
  final String? nat;

  UserModel({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : gender = json['gender'] as String?,
        name = (json['name'] as Map<String, dynamic>?) != null
            ? Name.fromJson(json['name'] as Map<String, dynamic>)
            : null,
        location = (json['location'] as Map<String, dynamic>?) != null
            ? Location.fromJson(json['location'] as Map<String, dynamic>)
            : null,
        email = json['email'] as String?,
        login = (json['login'] as Map<String, dynamic>?) != null
            ? Login.fromJson(json['login'] as Map<String, dynamic>)
            : null,
        dob = (json['dob'] as Map<String, dynamic>?) != null ? Dob.fromJson(json['dob'] as Map<String, dynamic>) : null,
        registered = (json['registered'] as Map<String, dynamic>?) != null
            ? Registered.fromJson(json['registered'] as Map<String, dynamic>)
            : null,
        phone = json['phone'] as String?,
        cell = json['cell'] as String?,
        id = (json['id'] as Map<String, dynamic>?) != null ? Id.fromJson(json['id'] as Map<String, dynamic>) : null,
        picture = (json['picture'] as Map<String, dynamic>?) != null
            ? Picture.fromJson(json['picture'] as Map<String, dynamic>)
            : null,
        nat = json['nat'] as String?;

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'name': name?.toJson(),
        'location': location?.toJson(),
        'email': email,
        'login': login?.toJson(),
        'dob': dob?.toJson(),
        'registered': registered?.toJson(),
        'phone': phone,
        'cell': cell,
        'id': id?.toJson(),
        'picture': picture?.toJson(),
        'nat': nat
      };
}

class Name {
  final String? title;
  final String? first;
  final String? last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  Name.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        first = json['first'] as String?,
        last = json['last'] as String?;

  Map<String, dynamic> toJson() => {'title': title, 'first': first, 'last': last};
}

class Location {
  final Street? street;
  final String? city;
  final String? state;
  final String? country;
  final dynamic postcode;
  final Coordinates? coordinates;
  final Timezone? timezone;

  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  Location.fromJson(Map<String, dynamic> json)
      : street = (json['street'] as Map<String, dynamic>?) != null
            ? Street.fromJson(json['street'] as Map<String, dynamic>)
            : null,
        city = json['city'] as String?,
        state = json['state'] as String?,
        country = json['country'] as String?,
        postcode = json['postcode'] as dynamic,
        coordinates = (json['coordinates'] as Map<String, dynamic>?) != null
            ? Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>)
            : null,
        timezone = (json['timezone'] as Map<String, dynamic>?) != null
            ? Timezone.fromJson(json['timezone'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'street': street?.toJson(),
        'city': city,
        'state': state,
        'country': country,
        'postcode': postcode,
        'coordinates': coordinates?.toJson(),
        'timezone': timezone?.toJson()
      };
}

class Street {
  final int? number;
  final String? name;

  Street({
    this.number,
    this.name,
  });

  Street.fromJson(Map<String, dynamic> json)
      : number = json['number'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'number': number, 'name': name};
}

class Coordinates {
  final String? latitude;
  final String? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  Coordinates.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'] as String?,
        longitude = json['longitude'] as String?;

  Map<String, dynamic> toJson() => {'latitude': latitude, 'longitude': longitude};
}

class Timezone {
  final String? offset;
  final String? description;

  Timezone({
    this.offset,
    this.description,
  });

  Timezone.fromJson(Map<String, dynamic> json)
      : offset = json['offset'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {'offset': offset, 'description': description};
}

class Login {
  final String? uuid;
  final String? username;
  final String? password;
  final String? salt;
  final String? md5;
  final String? sha1;
  final String? sha256;

  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  Login.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] as String?,
        username = json['username'] as String?,
        password = json['password'] as String?,
        salt = json['salt'] as String?,
        md5 = json['md5'] as String?,
        sha1 = json['sha1'] as String?,
        sha256 = json['sha256'] as String?;

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'username': username,
        'password': password,
        'salt': salt,
        'md5': md5,
        'sha1': sha1,
        'sha256': sha256
      };
}

class Dob {
  final String? date;
  final int? age;

  Dob({
    this.date,
    this.age,
  });

  Dob.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String?,
        age = json['age'] as int?;

  Map<String, dynamic> toJson() => {'date': date, 'age': age};
}

class Registered {
  final String? date;
  final int? age;

  Registered({
    this.date,
    this.age,
  });

  Registered.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String?,
        age = json['age'] as int?;

  Map<String, dynamic> toJson() => {'date': date, 'age': age};
}

class Id {
  final String? name;
  final String? value;

  Id({
    this.name,
    this.value,
  });

  Id.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        value = json['value'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'value': value};
}

class Picture {
  final String? large;
  final String? medium;
  final String? thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  Picture.fromJson(Map<String, dynamic> json)
      : large = json['large'] as String?,
        medium = json['medium'] as String?,
        thumbnail = json['thumbnail'] as String?;

  Map<String, dynamic> toJson() => {'large': large, 'medium': medium, 'thumbnail': thumbnail};
}
