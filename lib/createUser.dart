import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";

void CreateUser(String id, String password, String nickname){
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection('UserID').doc(nickname).set({'Id': id,'Password': password,'Nickname': nickname});
}

