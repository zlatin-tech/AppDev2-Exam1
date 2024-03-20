import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
      'image': 'assets/book2.png'
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
          children: [
            TextField(
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
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookDetails(
                          title: books[index]['title'],
                          image: books[index]['image'],
                          price: books[index]['price'].toDouble(),
                        )),
                      );
                    },
                    child: Image.asset(books[index]['image']),
                  ),
                  title: Text(books[index]['title']),
                  subtitle: Text('Price: \$${books[index]['price']}'),
                );
              }
            )),
          ],
        ),
      ),
    );
  }
}


class BookDetails extends StatefulWidget {
  final String title;
  final String image;
  final double price;

  BookDetails({required this.title, required this.image, required this.price});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.image),
            SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${widget.price*quantity}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: decrementQuantity,
                  icon: Icon(Icons.remove),
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: incrementQuantity,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen(
                    balance: widget.price * quantity,
                  )
                  ),
                );
              },
              child: Text('Buy'),
            )
          ],
        ),
      ),
    );
  }
}
class PaymentScreen extends StatelessWidget {
  final double balance;

  PaymentScreen({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Balance: \$${balance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Choose a payment method:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Thanks for the payment of \$${balance.toStringAsFixed(2)}, your request has been processed.'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Text('PhonePe'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Thanks for the payment of \$${balance.toStringAsFixed(2)}, your request has been processed.'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Text('PayPal'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Thanks for the payment of \$${balance.toStringAsFixed(2)}, your request has been processed.'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Text('Google Pay'),
            ),
          ],
        ),
      ),
      //inspired by the flutter default app
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
