import 'package:flutter/material.dart';
import 'package:prac/modules/login_screen.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  static String? savedEmail;
  static String? savedPassword;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 50),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email must not be empty';
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    SizedBox(height: 23),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 17),
                    MaterialButton(
                      color: Colors.deepPurple,
                      child: Text('SIGN UP',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Invalid input!")),
                          );
                        } else {
                          savedEmail = emailController.text;
                          savedPassword = passwordController.text;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Sign up successful!")),
                          );

                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(width: 20,),
                        TextButton(
                          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));},
                          child: Text(
                            " Log in",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
