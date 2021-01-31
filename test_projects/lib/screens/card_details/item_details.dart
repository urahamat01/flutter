import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {


  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/index.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Details',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),

      child: new SingleChildScrollView(
        scrollDirection: Axis.vertical,//.horizontal
        child: new Text(
          "1 Description that is too long in text format(Here Data is coming from API) jdlksaf j klkjjflkdsjfkddfdfsdfds " +
              "2 Description that is too long in text format(Here Data is coming from API) d fsdfdsfsdfd dfdsfdsf sdfdsfsd d " +
              "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" +
              "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" +
              "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " +
              "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" +
              "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" +
              "8 Description that is too long in text format(Here Data is coming from API)" +
              "9 Description that is too long in text format(Here Data is coming from API)" +
              "10 Description that is too long in text format(Here Data is coming from API)",


          style: new TextStyle(
            fontSize: 16.0, color: Colors.white,
          ),
        ),
      ),




      // child: Text(
      //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
      //   style: TextStyle(fontSize: 16.0, color: Colors.white),
      // ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[
          alucard, welcome, lorem

        ],
      ),
    );

    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Item Details"),),
        backgroundColor: Colors.lightBlue,
      ),
      body: body,
    );
  }

}

