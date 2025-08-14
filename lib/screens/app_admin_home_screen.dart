import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppAdminHomeScreen extends StatefulWidget {
  const AppAdminHomeScreen({Key? key}) : super(key: key);


  @override
  AppAdminHomeScreenState createState() => AppAdminHomeScreenState();
}

class AppAdminHomeScreenState extends State<AppAdminHomeScreen> {


  Future<void> secureStorage() async {
    final storage = new FlutterSecureStorage();
    final userId = await storage.read(key: "userId");
    final username = await storage.read(key: "username");
    final role = await storage.read(key: "role");
    final groupCode = await storage.read(key: "groupCode");


  }


  Future<void> UserListHttp() async {
    final url = Uri.parse("http://localhost:8080/api/user/session");

    final storage = new FlutterSecureStorage();
    final userId = await storage.read(key: "userId");
    final username = await storage.read(key: "username");
    final role = await storage.read(key: "role");
    final groupCode = await storage.read(key: "groupCode");

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );


    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      var message = userData['message'];

      print("レスポンス: ${response.body}");
      print("status: ${response.statusCode}");
      print("message: ${message}");

      print("userId : $userId");
      print("username : $username");
      print("role : $role");
      print("groupCode : $groupCode");
      goToUserList();
    } else {
      goToLogin();
    }

  }


  Future<void> groupListHttp() async {
    final url = Uri.parse("http://localhost:8080/api/user/session");

    final storage = new FlutterSecureStorage();
    final userId = await storage.read(key: "userId");
    final username = await storage.read(key: "username");
    final role = await storage.read(key: "role");
    final groupCode = await storage.read(key: "groupCode");

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );


    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      var message = userData['message'];

      print("レスポンス: ${response.body}");
      print("status: ${response.statusCode}");
      print("message: ${message}");

      print("userId : $userId");
      print("username : $username");
      print("role : $role");
      print("groupCode : $groupCode");
      goToGroupList();
    } else {
      goToLogin();
    }

  }


  void goToLogin() {
    Navigator.pushReplacementNamed(
      context,
      '/login',
    );
  }


  void goToUserList() {
    Navigator.pushReplacementNamed(
      context,
      '/app-admin/user-list',
    );
  }

  // Navigate to the Group List
  void goToGroupList() {
    Navigator.pushReplacementNamed(
      context,
      '/app-admin/group-list',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'アプリ管理者用　\nホーム',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: UserListHttp,
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
                'ユーザー一覧画面へ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: groupListHttp,
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
                'グループ一覧画面へ',
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
