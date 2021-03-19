import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter/material.dart';

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
                    'Login',
                    _loginArea(),
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

  _loginArea() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 60,
            width: 300,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Id를 입력하세요';
                } else
                  return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Id',
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 60,
            width: 300,
            child: TextFormField(
              validator: (value) {
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
        ],
      ),
      // Row(children: [
      //   Column(crossAxisAlignment: CrossAxisAlignment.start, children: []),
      // ]),
      Container(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: RaisedButton(
              color: Colors.purple.withAlpha(220),
              textColor: Colors.white,
              onPressed: () {
                // Navigator.of(context)
                //     .push(CupertinoPageRoute(builder: (_) => FAQPageKorean()));
              },
              child: Text('자주 묻는 질문들'),
              elevation: 3.0,
            ),
            height: 40,
            width: 145,
          ),
        ],
      ),
    ];
  }
}
