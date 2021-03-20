// This source code is a part of Project Violet.
// Copyright (C) 2021. violet-team. Licensed under the Apache-2.0 License.

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

class VioletServer {
  static const protocol = 'https';
  static const host = 'api.koromo.xyz';
  static const api = '$protocol://$host';

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
}
