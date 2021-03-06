import 'package:flutter/material.dart';
import 'package:mtms/ui/home/getticket.dart';
import 'package:flutter/widgets.dart';
import 'package:mtms/ui/home/myticketsnip.dart';
import 'package:mtms/ui/home/payfine.dart';
// No ticket class

class MainContentPage extends StatefulWidget {
  const MainContentPage({Key? key}) : super(key: key);

  @override
  State<MainContentPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MainContentPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    // If no ticket is bought
    GetTicket(),
    // If ticket is already bought
    TicketSnip(),
    PayFine(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
          title: const Text('mtms.io'),
          backgroundColor: Colors.white24,
          actions: <Widget>[
            TextButton(
              style: style,
              onPressed: () {},
              child: const Text('Sign out'),
            ),
          ]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'get',
            backgroundColor: Colors.white12,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.white12,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.white12,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.white24,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
