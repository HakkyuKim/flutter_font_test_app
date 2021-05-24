import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Font Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Font Test App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Font Test App"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            _createText('English', fontFamily: 'CustomEnglish'),
            _createSubText('English text using custom font.'),
            SizedBox(
              height: 15,
            ),
            _createText('한글', fontFamily: 'CustomKorean'),
            _createSubText('Korean text using custom font.'),
            SizedBox(
              height: 15,
            ),
            _createText('한글', fontFamily: 'CustomEnglish'),
            _createSubText(
                'Korean text using custom font that has no matching glyph.\n'
                'Flutter will use system fallback font.'),
            SizedBox(
              height: 15,
            ),
            _createText('English Default'),
            _createSubText('English text using system default.'),
            SizedBox(
              height: 15,
            ),
            _createText('한글 기본'),
            _createSubText('Korean text using system default.'),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget _createText(
    String text, {
    String fontFamily = '',
    double fontSize = 26,
  }) {
    if (fontFamily.isEmpty || fontFamily == 'default') {
      return Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _createSubText(
    String text, {
    String fontFamily = 'NotoSans',
  }) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontFamily: fontFamily),
        textAlign: TextAlign.center,
      ),
    );
  }
}
