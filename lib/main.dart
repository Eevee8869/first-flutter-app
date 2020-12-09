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
    var inputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(30.0)));
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://github.com/mickaelxd.png'),
                backgroundColor: Colors.black26,
              ),
              onPressed: () {})
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
                'Olá Mickael',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 5),
              Text('Verifique o clima por cidade',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              SizedBox(height: 35),
              TextField(
                decoration: InputDecoration(
                    border: inputBorder,
                    enabledBorder: inputBorder,
                    focusedBorder: inputBorder,
                    hintText: 'Pesquisar cidade',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
              SizedBox(height: height * 0.30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Minhas localidades',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Icon(Icons.more_horiz),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(width: 1, color: Colors.white),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var location in locations)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black45, BlendMode.darken),
                            child: Image.network(
                              location.imageUrl,
                              height: height * 0.35,
                              width: width * 0.40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            children: [
                              Text(location.text,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600)),
                              Text(location.timing),
                              SizedBox(height: 40),
                              Text(location.temperature.toString() + 'º',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 50),
                              Text(location.weather)
                            ],
                          )
                        ],
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Location {
  final String text;
  final String timing;
  final int temperature;
  final String weather;
  final String imageUrl;

  Location(
      {this.text, this.timing, this.temperature, this.weather, this.imageUrl});
}

final locations = [
  Location(
      text: 'Blumenau',
      imageUrl:
          'https://www.transportal.com.br/noticias/wp-content/uploads/2018/12/Rua-do-Centro-de-Blumenau.jpg',
      temperature: 19,
      timing: '14:50',
      weather: 'Ensolarado'),
  Location(
      text: 'Itajaí',
      imageUrl:
          'https://edificart.com.br/uploads/imagens/800x600_5-motivos-para-voce-viver-em-itajai-7-8837.jpg',
      temperature: 21,
      timing: '14:50',
      weather: 'Nublado')
];
