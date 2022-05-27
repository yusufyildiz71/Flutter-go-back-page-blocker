// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'try back blocker',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomePage());
  }
}

// Ana Sayfa
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('geri gidemezsin!'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('2. Sayfa'),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => OtherPage()));
          },
        ),
      ),
    );
  }
}

// 2. Sayfa
class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Geriye dönemezsin')));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('2.Sayfa'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            'Geriye dönemezsin !!!!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}