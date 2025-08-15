import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}


class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storage = new FlutterSecureStorage();

  bool isChecked = false;

  String? sessionCookie;



  Future<String?> loginUserHttp() async {
    // 「https://velog.io/@ramyuning/%EB%B0%B1%EC%97%94%EB%93%9C%EC%99%80-http-%ED%86%B5%EC%8B%A0%ED%95%98%EA%B8%B0」、
    // 「https://qiita.com/k-keita/items/5b748e081cf96c5ea38f」←は私が参考したリンクです。
    // FlutterでHTTPのRequestの方法です。
    final url = Uri.parse("http://localhost:8080/api/user/login");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "email": emailController.text,
        "password": passwordController.text
      }),
    );

    final userData = json.decode(response.body);
    if (userData['body'] == null) {
      return null;
    }
    if (userData['body']['accessLevelCode'] != null) {
      // 「https://juntcom.tistory.com/276」、←は私が参考したリンクです。
      // 「https://llshl.tistory.com/64」←は私が参考したリンクです。（JSONの配列でーたに接近する方法です。）
      // FlutterでresponseのjsonDataをparsingの方法です。

      final userData = json.decode(response.body);
      var message = userData['message'];

      print("レスポンス: ${response.body}");
      print("status: ${response.statusCode}");
      print("message: ${message}");

      // 「https://jutole.tistory.com/63」、←は私が参考したリンクです。
      // Flutterのsecure storageの使い方です。
      await storage.write(key: "userId", value: userData['body']['id'].toString());
      await storage.write(key: "username", value: userData['body']['name']);
      await storage.write(key: "role", value: userData['body']['accessLevelCode']);
      await storage.write(key: "groupCode", value: userData['body']['groupCode']);

      // await storage.write(key: "userId", value: userData['id'].toString());
      // await storage.write(key: "username", value: userData['name']);
      // await storage.write(key: "role", value: userData['accessLevelCode']);
      // await storage.write(key: "groupCode", value: userData['groupCode']);

      final userId = await storage.read(key: "userId");
      final username = await storage.read(key: "username");
      final role = await storage.read(key: "role");
      final groupCode = await storage.read(key: "groupCode");

      print("userId : $userId");
      print("username : $username");
      print("role : $role");
      print("groupCode : $groupCode");

//https://doogle.link/flutter-dart-%EC%97%90%EC%84%9C-%EC%84%9C%EB%B2%84-%EC%9D%91%EB%8B%B5-%EC%BF%A0%ED%82%A4-%EC%B2%98%EB%A6%AC%ED%95%98%EA%B8%B0/

      if(role == "ROLE_USER" || role == "ROLE_MANAGER"){
        loginUser();
      } else if (role == "ROLE_ADMIN") {
        loginAdmin();
      } else if (role == "ROLE_SUPER") {
        loginAppAdmin();
      }
    }
  }

  void loginUser() {
    Navigator.pushReplacementNamed(
      context,
      '/attend/record',
    );
  }

  void loginAdmin() {
    Navigator.pushReplacementNamed(
      context,
      '/admin/home',
    );
  }

  void loginAppAdmin() {
    Navigator.pushReplacementNamed(
      context,
      '/app-admin/home',
    );
  }

  void userCreate() {
    Navigator.pushReplacementNamed(
      context,
      '/admin/create',
    );
  }

  void goSignUp() {
    Navigator.pushReplacementNamed(
      context,
      '/user/create',
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // 縦に配置
        child: Column(
          // 真ん中に
          mainAxisAlignment: MainAxisAlignment.center,
          // 子ウィジェット配置
          children: [
            // Text配置
            const Text(
              'ログイン',
              // style適用
              style: TextStyle(
                fontSize: 40,
                // 文字を厚く
                fontWeight: FontWeight.bold,
              ),
            ),
            // 空間生成
            const SizedBox(height: 90),
            // 特定位置に整列
            Align(
              // 左に整列
              alignment: Alignment.centerLeft,
              // 左に整列
              child: const Text(
                'メールアドレス',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "メールを入力してください",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'パスワード',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "パスワードを入力してください",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(

              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '自動でログインチェック',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () async {
                  final result = await loginUserHttp();
                  if (result == null) {
                    Flushbar(
                      message: '                                              ToastMessage\n                                        確認に失敗しました。',
                      duration: Duration(seconds: 2),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Colors.red,
                      margin: EdgeInsets.all(16),
                      borderRadius: BorderRadius.circular(8),
                      icon: Icon(Icons.warning, color: Colors.white),
                    ).show(context);
                    return;
                  }
                },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text(
                'ログイン',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: userCreate,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text(
                '新規登録',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
