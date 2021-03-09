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

  postData(dynamic data) async {
    var response;
    try {
      response = await http.post(
        Uri.encodeFull(
            "https://7c0783d765fe.ngrok.io/webhooks/rest/webhook"), //uri of api
        headers: {
          "Accept": "application/json; charset=UTF-8",
        },
        body: jsonEncode(data),
      );
    } catch (e) {
      print(e + 'has occured ****');
    }

    if (response.body.length > 2) {
      Map<String, dynamic> res = jsonDecode(response.body)[0];
      if (response.body[0] == "[") //Response from the api
        return res['text'];
      else
        return "Couldn't understand you, sorry";
    } else {
      return "Couldn't understand you, sorry";
    }
  }
}
