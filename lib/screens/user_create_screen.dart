import 'package:flutter/material.dart';

class UserCreateScreen extends StatelessWidget {
  const UserCreateScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar( //タイトル
            centerTitle: true,
            title: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("ユーザー登録" //画面タイトル
                ,style: TextStyle(
                    fontSize: 30, //font size
                    fontWeight: FontWeight.bold
                ),
              ),)
        ),
        //タイトル end--------------------------------

        //ボディ start--------------------------------
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column( //テキストボックス パート
                children: [
                  //グループ名start--------------------------------
                  userNameText(),
                  textBox1(),
                  //グループ名end--------------------------------

                  //メールアドレスstart--------------------------------
                  mailAddressText(),
                  textBox2(),
                  //メールアドレスend--------------------------------

                  //パスワードstart--------------------------------
                  passwordText(),
                  passwordTextBox1(),
                  //パスワードend--------------------------------

                  //パスワード再確認start--------------------------------
                  passwordReconfirmText(),
                  passwordTextBox2(),
                  //パスワード確認end--------------------------------

                  //登録ボタンstart--------------------------------
                  registButton(),
                  //登録ボタンend--------------------------------
                ].toList(),
              ),
            )),
          //ボディ end--------------------------------
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//グループ名テキスト
class userNameText extends StatelessWidget {
  const userNameText({super.key});



  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 800,
      height: 35,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child: Text(
        "氏名",//username
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.left,
      ),
    );
  }
}

//メールアドレステキスト
class mailAddressText extends StatelessWidget {
  const mailAddressText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "メールアドレス",//mail address
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

//パスワードテキスト
class passwordText extends StatelessWidget {
  const passwordText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "パスワード",//password
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

//パスワード再確認テキスト
class passwordReconfirmText extends StatelessWidget {
  const passwordReconfirmText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "パスワード再確認",//password confirm
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

//一般テキストボックス
class textBox1 extends StatelessWidget {
  const textBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 45,
      child: TextField(
        decoration: InputDecoration(
            hintText: "氏名を入力してください",
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)
            )
        ),
      ),
    );
  }
}

//一般テキストボックス
class textBox2 extends StatelessWidget {
  const textBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 45,
      child: TextField(
        decoration: InputDecoration(
            hintText: "メールアドレスを入力してください",
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)
            )
        ),
      ),
    );
  }
}

//パスワードテキストボックス
class passwordTextBox1 extends StatelessWidget {
  const passwordTextBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 45,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: "パスワードを入力してください",
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)
            )
        ),
      ),
    );
  }
}

//パスワードテキストボックス
class passwordTextBox2 extends StatelessWidget {
  const passwordTextBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 45,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: "パスワード再確認を入力してください",
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)
            )
        ),
      ),
    );
  }
}

//登録ボタン
class registButton extends StatelessWidget {
  const registButton({super.key});

  void loginUser(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      '/login',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        height: 70,
        margin: EdgeInsets.only(top: 50,bottom: 5),
        child: ElevatedButton(
          onPressed: () {
            loginUser(context);
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ), child: Text("登録",style: TextStyle(fontSize: 40.0),),
        )
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  var results = "";
  final myController = TextEditingController(); //テキストボックスからデータを出す

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: "Results"
              ),
            ),
            registButton(

            )
          ],
        ),
      ),
    );
  }
}
