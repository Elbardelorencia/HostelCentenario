import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenido'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
        drawer: Drawer(
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
        ),
      );
}
