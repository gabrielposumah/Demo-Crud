import 'package:demo_crud/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('Users');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.touch_app_outlined,
                size: 120, color: Color.fromARGB(255, 102, 153, 241)),
            const SizedBox(height: 50),
            GTextFormField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: const Icon(Icons.person)),
            const SizedBox(height: 20),
            GTextFormField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                textInputType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.key)),
            const SizedBox(height: 40),
            SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onPressed: () {
                      users.add({
                        'email': emailController.text,
                        'password': passwordController.text,
                      });

                      emailController.text = '';
                      passwordController.text = '';
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.poppins(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
