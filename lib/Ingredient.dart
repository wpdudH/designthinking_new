import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient {
  final String name;
  final String expiration_date;
  final String count;
  final DocumentReference reference;

  Ingredient.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        expiration_date = map['expiration_date'],
        count = map['count'];

  Ingredient.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Ingredient<$name:$expiration_date>";
}
