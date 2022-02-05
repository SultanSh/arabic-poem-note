import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:clay_containers/clay_containers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      title: 'Localizations Sample App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'كاتب الشعر'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // Create a text controller and use it to retrieve the current value
  // of the TextField.


  // @override
  // Widget build(BuildContext context) {
  //   // Fill this out in the next step.
  // }
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController(text: 'الشطر الأول');
  final myController2 = TextEditingController(text: 'الشطر  الثاني');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    String initialLabel1 = 'الشطر الأول';
    String initialLabel2 = 'الشطر  الثاني';
    bool isCleared1 = false;
    bool isCleared2 = false;
    List<String> myList = [initialLabel1,initialLabel2];
    int baitNumber = 0;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            // Text('الشطر الأول'),
            // FancyContainer(
            //   onTap: (){
            //     print("بسم الله");
            //   },
            //   color1: Colors.lightGreenAccent,
            //   color2: Colors.lightBlue,
            //   title: 'أحبك',
            //   textcolor: Colors.white,
            //   subtitle: 'يا جميل',
            //   subtitlecolor: Colors.white,
            // )
        Text(''),
        ClayContainer(
          curveType: CurveType.none,
          color: Color(0xFFF2F2F2),
             depth: 40,
             spread: 4,
             height: 100,
          child: TextFormField(
            controller: myController,
            onTap: (){
              if(myController.text == initialLabel1 )
              {
                myController.text = '';
              }
              },
            onFieldSubmitted: (text)
            {
              print(myList);
              },
            onChanged: (text)
            {
              print(myList);
            myList[baitNumber] = myController.text;
              },
            decoration:  InputDecoration(
            border: UnderlineInputBorder(),
            labelText: '',
            alignLabelWithHint: true,
              ),
              // textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 28),
            ),
            ),
              // Text('الشطر الثاني'),
            Text(''),
        ClayContainer(
            color: Color(0xFFF2F2F2),
            depth: 40,
            spread: 4,
            height: 100,

          child: TextFormField(
          // textDirection: TextDirection.rtl,
            onFieldSubmitted: (text){print(myList);},
            onTap: (){if(myController2.text == initialLabel2 ) {myController2.text = '';}},
            onChanged: (text)
            {
              print(myList);
              myList[baitNumber+1] = myController2.text;
            },
            controller: myController2,
            textDirection: TextDirection.ltr,
          decoration:  InputDecoration(
            border: UnderlineInputBorder(),
            labelText: '',
          ),
          style: const TextStyle(fontSize: 28),
        ),

        ),

        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () {
                if (baitNumber > 0)
                {
                  baitNumber -= 2;
                  print(baitNumber);
                  print(myList);
                  myController.text  = myList[baitNumber];
                  myController2.text = myList[baitNumber+1];
                }
              },
              child: const Icon(
                Icons.arrow_downward,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              heroTag: 'next',
              onPressed: ()
              {
                baitNumber += 2;
                myList.add(initialLabel1);
                myList.add(initialLabel2);
                print(baitNumber);
                print(myList);
                myController.text = myList[baitNumber];
                myController2.text = myList[baitNumber+1];
                },
              child: const Icon(
                Icons.arrow_upward,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }
}
