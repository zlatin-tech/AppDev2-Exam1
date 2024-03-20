import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';

  var _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Store'),
      ),
      body: Center(

        child: Column(
          children:[
            Image(image: AssetImage('assets/opening.png')),
            Text('Welcome to Book Store'),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name'
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                name = _nameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen(name: name)),
                );
              },
              child: Text('Visit'),
            )
            ]
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  String? name;
  

  SecondScreen({Key? key, this.name}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<dynamic> books = [
    {
      'title': 'Coffee House',
      'price': 1,
      'image': 'assets/book0.png'
    },
    {
      'title': 'Taming Jaguar',
      'price': 550,
      'image': 'assets/book1.png'
    },
    {
      'title': 'Whatever this long name is',
      'price': 250,
      'image': 'assets/book1.png'
    },
    {
      'title': 'Java',
      'price': 300,
      'image': 'assets/book3.png'
    },
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Store'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search for a book'
          ),
        ),
            Text('Welcome, ${widget.name}!'),
            Expanded(child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
              return ListTile(
              leading: Image.asset(books[index]['image']),
              title: Text(books[index]['title']),
              subtitle: Text('Price: \$${books[index]['price']}'),
            );
          })),
          ],
        ),
      ),
    );
  }
}