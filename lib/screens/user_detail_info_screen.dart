import 'package:flutter/material.dart';

class UserDetailInfoScreen extends StatelessWidget {
  const UserDetailInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // 本体部分
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),

          child: Column(


            children: [
              const titleLable(),
              // ユーザー名
              const UserNameLabel(),
              const InputTextBox(),

              // メールアドレス
              const EmailLabel(),
              const InputTextBox(),

              // パスワード
              const PasswordLabel(),
              const InputTextBox(),

              // パスワード再確認
              const PasswordConfirmLabel(),
              const InputTextBox(),

              // 登録ボタンと削除ボタン
              const UpdateDeleteButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


class titleLable extends StatelessWidget {
  const titleLable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "ユーザー情報画面",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ---------------------- ラベルウィジェット ----------------------

// ユーザー名ラベル
class UserNameLabel extends StatelessWidget {
  const UserNameLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel("ユーザー名");
  }
}

// メールアドレスラベル
class EmailLabel extends StatelessWidget {
  const EmailLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel("メールアドレス");
  }
}

// パスワードラベル
class PasswordLabel extends StatelessWidget {
  const PasswordLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel("パスワード");
  }
}

// パスワード再確認ラベル
class PasswordConfirmLabel extends StatelessWidget {
  const PasswordConfirmLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel("パスワード再確認");
  }
}

// 共通ラベルウィジェット
Widget _buildLabel(String text) {
  return Container(
    width: 800,
    height: 35,
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(top: 20, bottom: 5),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// ---------------------- 入力欄ウィジェット ----------------------

class InputTextBox extends StatelessWidget {
  const InputTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 35,
      child: TextField(
        decoration: InputDecoration(
          hintText: "入力してください",
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

// ---------------------- ボタン ----------------------

class UpdateDeleteButtons extends StatelessWidget {
  const UpdateDeleteButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UpdateButton(),
        DeleteButton(),
      ],
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      margin: const EdgeInsets.only(top: 50, bottom: 5),
      child: ElevatedButton(
        onPressed: () {
          // 編集ボタンの処理
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text("編集"),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      child: ElevatedButton(
        onPressed: () {
          // 削除ボタンの処理
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text("削除"),
      ),
    );
  }
}
