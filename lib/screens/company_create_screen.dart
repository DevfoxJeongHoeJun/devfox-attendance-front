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
            child: Text("グループ新規登録" //画面タイトル
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
                groupNameText(),
                Container(
                  width: 800,
                  height: 30,
                  child: TextField( //CompanyName
                    decoration: InputDecoration(
                        hintText: "グループを入力してください",
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
                ),
                //グループ名end--------------------------------

                //グループ住所start--------------------------------
                groupLocationText(),
                Container(
                  width: 800,
                  height: 30,
                  child: TextField( //CompanyName
                    decoration: InputDecoration(
                        hintText: "住所を入力してください",
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
                ),
                //グループ住所end--------------------------------

                // //グループ管理コードstart--------------------------------
                // companyCodeText(),
                // textBox(),
                // //グループ管理コードend--------------------------------

                //ドメイン--------------------------
                domainText(),
                Container(
                  width: 800,
                  height: 30,
                  child: TextField( //CompanyName
                    decoration: InputDecoration(
                        hintText: "ドメインを入力してください",
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
                ),
                //グループ管理コードend--------------------------------

                //Divider start-----------------------------------
                Container(
                  height: 50,
                  decoration:BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 3
                      )
                    )
                  ),
                ),
                //Divider end----------------------------------

                //Master infomation(管理者情報)
                //ユーザー名start--------------------------------
                groupMasterNameText(),
                Container(
                  width: 800,
                  height: 30,
                  child: TextField( //CompanyName
                    decoration: InputDecoration(
                        hintText: "管理者氏名を入力してください",
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
                ),
                //ユーザー名end--------------------------------

                //メールアドレスstart--------------------------------
                mailAddressText(),
                Container(
                  width: 800,
                  height: 30,
                  child: TextField( //CompanyName
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
                ),
                //メールアドレスend--------------------------------

                //パスワードstart--------------------------------
                passwordText(),
                Container(
                  width: 800,
                  height: 30,
                  child: TextField( //CompanyName
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
                ),
                //パスワードend--------------------------------

                //パスワード確認start--------------------------------
                passwordReconfirmText(),
                Container(
                  width: 800,
                  height: 30,
                  child: TextField( //CompanyName
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
                ),
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
class groupNameText extends StatelessWidget {
  const groupNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 800,
        height: 30,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 20,bottom: 5),
        child: Text(
        "グループ名",//group name
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.left,
      ),
    );
  }
}

//グループ住所テキスト
class groupLocationText extends StatelessWidget {
  const groupLocationText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 30,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "住所",//"グループ住所",//group Location
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

// //グループ管理コードテキスト
// class companyCodeText extends StatelessWidget {
//   const companyCodeText({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 800,
//       height: 35,
//       alignment: Alignment.centerLeft,
//       margin: EdgeInsets.only(top: 20,bottom: 5),
//       child:   Text(
//         "グループ管理コード",//Company Location
//         style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold
//         ),
//       ),
//     );
//   }
// }

//ドメインテキスト
class domainText extends StatelessWidget {
  const domainText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 30,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "ドメイン",//group domain
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class groupMasterNameText extends StatelessWidget {
  const groupMasterNameText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 30,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "管理者氏名",//"グループ管理者名",//group master name
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
      height: 30,
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
      height: 30,
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

//パスワード確認テキスト
class passwordReconfirmText extends StatelessWidget {
  const passwordReconfirmText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 30,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20,bottom: 5),
      child:   Text(
        "パスワード再確認",//password reconfirm
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
          height: 30,
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
      height: 30,
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
      height: 30,
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

