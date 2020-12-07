import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
            bottom: height / 2.4,
            child: Image.network(
              'https://i.ibb.co/Y2CNM8V/new-york.jpg',
              height: height,
            )),
        Positioned(
          bottom: 0,
          child: Container(
            height: height / 2.4,
            width: width,
            color: Color(0xFF2D2C35),
          ),
        ),
        Foreground(),
      ],
    );
  }
}

class Foreground extends StatelessWidget {
  const Foreground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => {},
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://github.com/mickaelxd.png'),
                backgroundColor: Colors.black26,
              ),
              onPressed: () => {})
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: DefaultTextStyle(
          style: GoogleFonts.raleway(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                'Hello Mickael',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 5),
              Text(
                'Check the weather by the city',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)
              ),
              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
