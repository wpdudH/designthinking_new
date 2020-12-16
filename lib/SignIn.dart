import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/cupertino.dart';
import 'Login.dart';
import 'mmainpage.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Login login = Login();
  String id= '';
  String password = '';
  final _idTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();

  @override
  void dispos() {
    _idTextEditController.dispose();
    _passwordTextEditController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height*0.2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign In',
                      style: TextStyle(color: Color(0xff99B5DF), fontSize:30, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 120.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Color(0xffF0F4F8),
                    ),
                    child: TextField(
                      controller: _idTextEditController,
                      style: TextStyle(
                        fontSize: 25,
                        ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize:18, color: Color(0xffA6BCD0)),
                      hintText: 'ID',
                      prefixIcon: Icon(Icons.email_outlined, color: Color(0xffA6BCD0)),
                      fillColor: Color(0xffF0F4F8),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width:0.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                      onChanged: (text) {
                        id = text;
                      }
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Color(0xffF0F4F8),
                  ),
                  child: TextField(
                    controller: _passwordTextEditController,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize:18, color: Color(0xffA6BCD0)),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_rounded, color: Color(0xffA6BCD0)),
                      fillColor: Color(0xffF0F4F8),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width:0.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onChanged: (text){
                      password = text;
                    }
                  ),
                ),
              ),
              SizedBox(height: height* 0.13,),
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff99B5DF),
                ),
                child: CupertinoButton(
                  onPressed: () {
                    String result = "";
                    login.CheckIn(id,password).then((String d) {
                      result = d;
                    });
                    if (result != "null"){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DocumentView1(result)));
                    }
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff99B5DF),
                ),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
