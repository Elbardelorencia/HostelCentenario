import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  // textcontroller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cmpasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Confirma tu contraseña'),
      ));
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _cmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _cmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                const Icon(
                  Icons.airline_seat_individual_suite_rounded,
                  size: 100,
                ),
                const SizedBox(height: 75),

                //Hello Again!
                Text(
                  'Hostel Pergamino',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Registrate para ingresar',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 50),
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //pw
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Contraseña',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //cmpw
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _cmpasswordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Confirmar Contraseña',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Boton login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ), //decoracion
                      child: const Center(
                        child: Text(
                          'Registrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ), //estilo de texto boton
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        'Ya tengo cuenta',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
