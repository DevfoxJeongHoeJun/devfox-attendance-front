import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 50),
              UserListTitle(),
              SizedBox(height: 50),
              NameSearchInput(),
              SizedBox(height: 16),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserListTitle extends StatelessWidget {
  const UserListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'ユーザー一覧画面',
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
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              // 検索処理をここに追加
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
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

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> userList = [
      {'name': 'キムさん(DEVFOX)'},
      {'name': 'ソンさん(DEVFOX)'},
      {'name': 'チョイさん(DEVFOX)'},
      {'name': 'イさん(DEVFOX)'},
      {'name': 'ハンさん(DEVFOX)'},
      {'name': 'シュン(DEVFOX)'},
    ];

    return Column(
      children: userList.map((user) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/attend/details');
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    user['name'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
