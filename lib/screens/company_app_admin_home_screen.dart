import 'package:flutter/material.dart';

class CompanyAppAdminHomeScreenAdminHomeScreen extends StatefulWidget {
  const CompanyAppAdminHomeScreenAdminHomeScreen({Key? key}) : super(key: key);

  @override
  CompanyAppAdminHomeScreenAdminHomeScreenState createState() => CompanyAppAdminHomeScreenAdminHomeScreenState();
}


class CompanyAppAdminHomeScreenAdminHomeScreenState extends State<CompanyAppAdminHomeScreenAdminHomeScreen> {

  void goCompanyCreate() {
    Navigator.pushReplacementNamed(
      context,
      '/app-admin/company/create',
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
              'APP管理者ホーム',
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
              onPressed: goCompanyCreate,
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
                '会社登録画面へ',
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
