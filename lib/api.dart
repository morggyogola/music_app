import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Apis {
  final dio = Dio(BaseOptions(
      baseUrl: "localhost://5000",
      connectTimeout: Duration(seconds: 10),
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType));
  String userName = "Morgan";
  String password = "1234";

  String baseAuth = "";
  Apis() {
    baseAuth = base64Encode(utf8.encode("$userName:$password"));
  }

  void getData() async {
    dio.get("/songs",options: Options(headers: {"Authorization": " Bearer ${await getToken()}"}));
    final rst = await dio.get("/songs");
    if (rst.statusCode == 200) {
      print("error");
    }
    Future postData(String email, String password) async {
      String url = "\login";
      SharedPreferences pref = await SharedPreferences.getInstance();

      var userdata = {email: email, password: password};
      dio
          .post(url, data: {userdata})
          .then((value) => {
                pref.setString("bearerToken", value.data['bearerToken']),
                print(value.data['bearerToken'])
              })
          .onError((error, stackTrace) => {});
    }

    Future register(String email, String fullname, String password,
        String phoneNumber) async {
      String url = "\login";
      var userdata = {
        email: email,
        password: password,
        fullname: fullname,
        phoneNumber: phoneNumber
      };
      dio
          .post(url,
              data: userdata,
              options: Options(headers: {"Authorization": baseAuth}))
          .then((value) => {value})
          .onError((error, stackTrace) => {});
    }
  }

  Future<String> getToken() async {
    SharedPreferences token = await SharedPreferences.getInstance();
    final result = token.getString("bearerToken");
    return result.toString();
  }
}
