import 'package:flutter/material.dart';

class CompanyCreateScreen extends StatelessWidget {
  const CompanyCreateScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar( //タイトル
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("会社登録" //画面タイトル
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
                //会社名start--------------------------------
                companyNameText(),
                textBox(),
                //会社名end--------------------------------

                //会社住所start--------------------------------
                companyLocText(),
                textBox(),
                //会社住所end--------------------------------

                //会社管理コードstart--------------------------------
                companyCodeText(),
                textBox(),
                //会社管理コードend--------------------------------

                //ドメイン--------------------------
                domainText(),
                textBox(),
                //会社管理コードend--------------------------------

                //メールアドレスstart--------------------------------
                mailAddressText(),
                textBox(),
                //メールアドレスend--------------------------------

                //パスワードstart--------------------------------
                passwordText(),
                passwordTextBox(),
                //パスワードend--------------------------------

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
//会社名テキスト
class companyNameText extends StatelessWidget {
  const companyNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 800,
        height: 35,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 20,bottom: 5),
        child: Text(
        "会社名",//テキストボックスタイトル
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.left,
      ),
    );
  }
}

//会社住所テキスト
class companyLocText extends StatelessWidget {
  const companyLocText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "会社住所",//Company Location
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

//会社管理コードテキスト
class companyCodeText extends StatelessWidget {
  const companyCodeText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "会社管理コード",//Company Location
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

//ドメインテキスト
class domainText extends StatelessWidget {
  const domainText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "ドメイン",//Company Location
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
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
        "メールアドレス",//Company Location
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
        "パスワード",//Company Location
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

//一般テキストボックス
class textBox extends StatelessWidget {
  const textBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 800,
          height: 35,
          child: TextField( //CompanyName
          decoration: InputDecoration(
          hintText: "テキストボックス",
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
class passwordTextBox extends StatelessWidget {
  const passwordTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      child: TextField( //CompanyName
        obscureText: true,
        decoration: InputDecoration(
            hintText: "テキストボックス",
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 35,
      margin: EdgeInsets.only(top: 50,bottom: 5),
      child: ElevatedButton(onPressed: (){

      },
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
      ),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
      ), child: Text("登録"),)
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

