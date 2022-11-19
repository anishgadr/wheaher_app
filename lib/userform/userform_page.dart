// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:whether_app/db/funtions/db_functions.dart';
import 'package:whether_app/db/models/data_model.dart';

class AddNewUser extends StatefulWidget {
  @override
  AddNewUserState createState() {
    return AddNewUserState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class AddNewUserState extends State<AddNewUser> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController lastNameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF556bf9),
        title: const Text("Add New User"),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'First Name',
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return 'Please Enter First Name';
                          }
                        }
                      },
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Last Name',
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return 'Please Enter Last Name';
                          }
                        }
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'Email ID',
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return 'Please Enter Email ID';
                          } else {
                            if (validateEmail(value)) {
                              return 'Please Enter valid Email ID';
                            }
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextButton(
                          onPressed: (() {
                            // It returns true if the form is valid, otherwise returns false
                            if (_formKey.currentState!.validate()) {
                              final _user = UserDataModel(
                                  firstname: firstNameController.text,
                                  lastname: lastNameController.text,
                                  emailid: emailController.text,
                                  wheather_status: 0);

                              addUserData(_user);
                            }

                            //  Navigator.pop(context);
                          }),
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF556bf9)),
                          child: const Text(
                            "ADD",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextButton(
                                onPressed: null,
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 231, 174, 4)),
                                child: const Text(
                                  "CANCEL",
                                  style: TextStyle(color: Colors.white),
                                )))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }
}
