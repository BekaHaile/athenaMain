import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  getData() async {
    var response = await http.get(
        Uri.encodeFull("https://e56ca5fb900d.ngrok.io/version"), //uri of api
        headers: {"Accept": "application/json"});

    Map<String, dynamic> data = jsonDecode(response.body);
    print(data); //Response from the api
  }

  Future<dynamic> postData(dynamic data) async {
    var response;
    try {
      response = await http.post(
        Uri.encodeFull(
            "http://ec2-3-134-243-200.us-east-2.compute.amazonaws.com:5005/webhooks/rest/webhook"), //uri of api
        headers: {
          "Accept": "application/json; charset=UTF-8",
        },
        body: jsonEncode(data),
      );

      // print('response is ----- ' + response.body);
      if (response.body.length > 2) {
        Map<String, dynamic> res =
            jsonDecode(response.body)[0]; //Response from the api

        if (response.body[0] == "[")
          return res['text'];
        else
          return "Couldn't understand you, sorry";
      } else {
        return "Thank you for providing your details. Your folio has been sent to your mail. /0003";
        // return "Couldn't understand you, sorry";
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
