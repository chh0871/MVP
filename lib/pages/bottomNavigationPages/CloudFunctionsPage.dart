import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionsPage extends StatefulWidget {
  const CloudFunctionsPage({super.key});

  @override
  CloudFunctionsPageState createState() {
    return CloudFunctionsPageState();
  }
}

class CloudFunctionsPageState extends State<CloudFunctionsPage> {
  // Cloud Functions
  final FirebaseFunctions functions = FirebaseFunctions.instance;

  // Form
  final formKey = GlobalKey<FormState>();
  String? email;

  String? emailAddressValidator(String? email) {
    if (email == null || !email.contains("@")) {
      return "Please enter a valid email";
    }
    return null;
  }

  int lastEmailTimestamp = 0;

  Future<void> sendEmail(String? email) async {
    try {
      final HttpsCallableResult result = await functions.httpsCallable("EmailSender").call(email);
      if (result.data != null) {
        print("Message received from EmailSender: ${result.data}");
      } else {
        print("Error: no data received");
      }
    } on FirebaseFunctionsException catch (err) {
      print("Error: ${err.message}");
    } catch(err) {
      print("Error: $err");
    }
  }

  void onSendEmailClicked() {
    // prevent spam
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - lastEmailTimestamp > 1000 * 60) { // once per minute
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        sendEmail(email);
        lastEmailTimestamp = DateTime.now().millisecondsSinceEpoch;
      }
    } else {
      print("Spam prevented");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cloud Functions"),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: const Text(
                      "Email Sender",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 36
                      ),
                    )
                ),
                Form(
                  key: formKey,
                  child: Padding(
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
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
                    child: Center(
                        child: ElevatedButton(
                          onPressed: onSendEmailClicked,
                          child: const Text('Send Demo Email'),
                        )
                    )
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
                    child: const Center(
                        child: Text(
                          "(limit one per minute)"
                        )
                    )
                ),
              ]
          )
        )
    );
  }
}