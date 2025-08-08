import 'package:flutter/material.dart';

class GroupListScreen extends StatelessWidget {
  const GroupListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              PageTitle(),
              SizedBox(height: 16),
              NameSearchInput(),
              SizedBox(height: 8),
              GroupList(),
            ],
          ),
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'グループ一覧画面',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NameSearchInput extends StatelessWidget {
  const NameSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              hintText: 'ユーザー氏名で検索',
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              border: OutlineInputBorder(),
              isDense: false,
            ),
          ),
        ),
        const SizedBox(width: 8),

        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: const Size(48, 48),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 0,
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: const Text('検索'),
          ),
        ),
      ],
    );
  }
}

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> groups = [
      {'groupName': 'DEVFOX', 'memberCount': '総合30人'},
      {'groupName': 'スターディ', 'memberCount': '総合4人'},
      {'groupName': '映画サークル', 'memberCount': '総合14人'},
      {'groupName': 'FujiSoft', 'memberCount': '総合98人'},
      {'groupName': 'サッカー', 'memberCount': '総合22人'},
      {'groupName': '飲み会', 'memberCount': '総合8人'},
      {'groupName': 'Yahoo', 'memberCount': '総合45人'},
    ];

    return Column(
      children: groups.map((group) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/attend/details');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black26, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  group['groupName'] ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  group['memberCount'] ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}