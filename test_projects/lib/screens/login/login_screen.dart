import 'package:flutter/material.dart';
import 'package:test_projects/screens/signup/signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: formWidget(),
    );
  }

  Widget formWidget() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          // mainAxisAlignment : MainAxisAlignment.start,
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.0,
              child: Image.asset('assets/index.png'),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),

          userField(),
          SizedBox(
            width: 5.0,
          ),
          passwordField(),
          SizedBox(
            width: 5.0,
          ),
          Container(margin: EdgeInsets.only(top: 10.0)),

          submitButton(),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignPage()),
                    );

                    //Navigator.of(context).pushNamed('/sign');
                    print("Routing to Sign up screen");
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.orange[200],
                        fontSize: 15),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(labelText: "User Name:", hintText: "username"),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a valid username';
        }
        return null;
      },
      onSaved: (String value) {
        this.email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Password", hintText: "password"),
      validator: (value) {
        if (value.trim().length < 6) {
          return 'Password must me at least 6 characters';
        }
        return null;
      },
      onSaved: (String value) {
        this.password = value;
      },
    );
  }







  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to post $email and $password to API');
        }
      },
      textColor: Colors.white,
      elevation: 10.0,
      padding: EdgeInsets.only(right: 150, left: 150),
      child: Text(
        'Log In',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    );

    /*
    return RaisedButton(
      color: Colors.lightBlue,
      textColor: Colors.white,
      child: Text("Submit"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to post $email and $password to API');
        }
      },
    );

    */
  }
}
