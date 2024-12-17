import 'package:flutter/material.dart';
import 'package:prac/layout/layout.dart';
import 'package:prac/modules/signup_screen.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Log in",
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold,color: Colors.grey[800]),
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
                  child: Text("login", style: TextStyle(fontSize: 18,color: Colors.white)),
                  onPressed: ()
                  {
                    if (emailController.text == Signup.savedEmail &&
                        passwordController.text == Signup.savedPassword) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLayout(),));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("Invalid email or password")),
                      );
                    }
                  },
                ),
                SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don\'t have an account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20,),
                    TextButton(
                      onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));},
                      child: Text(
                        " SIGN UP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
