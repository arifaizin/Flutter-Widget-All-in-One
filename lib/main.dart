import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
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
  String language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white,),
        ),
        title: Text('First Screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                child: Text('Hi', style: TextStyle(fontSize: 40),),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(color: Colors.black, offset: Offset(3, 6), blurRadius: 10)
                  ],
                  border: Border.all(color: Colors.green, width: 3),
                  borderRadius: BorderRadius.circular(10) //harus shape rectangle
                ),
                // color: Colors.blue, //error double sama decoration
                width: 75,
                height: 75,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10)
            ),
            Text(
              'Sebuah Judul',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text('Lorem ipsum dolor sit amet'),
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
                  onPressed: (){
                    // Aksi ketika button diklik
                  },
                  child: Text('Tombol'),
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    // Aksi ketika button diklik
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
          ],
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
  Widget build(BuildContext context){
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
          onPressed: (){
            setState(() {
              _ukuranText = 32.0;
            });
          },
        )
      ],
    );
  }
}