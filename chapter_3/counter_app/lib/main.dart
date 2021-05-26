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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Exercise 3.5.2 Example of composition
class PanicButton extends StatelessWidget {
  	final Widget display;
	final VoidCallback onPressed;
	
	// This widget's config is passed in to it, including the widget to disp. Imagine the disp passed in is Text("Panic")
	PanicButton ({this.display, this.onPressed});
		
	Widget build(BuildContext context) {
		RaisedButton (
			color: Colors.red,  // sets the button's background color to red
			child: display, 	// this text widget is passed in from the parent.
			onPressed: onPressed, // this cb is passed in as well. Makes it flexi. Doesn't care about the cb and isn't tied to any certain function.
								  // Only cares about displaying a button & telling its parents when that button is pressed (via cb)
		);
	}	
}
  

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  
  //Exercise 3.4.1
  void _decrementCounter() {
	//setState takes a callback as an argument, which should solely update pieces
	//if state in the widget
	setState(() => _counter--); 
  }
  
  void _resetCounter() {
	setState(() => _counter = 0);
  }	  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
		  // Add container widget around the image asset Cp 3.6.9	
		  Container(
			// Puts space btwn widgets. EdgeInsets.only constructor tells Flutter where to add the margin (100 pixels of margin below this widget)
			margin: EdgeInsets.only(bottom: 100.0), 
			// Adds space around the current widget. EdgeInsets.all puts space on all sides
			padding: EdgeInsets.all(8.0),
			// Pass decoration a class called BoxDecoration which decorates boxes
			decoration: BoxDecoration(
				// Sets the background color
				color: Colors.blue.withOpacity(0.25),
				// BorderRadius has multiple constructors:use circular when you want to curve all 4 corners of the box
				borderRadius: BorderRadius.circular(4.0), 
			),
            //Add Image widget to Column widget's children
			child: Image.asset(		//Passes the image in to the child property
				'flutter_logo_1080.png',
				width: 100.0,
			),
		  ),	
			Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
			//Exercise 3.4.1 L onPressed is a propery on a button that expects
			// a callback. By passing in a callback, we manage state in this
			//parent widget (another common pattern)
			Row(
				mainAxisAlignment: MainAxisAlignment.spaceAround, //uses the spaceAround alignment option
				children: <Widget>[
					RaisedButton (
						color: Colors.red,
						child: Text(
							"Decrement",
							style: TextStyle(color: Colors.white),
						),
						onPressed: _decrementCounter,
					),
					RaisedButton (
						color: Colors.green,
						child: Text(
							"Increment",
							style: TextStyle(color: Colors.white),
						),
						onPressed: _incrementCounter,
					),			
				],
			),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
		onPressed: _resetCounter,
        //tooltip: 'Increment',
        tooltip: 'Reset Counter',
		//child: Icon(Icons.add),
		child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
