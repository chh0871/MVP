import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  AuthenticationPageState createState() {
    return AuthenticationPageState();
  }
}

class AuthenticationPageState extends State<AuthenticationPage> {
  AuthenticationPageState() {
    monitorAuthenticationState();
  }

  // Authentication

  final FirebaseAuth auth = FirebaseAuth.instance;
  String errorMessage = "";
  String? email;
  String? password;
  User? user;
  monitorAuthenticationState() {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        print("Authentication: User logged in");
      } else {
        print("Authentication: User logged out");
      }
      setState(() {
        this.user = user;
      });
    });
  }

  registerAccountUsingEmail(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (err) {
      if (err.code == "weak-password") {
        setState(() {
          errorMessage = "Please enter a stronger password";
        });
      } else if (err.code == "email-already-in-use") {
        setState(() {
          errorMessage = "This email has already been registered to another account";
        });
      }
    } catch (err) { // other errors
      print(err);
    }
  }

  loginUsingEmail(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (err) {
      if (err.code == "user-not-found") {
        setState(() {
          errorMessage = "There is no account connected to this email address";
        });
      } else if (err.code == "wrong-password") {
        setState(() {
          errorMessage = "Incorrect password";
        });
      }
    } catch (err) { // other errors
      print(err);
    }
  }

  logOut() async {
    await auth.signOut();
  }

  // Form

  final formKey = GlobalKey<FormState>();

  String? emailAddressValidator(String? email) {
    if (email == null || !email.contains("@")) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.length < 5) {
      return "Password must be at least 5 characters";
    } else if (password.length > 25) {
      return "Password must be at most 25 characters";
    }
    return null;
  }

  onRegisterFormSubmitted() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (email != null && password != null) {
        registerAccountUsingEmail(email!, password!);
      }
    }
  }

  onLoginFormSubmitted() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (email != null && password != null) {
        loginUsingEmail(email!, password!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Authentication"),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Form(
            key: formKey,
            child:
              user == null ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Email"
                      ),
                      validator: emailAddressValidator,
                      onSaved: (value) {
                        email = value;
                      }
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: "Password"
                      ),
                      validator: passwordValidator,
                      onSaved: (value) {
                        password = value;
                      },
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
                    child: Center(
                        child: Text(
                            errorMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                            )
                        )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: onRegisterFormSubmitted,
                            child: const Text('Register'),
                          ),
                          ElevatedButton(
                            onPressed: onLoginFormSubmitted,
                            child: const Text('Login'),
                          ),
                        ]
                    )
                  )
                ]
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
                      child: Center(
                          child: Text(
                              "Welcome, ${user!.email}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 36
                              )
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
                      child: Center(
                          child: ElevatedButton(
                            onPressed: logOut,
                            child: const Text('Logout'),
                          )
                      )
                  ),
                ],
              )
          )
        )
    );
  }
}