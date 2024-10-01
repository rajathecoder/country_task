// lib/models/country.dart

class Country {
  final Name name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Map<String, Currency> currencies; // Non-nullable with default empty map
  final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Map<String, String> languages; // Non-nullable with default empty map
  final Map<String, Translation> translations; // Non-nullable with default empty map
  final List<double> latlng;
  final bool landlocked;
  final List<String> borders;
  final double area;
  final Demonyms demonyms;
  final String flag;
  final Maps maps;
  final int population;
  final Map<String, double> gini; // Non-nullable with default empty map
  final String fifa;
  final Car car;
  final List<String> timezones;
  final List<String> continents;
  final Flag flags;
  final CoatOfArms coatOfArms;
  final String startOfWeek;
  final CapitalInfo capitalInfo;
  final PostalCode postalCode;

  Country({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: Name.fromJson(json['name'] ?? {}),
      tld: List<String>.from(json['tld'] ?? []),
      cca2: json['cca2'] ?? '',
      ccn3: json['ccn3'] ?? '',
      cca3: json['cca3'] ?? '',
      cioc: json['cioc'] ?? '',
      independent: json['independent'] ?? false,
      status: json['status'] ?? '',
      unMember: json['unMember'] ?? false,
      currencies: (json['currencies'] != null)
          ? (json['currencies'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, Currency.fromJson(value)),
      )
          : {}, // Default to empty map if null
      idd: Idd.fromJson(json['idd'] ?? {}),
      capital: List<String>.from(json['capital'] ?? []),
      altSpellings: List<String>.from(json['altSpellings'] ?? []),
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      languages: (json['languages'] != null)
          ? Map<String, String>.from(json['languages'])
          : {}, // Default to empty map if null
      translations: (json['translations'] != null)
          ? (json['translations'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, Translation.fromJson(value)),
      )
          : {}, // Default to empty map if null
      latlng: List<double>.from(json['latlng'] ?? []),
      landlocked: json['landlocked'] ?? false,
      borders:
      (json['borders'] != null) ? List<String>.from(json['borders']) : [],
      area: (json['area'] ?? 0).toDouble(),
      demonyms: json['demonyms'] != null
          ? Demonyms.fromJson(json['demonyms'])
          : Demonyms(eng: Demonym(f: 'N/A', m: 'N/A'), fra: Demonym(f: 'N/A', m: 'N/A')),
      flag: json['flag'] ?? '',
      maps: Maps.fromJson(json['maps'] ?? {}),
      population: json['population'] ?? 0,
      gini: (json['gini'] != null)
          ? Map<String, double>.from(json['gini'])
          : {}, // Default to empty map if null
      fifa: json['fifa'] ?? '',
      car: Car.fromJson(json['car'] ?? {}),
      timezones: List<String>.from(json['timezones'] ?? []),
      continents: List<String>.from(json['continents'] ?? []),
      flags: Flag.fromJson(json['flags'] ?? {}),
      coatOfArms: CoatOfArms.fromJson(json['coatOfArms'] ?? {}),
      startOfWeek: json['startOfWeek'] ?? '',
      capitalInfo: CapitalInfo.fromJson(json['capitalInfo'] ?? {}),
      postalCode: PostalCode.fromJson(json['postalCode'] ?? {}),
    );
  }
}

class Name {
  final String common;
  final String official;
  final Map<String, NativeName> nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'] ?? 'N/A',
      official: json['official'] ?? 'N/A',
      nativeName: (json['nativeName'] != null)
          ? (json['nativeName'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, NativeName.fromJson(value)),
      )
          : {}, // Default to empty map if null
    );
  }
}

class NativeName {
  final String official;
  final String common;

  NativeName({
    required this.official,
    required this.common,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) {
    return NativeName(
      official: json['official'] ?? 'N/A',
      common: json['common'] ?? 'N/A',
    );
  }
}

class Currency {
  final String name;
  final String symbol;

  Currency({
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'] ?? 'N/A',
      symbol: json['symbol'] ?? '',
    );
  }
}

class Idd {
  final String root;
  final List<String> suffixes;

  Idd({
    required this.root,
    required this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) {
    return Idd(
      root: json['root'] ?? '',
      suffixes: List<String>.from(json['suffixes'] ?? []),
    );
  }
}

class Translation {
  final String official;
  final String common;

  Translation({
    required this.official,
    required this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      official: json['official'] ?? 'N/A',
      common: json['common'] ?? 'N/A',
    );
  }
}

class Demonyms {
  final Demonym eng;
  final Demonym fra;

  Demonyms({
    required this.eng,
    required this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) {
    return Demonyms(
      eng: json['eng'] != null
          ? Demonym.fromJson(json['eng'])
          : Demonym(f: 'N/A', m: 'N/A'),
      fra: json['fra'] != null
          ? Demonym.fromJson(json['fra'])
          : Demonym(f: 'N/A', m: 'N/A'),
    );
  }
}

class Demonym {
  final String f;
  final String m;

  Demonym({
    required this.f,
    required this.m,
  });

  factory Demonym.fromJson(Map<String, dynamic> json) {
    return Demonym(
      f: json['f'] ?? 'N/A',
      m: json['m'] ?? 'N/A',
    );
  }
}

class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      googleMaps: json['googleMaps'] ?? '',
      openStreetMaps: json['openStreetMaps'] ?? '',
    );
  }
}

class Car {
  final List<String> signs;
  final String side;

  Car({
    required this.signs,
    required this.side,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      signs: List<String>.from(json['signs'] ?? []),
      side: json['side'] ?? 'right',
    );
  }
}

class Flag {
  final String png;
  final String svg;
  final String alt;

  Flag({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(
      png: json['png'] ?? '',
      svg: json['svg'] ?? '',
      alt: json['alt'] ?? '',
    );
  }
}

class CoatOfArms {
  final String png;
  final String svg;

  CoatOfArms({
    required this.png,
    required this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) {
    return CoatOfArms(
      png: json['png'] ?? '',
      svg: json['svg'] ?? '',
    );
  }
}

class CapitalInfo {
  final List<double> latlng;

  CapitalInfo({
    required this.latlng,
  });

  factory CapitalInfo.fromJson(Map<String, dynamic> json) {
    return CapitalInfo(
      latlng: List<double>.from(json['latlng'] ?? []),
    );
  }
}

class PostalCode {
  final String format;
  final String regex;

  PostalCode({
    required this.format,
    required this.regex,
  });

  factory PostalCode.fromJson(Map<String, dynamic> json) {
    return PostalCode(
      format: json['format'] ?? '',
      regex: json['regex'] ?? '',
    );
  }
}
