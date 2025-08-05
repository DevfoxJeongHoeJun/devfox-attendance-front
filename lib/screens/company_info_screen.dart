import 'package:flutter/material.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: const  Center(
                child: Text(
                  '会社情報',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Text(
                '会社名',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'DEVFOX',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Text(
                '住所',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text(
                '104-0061 東京都中央区金座7丁目13番6号サガミビル2階',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Text(
                'ドメイン',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 14),
              child: TextFormField(
                initialValue: 'devfox.attend.co.jp',
                decoration: InputDecoration(
                  hintText: 'ドメイン初期値です。',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Text(
                '会社コード',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 14),
              child: TextFormField(
                initialValue: 'devfox',
                decoration: InputDecoration(
                  hintText: '会社コード初期値です。',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Text(
                '招待リンク送信',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'メールアドレスを入力',
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black54, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () => print('送信成功！'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(80, 50),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('送信'),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Text(
                'メールアドレス',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'devfox@devfox.co.jp',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: const Text(
                            'パスワード',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),

                        Container(
                          child: TextFormField(
                            obscureText: true,
                            initialValue: '初期値です。',
                            decoration: InputDecoration(
                              hintText: 'パスワード',
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: const Text(
                              'パスワード再確認',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),

                          Container(
                            child: TextFormField(
                              obscureText: true,
                              initialValue: '初期値です。',
                              decoration: InputDecoration(
                                hintText: 'パスワード再確認',
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              ),
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => print('変更成功！'),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(0, 50),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('パスワード変更'),
              ),
            )
          ],
        ),
      ),
    );
  }
}