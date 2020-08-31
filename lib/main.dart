import 'package:flutter/material.dart';
import 'package:zomentum/chats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Chat App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedUser = '';
  int selectedIndex = -1;
  TextEditingController messageEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Row(
      children: [
        Container(
          height: h,
          width: w / 20,
          color: Color(0xff0b73fc),
          child: Column(
            children: [
              SizedBox(
                height: h / 50,
              ),
              Container(
                height: w / 30,
                width: w / 30,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1531891570158-e71b35a485bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80'),
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                height: h / 20,
              ),
              Icon(
                Icons.call,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                height: h / 20,
              ),
              Icon(
                Icons.chat,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                height: h / 20,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
                size: 25,
              )
            ],
          ),
        ),
        Container(
          height: h,
          width: w / 5,
          margin: EdgeInsets.only(left: w / 80),
          decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Color(0xffb5f9ff)))),
          child: Column(
            children: [
              Container(
                height: h / 10,
                width: w / 5,
                child: Container(
                    width: w / 5,
                    margin: EdgeInsets.only(right: 15, top: 12, bottom: 12),
                    decoration: BoxDecoration(
                        color: Color(0xffedf2f7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600)),
                    )),
              ),
              Container(
                height: h / 10,
                width: w / 5,
                child: InkWell(
                  child: Container(
                    width: w / 5,
                    margin: EdgeInsets.only(right: 15, top: 12, bottom: 12),
                    decoration: BoxDecoration(
                        color: Color(0xff0b73fc),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                      'Start New Chat',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: chats.keys.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          messageEditingController.text = '';

                          setState(() {
                            selectedUser = chats.keys.elementAt(index);

                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: h / 8,
                          color: index == selectedIndex
                              ? Color(0xfff5f9fc)
                              : Colors.white,
                          child: Row(
                            children: [
                              Container(
                                height: w / 25,
                                width: w / 25,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      chats.values.elementAt(index).dp),
                                ),
                              ),
                              SizedBox(
                                width: w / 100,
                              ),
                              Container(
                                width: w / 8,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          chats.keys.elementAt(index),
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'RobotoMono'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            chats.values
                                                .elementAt(index)
                                                .messages
                                                .last['text'],
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w200,
                                                color: Colors.grey,
                                                fontFamily: 'RobotoMono'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        Container(
          height: h,
          width: 59 * w / 80,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: h / 10,
                width: 59 * w / 80,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xffb5f9ff),
                    ),
                  ),
                ),
                child: selectedUser == ''
                    ? SizedBox()
                    : Row(
                        children: [
                          SizedBox(
                            width: w / 50,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(chats[selectedUser].dp),
                            ),
                          ),
                          SizedBox(
                            width: w / 100,
                          ),
                          Container(
                            child: Text(
                              selectedUser,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'RobotoMono'),
                            ),
                          ),
                        ],
                      ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 8 * h / 10,
                width: 59 * w / 80,
                child: selectedUser == ''
                    ? Center(
                        child: Text(
                          'Chat Now',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: chats[selectedUser].messages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                left: chats[selectedUser].messages[index]
                                            ['sentByMe'] ==
                                        'true'
                                    ? 0
                                    : 24,
                                right: chats[selectedUser].messages[index]
                                            ['sentByMe'] ==
                                        'true'
                                    ? 24
                                    : 0),
                            alignment: chats[selectedUser].messages[index]
                                        ['sentByMe'] ==
                                    'true'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: chats[selectedUser].messages[index]
                                          ['sentByMe'] ==
                                      'true'
                                  ? EdgeInsets.only(left: 30)
                                  : EdgeInsets.only(right: 30),
                              padding: EdgeInsets.only(
                                  top: 7, bottom: 7, left: 15, right: 15),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: chats[selectedUser]
                                            .messages[index]['sentByMe'] ==
                                        'true'
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))
                                    : BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                color: chats[selectedUser].messages[index]
                                            ['sentByMe'] ==
                                        'true'
                                    ? const Color(0xFFdfeaf5)
                                    : Colors.white,
                              ),
                              child: Text(
                                  chats[selectedUser].messages[index]['text'],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'OverpassRegular',
                                      fontWeight: FontWeight.w300)),
                            ),
                          );
                        }),
              ),
              selectedUser == ''
                  ? SizedBox()
                  : Container(
                      color: Color(0xffd1e9eb),
                      height: h / 10,
                      alignment: Alignment.bottomCenter,
                      width: 59 * w / 80,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)),
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.emoji_emotions,
                                size: 18,
                                color: Color(0xffafcacc),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: messageEditingController,
                                decoration: InputDecoration(
                                    hintText: "Type Something",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                chats[selectedUser]
                                    .addMessage(messageEditingController.text);
                                messageEditingController.clear();
                                setState(() {});
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40)),
                                  padding: EdgeInsets.all(12),
                                  child: Icon(
                                    Icons.send_rounded,
                                    size: 18,
                                    color: Color(0xffafcacc),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        )
      ],
    ));
  }
}
