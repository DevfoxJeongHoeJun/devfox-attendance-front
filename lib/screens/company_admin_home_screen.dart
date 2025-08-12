import 'package:flutter/material.dart';

class CompanyAdminHomeScreen extends StatefulWidget {
  const CompanyAdminHomeScreen({Key? key}) : super(key: key);

  @override
  CompanyAdminHomeScreenState createState() => CompanyAdminHomeScreenState();
}


class CompanyAdminHomeScreenState extends State<CompanyAdminHomeScreen> {

  int selectedIndex = 0;

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

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print('tapped');
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('勤怠アプリ'),
        centerTitle: true,
        elevation: 0.0,
        leading:
          //previous button start -----------------------------------------
          IconButton(
          icon: const Icon(Icons.navigate_before),
          tooltip: 'Next page',
          onPressed: () {
            // openPage(context);
          },
          //previous button end ----------------------------------------
        ),
        actions: [
          //Menu button start -----------------------------------------
          IconButton(onPressed: (){
            // print('menu button is clicked1');
            _scaffoldKey.currentState?.openEndDrawer();
          }, icon: Icon(Icons.menu)),
          //Menu button end ----------------------------------------
        ]
      ),
      //Drawer Start
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('歓迎致します!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('ユーザー一覧'),
              selected: selectedIndex == 0,
              onTap: () {
                onItemTapped(0);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
              'グループ管理者用 \nホーム画面',
              // style適用
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                // 文字を厚く
                fontWeight: FontWeight.bold,
              ),
            ),
            // 空間生成

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
                '勤怠一覧画面へ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

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
                'グループ詳細画面へ',
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
