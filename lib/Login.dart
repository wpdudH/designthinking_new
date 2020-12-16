import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "./mmainpage.dart";


class Login{

  Future<List<String>> MakeResource() {
    List<String> id = [];
    FirebaseFirestore.instance.collection('UserID').get().then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) {
        id.add(doc["Id"]);
      })
    });
    return Future.delayed(Duration(seconds: 1), () => id);
  }

  Future<List<String>> MakeResource1() {
    List<String> password = [];
    FirebaseFirestore.instance.collection('UserID').get().then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) {
        password.add(doc["Password"]);
      })
    });
    return Future.delayed(Duration(seconds: 1), () => password);
  }

  Future<List<String>> MakeResource2(){
    List<String> nickname = [];
    FirebaseFirestore.instance.collection('UserID').get().then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) {
        nickname.add(doc["Nickname"]);
      })
    });
    return Future.delayed(Duration(seconds: 1), () => nickname);
  }

  Future<String> CheckIn(String Id, String Password) async{
    List<String> id = [];
    List<String> password = [];
    List<String> nickname = [];

    id = await MakeResource();
    password = await MakeResource1();
    nickname = await MakeResource2();

    if (id.contains(Id) && password.contains(Password))
    {
      int index = id.indexOf(Id);
      return nickname[index];
    }
    else{
      return "null";
    }
  }

}
