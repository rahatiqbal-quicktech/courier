import 'dart:convert';

import 'package:http/http.dart' as http;

class NoticeService {
  getNotice() async {
    var response =
        await http.get(Uri.parse("https://zidrop.com/api/merchant/notice"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }
}
