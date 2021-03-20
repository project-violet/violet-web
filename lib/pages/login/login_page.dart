// This source code is a part of Project Violet.
// Copyright (C) 2021. violet-team. Licensed under the Apache-2.0 License.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:violetweb/pages/login/signup_page.dart';
import 'package:violetweb/server/violet.dart';

class LoginPage extends StatelessWidget {
  final idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text('Login Page'),
      // ),
      body: Container(
        alignment: Alignment.center,
        // child: TextField(
        //   controller: idController,
        // ),
        child: Padding(
          padding: EdgeInsets.only(top: 16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildGroup(
                    'Violet Web Service',
                    _loginArea(context),
                  ),
                  Container(height: 16),
                  Text(
                    'Copyright (C) 2021. violet-team. Licensed under the Apache-2.0 License.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildGroup(name, content) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(32, 20, 32, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
              fontSize: 16.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(32, 20, 32, 10),
          // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
          // height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.white,
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: content),
          ),
        ),
      ],
    );
  }

  _loginArea(context) {
    return [
      // Container(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width: 280,
            child: Theme(
              data: new ThemeData(
                primaryColor: Colors.purple,
                primaryColorDark: Colors.purple,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Id를 입력하세요';
                  } else
                    return null;
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Id',
                ),
              ),
            ),
          ),
        ],
      ),
      Container(
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width: 280,
            child: Theme(
              data: new ThemeData(
                primaryColor: Colors.purple,
                primaryColorDark: Colors.purple,
              ),
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                  print(value);
                  if (value.isEmpty) {
                    return 'PW를 입력하세요';
                  } else
                    return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
          ),
        ],
      ),
      Container(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                elevation: 3.0,
              ),
              child: Text('Sign Up'),
              onPressed: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SignUpPage()));
              },
            ),
            height: 40,
            width: 100,
          ),
          Container(
            padding: EdgeInsets.only(right: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple.withAlpha(220),
                elevation: 3.0,
              ),
              child: Text('Login'),
              onPressed: () async {
                var v = await VioletServer.top(0, 100, 'daily');
                await showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: new Text("Login Failed!"),
                    content: new Text(v.toString()),
                    // content: new Text("Please check your id or password!"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            height: 40,
            width: 100,
          ),
        ],
      ),
    ];
  }
}
