// To parse this JSON data, do
//
//     final quranEntry = quranEntryFromJson(jsonString);

import 'dart:convert';

List<QuranEntry> quranEntryFromJson(String str) => List<QuranEntry>.from(json.decode(str).map((x) => QuranEntry.fromJson(x)));

String quranEntryToJson(List<QuranEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuranEntry {
    String model;
    String pk;
    Fields fields;

    QuranEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory QuranEntry.fromJson(Map<String, dynamic> json) => QuranEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int stock;
    String publisher;
    String type;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.stock,
        required this.publisher,
        required this.type,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        stock: json["stock"],
        publisher: json["publisher"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "stock": stock,
        "publisher": publisher,
        "type": type,
    };
}
