// This source code is a part of Project Violet.
// Copyright (C) 2021. violet-team. Licensed under the Apache-2.0 License.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
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
                    'Violet Web Service Sign Up',
                    _loginArea(context),
                  )
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
          width: double.infinity,
          decoration: BoxDecoration(
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
      Row(
        children: [
          Icon(Icons.warning),
          Container(
            width: 8,
          ),
          Expanded(
            child: Text(
              'You can sign-in only on violet-app currently!',
              textAlign: TextAlign.left,
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
            child: RaisedButton(
              color: Colors.grey,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancle'),
              elevation: 3.0,
            ),
            height: 40,
            width: 100,
          ),
          Container(
            padding: EdgeInsets.only(right: 8),
            child: RaisedButton(
              color: Colors.purple.withAlpha(220),
              textColor: Colors.white,
              onPressed: null,
              child: Text('Sign Up'),
              elevation: 3.0,
            ),
            height: 40,
            width: 100,
          ),
        ],
      ),
    ];
  }
}
