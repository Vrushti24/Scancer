import 'dart:convert';
import 'package:flutter/foundation.dart';

class Result {
  List<String> date;
  List<String> event;
  List<String> official;
  List<String> org;
  List<String> person;
  List<String> toc;
  Result({
    required this.date,
    required this.event,
    required this.official,
    required this.org,
    required this.person,
    required this.toc,
  });

  Result copyWith({
    List<String>? date,
    List<String>? event,
    List<String>? official,
    List<String>? org,
    List<String>? person,
    List<String>? toc,
  }) {
    return Result(
      date: date ?? this.date,
      event: event ?? this.event,
      official: official ?? this.official,
      org: org ?? this.org,
      person: person ?? this.person,
      toc: toc ?? this.toc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'DATE': date,
      'EVENT': event,
      'OFFICIAL': official,
      'ORG': org,
      'PERSON': person,
      'TOC': toc,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      date: List<String>.from(map['DATE']),
      event: List<String>.from(map['EVENT']),
      official: List<String>.from(map['OFFICIAL']),
      org: List<String>.from(map['ORG']),
      person: List<String>.from(map['PERSON']),
      toc: List<String>.from(map['TOC']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(date: $date, event: $event, official: $official, org: $org, person: $person, toc: $toc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Result &&
        listEquals(other.date, date) &&
        listEquals(other.event, event) &&
        listEquals(other.official, official) &&
        listEquals(other.org, org) &&
        listEquals(other.person, person) &&
        listEquals(other.toc, toc);
  }
}
