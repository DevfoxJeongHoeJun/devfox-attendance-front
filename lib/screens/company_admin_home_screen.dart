import 'package:flutter/material.dart';

class CompanyAdminHomeScreen extends StatefulWidget {
  const CompanyAdminHomeScreen({Key? key}) : super(key: key);

  @override
  CompanyAdminHomeScreenState createState() => CompanyAdminHomeScreenState();
}


class CompanyAdminHomeScreenState extends State<CompanyAdminHomeScreen> {

  void goCompanyInfoScreen() {
    Navigator.pushReplacementNamed(
      context,
      '/admin/info',
    );
  }

  void goEmployeeAttendanceListScreen() {
    Navigator.pushReplacementNamed(
      context,
      '/attend/list',
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
              'グループ管理者用',
              // style適用
              style: TextStyle(
                fontSize: 40,
                // 文字を厚く
                fontWeight: FontWeight.bold,
              ),
            ),
            // 空間生成

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: goCompanyInfoScreen,
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
                'グループ詳細へ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: goEmployeeAttendanceListScreen,
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
                'ユーザー勤怠一覧へ',
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
