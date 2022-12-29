import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel/pages/home_page.dart';
import 'package:hostel/pages/hub_page.dart';
import 'package:hostel/pages/reserve_page.dart';
import 'package:hostel/pages/settings_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List<Widget> _tabItems = [
    HomePage(),
    HubPage(),
    ReservePage(),
    SettingsPage()
  ];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;

  @override
/*
  //id
  List<String> docIDs = [];
  //Get docsIDS
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }
*/
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.deepPurple,
      body: _tabItems[_page],
      //navegacion inferior
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade100,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.bed, color: Colors.white),
          Icon(Icons.calendar_month, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ));
  /*  drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text('Iniciaste sesion como ' + user.email!),
                ),
              ),
              ListTile(
                title: const Text('Configuracion'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Cerrar Sesion'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),*/
}
