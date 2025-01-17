import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:jobjunction/models/request/chat/create_chat.dart';
import 'package:jobjunction/models/response/chat/get_chat.dart';
import 'package:jobjunction/models/response/chat/initial_message.dart';
import 'package:jobjunction/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatHelper {
  static var client = https.Client();

//apply for job
  static Future<List<dynamic>> apply(CreateChat model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.chatsUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      var first = initialChatFromJson(response.body).id;

      return [true, first];
    } else {
      return [false];
    }
  }

//get conversation
  static Future<List<GetChats>> getConversation() async {
    var url = Uri.https(Config.apiUrl, Config.chatsUrl);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'token': 'Bearer $token'
    };
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = getChatsFromJson(response.body);
      return data;
    } else {
      throw Exception("Error loading chat");
    }
  }
}
