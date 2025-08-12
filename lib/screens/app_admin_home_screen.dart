import 'package:flutter/material.dart';

class AppAdminHomeScreen extends StatefulWidget {
  const AppAdminHomeScreen({Key? key}) : super(key: key);

  @override
  AppAdminHomeScreenState createState() => AppAdminHomeScreenState();
}

class AppAdminHomeScreenState extends State<AppAdminHomeScreen> {

  // Navigate to the User List
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
              'アップリ管理者用',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: goToUserList,
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
              onPressed: goToGroupList,
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
