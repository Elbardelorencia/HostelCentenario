import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
      padding: EdgeInsets.zero,
      children: [
        /* DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Center(
            child: Text('Iniciaste sesion como '),
          ),
        ),*/
        const SizedBox(
          height: 60,
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Usuario'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          // ignore: prefer_const_constructors
          leading: Icon(Icons.logout),
          title: const Text('Cerrar Sesion'),
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    )));
  }
}
