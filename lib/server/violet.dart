// This source code is a part of Project Violet.
// Copyright (C) 2021. violet-team. Licensed under the Apache-2.0 License.

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'package:violetweb/server/wsalt.dart';

class VioletServer {
  // static const protocol = 'https';
  // static const host = 'api.koromo.xyz';
  // static const api = '$protocol://$host';
  static const protocol = 'http';
  static const host = '3.35.208.233';
  static const api = '$protocol://$host/api';

  static Future<dynamic> top(int offset, int count, String type) async {
    var gg = await http
        .get(Uri.parse('$api/top?offset=$offset&count=$count&type=$type'));

    if (gg.statusCode != 200) {
      return gg.statusCode;
    }

    try {
      var result = (jsonDecode(gg.body)['result'] as List<dynamic>)
          .map((e) => Tuple2<int, int>(
              (e as List<dynamic>)[0] as int, (e as List<dynamic>)[1] as int))
          .toList();
      return result;
    } catch (e, st) {
      print(e);
      print(st);
      return 900;
    }
  }

  static Future<dynamic> login(String id, String pw) async {
    var vToken = DateTime.now().toUtc().millisecondsSinceEpoch;
    var vValid = getValid(vToken.toString());

    try {
      var res = await http.post(Uri.parse('$api/community/sign/in'),
          headers: {
            'v-token': vToken.toString(),
            'v-valid': vValid,
            "Content-Type": "application/json"
          },
          body: jsonEncode({'Id': id, 'Password': pw}));
      return jsonDecode(res.body);
    } catch (e) {}
  }
}
