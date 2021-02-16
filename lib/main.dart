import 'package:flutter/material.dart';
import 'package:flutter_app/rainbow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oswald',
        primarySwatch: Colors.blue,
      ),
      // home: RainbowScreen(),
      home: FirstScreen(),
      // home: Scaffold(
      //   body: Center(
      //     // child: Heading( // mengubah widget Text
      //     //   text:"Hello world!",
      //     // ),
      //     child: PerubahanText(text:"Hello world!"), // Ubah widget Heading ke PerubahanText
      //
      //   ),
      // ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double _ukuranText = 16.0;
  String language = 'Dart';
  String email = '';
  bool agree = false;
  final List<String> image = <String>[
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text('First Screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  child: Text(
                    'Hi',
                    style: TextStyle(fontSize: 40),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(3, 6),
                            blurRadius: 10)
                      ],
                      border: Border.all(color: Colors.green, width: 3),
                      borderRadius:
                          BorderRadius.circular(10) //harus shape rectangle
                      ),
                  // color: Colors.blue, //error double sama decoration
                  width: 75,
                  height: 75,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10)),
              Text(
                'Sebuah Judul',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Lorem ipsum dolor sit amet',
                style: TextStyle(fontSize: _ukuranText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.share)),
                  IconButton(icon: Icon(Icons.thumb_up)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      // Aksi ketika button diklik
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RainbowScreen(language);
                      }));
                    },
                    child: Text('Launch Rainbow!'),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        _ukuranText = 32.0;
                      });
                    },
                    child: Text(
                      'Flat Button',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  DropdownButton<String>(
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'Dart',
                        child: Text('Dart'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Kotlin',
                        child: Text('Kotlin'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Swift',
                        child: Text('Swift'),
                      ),
                    ],
                    value: language,
                    hint: Text('Select Language'),
                    onChanged: (String value) {
                      setState(() {
                        language = value;
                      });
                    },
                  ),
                ],
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Dart',
                  groupValue: language,
                  onChanged: (String value) {
                    setState(() {
                      language = value;
                    });
                  },
                ),
                title: Text('Dart'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Kotlin',
                  groupValue: language,
                  onChanged: (String value) {
                    setState(() {
                      language = value;
                    });
                  },
                ),
                title: Text('Kotlin'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Swift',
                  groupValue: language,
                  onChanged: (String value) {
                    setState(() {
                      language = value;
                    });
                  },
                ),
                title: Text('Swift'),
              ),
              ListTile(
                leading: Checkbox(
                  value: agree,
                  onChanged: (bool value) {
                    setState(() {
                      agree = value;
                    });
                  },
                ),
                title: Text('Agree / Disagree'),
              ),
              Switch(
                value: agree,
                onChanged: (bool value) {
                  setState(() {
                    agree = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.network(
                    'https://picsum.photos/200/300',
                    width: 200,
                    height: 200,
                  ),
                  Image.asset('images/Clipart1244717.png',
                      width: 200, height: 200)
                ],
              ),
              Container(
                height: 150,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: image.map((linkImage) {
                      return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network("$linkImage")),
                        );
                    }).toList()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String text;

  Heading({Key key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PerubahanText extends StatefulWidget {
  final String text;

  const PerubahanText({Key key, this.text}) : super(key: key);

  @override
  _PerubahanTextState createState() => _PerubahanTextState();
}

class _PerubahanTextState extends State<PerubahanText> {
  double _ukuranText = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _ukuranText)),
        RaisedButton(
          child: Text("Perbesar"),
          onPressed: () {
            setState(() {
              _ukuranText = 32.0;
            });
          },
        )
      ],
    );
  }
}
