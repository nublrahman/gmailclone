import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Email {
  final String subject;
  final String sender;
  bool isStarred;

  Email({required this.subject, required this.sender, this.isStarred = false});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Email> emails = List.generate(
    20, // Change the number of emails to 20
    (index) => Email(subject: 'Mail $index', sender: 'Sender $index'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmail Clone'),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_picture.jpg'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(emails[index].subject),
            subtitle: Text(emails[index].sender),
            trailing: IconButton(
              icon: Icon(
                emails[index].isStarred ? Icons.star : Icons.star_border,
                color: emails[index].isStarred ? Colors.amber : null,
              ),
              onPressed: () {
                setState(() {
                  emails[index].isStarred = !emails[index].isStarred;
                });
              },
            ),
            // Add your mail item UI here
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Compose feature in progress'),
            ),
          );
        },
        child: Icon(Icons.edit),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Mail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Meet',
          ),
        ],
      ),
    );
  }
}
