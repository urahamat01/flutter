import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_projects/screens/dashboard/dashboard_page.dart';
import 'package:test_projects/screens/signup/camera.dart';
import 'package:test_projects/models/Item.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

enum BestTutorSite { Male, Female }

class _SignPageState extends State<SignPage> {
  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
        'Android',
        Icon(
          Icons.android,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'Flutter',
        Icon(
          Icons.flag,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'ReactNative',
        Icon(
          Icons.format_indent_decrease,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'iOS',
        Icon(
          Icons.mobile_screen_share,
          color: const Color(0xFF167F67),
        )),
  ];

  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  //image camara old
  //dynamic _image;

  // void openCamera(context) async {
  //   final image = await CustomCamera.openCamera();
  //
  //   setState(() {
  //     _image = image;
  //   });
  // }
  //
  // void openGallery(context) async {
  //   final image = await CustomCamera.openGallery();
  //
  //   setState(() {
  //     _image = image;
  //   });
  // }

  bool checkBoxValue = false;
  BestTutorSite _site = BestTutorSite.Male;

  final TextEditingController _currencyController = new TextEditingController();

  String radioItem = 'Male';

  // Group Value for Radio Button.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  //form key here
  final _formKey = GlobalKey<FormState>();

  // variable to enable auto validating of theform
  bool _autoValidate = true;

  // variable to enable toggling between showing and hiding password
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final chooseImage = new Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
              leading: new Icon(Icons.image),
              title: new Text("Selection Galeria"),
              onTap: () {
                _imgFromGallery();
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('Selection Camera'),
            onTap: () {
              _imgFromCamera();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );

    final imageBtn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 60.0,
          // child: Image.asset('assets/images/dp.png'),
          child: _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(_image,
                      width: 100, height: 100, fit: BoxFit.fitHeight),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.cyanAccent,
                      borderRadius: BorderRadius.circular(50)),
                  width: 80,
                  height: 80,
                  child: Image.asset('assets/images/index.png'),

                  // child: Icon(
                  //   Icons.camera_alt,
                  //   color: Colors.grey[800],
                  // ),
                  //
                ),
        ),
        InkWell(
          child: IconButton(
            icon: Icon(Icons.edit_sharp),
            tooltip: 'Upload you image',
          ),
          onTap: () async {
            // print("Click Event");
            return showDialog(
                context: context, child: new AlertDialog(content: chooseImage));
          },
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Sign Up"),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Container(
            padding: EdgeInsets.only(
              right: 20.0,
              left: 20.0,
              top: 5.0,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 2.0,
                    ),

                    imageBtn,

                    /*
                    Container(
                      alignment: Alignment.center,
                      child: IconButton(
                          icon: Icon(
                            Icons.image,
                            size: 25,
                          ),
                          onPressed: () {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: new SingleChildScrollView(
                                      child: new ListBody(
                                        children: <Widget>[
                                          GestureDetector(
                                            child: new Text('Camera Take'),
                                            onTap: () => openCamera(context),

                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                          GestureDetector(
                                            child: new Text('Selection Galeria'),
                                            onTap: () => openGallery(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
*/
                    SizedBox(
                      height: 8.0,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Full Name',

                      ),
                      keyboardType: TextInputType.text,
                      validator: (String value) {
                        return value.isEmpty
                            ? 'Full Name cannot be empty'
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'User Name',
                      ),
                      keyboardType: TextInputType.text,
                      validator: (String value) {
                        return value.isEmpty
                            ? 'Full Name cannot be empty'
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',

                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                    ),

                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                            child: Icon(Icons.remove_red_eye),
                          ),
                          prefixIcon: Icon(Icons.vpn_key),
                          border: OutlineInputBorder(),
                          labelText: 'Password'),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _hidePassword,
                      validator: (String value) {
                        return value.length < 5
                            ? 'Password must be more than 5 characters'
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            'Gender:  ',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Male';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'Male',
                          style: new TextStyle(fontSize: 10.0),
                        ),
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Female';
                              id = 2;
                            });
                          },
                        ),
                        Text(
                          'Famale',
                          style: new TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),

                    // Padding(
                    //     padding: EdgeInsets.only(left: 12, right: 12, top: 6),
                    //     child: Text('Selected Radio Item = ' + '$radioButtonItem',
                    //         style: TextStyle(fontSize: 5))),

                    SizedBox(
                      height: 5.0,
                    ),

                    DropdownButton<Item>(
                      hint: Text("Select item: "),
                      value: selectedUser,
                      onChanged: (Item Value) {
                        setState(() {
                          selectedUser = Value;
                        });
                      },
                      items: users.map((Item user) {
                        return DropdownMenuItem<Item>(
                          value: user,
                          child: Row(
                            children: <Widget>[
                              user.icon,
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                user.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),

                    acceptTermsTextRow(),

                    SizedBox(
                      height: 6.0,
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardPage()),
                          );

                          // if (_formKey.currentState.validate()) {
                          //   Scaffold.of(context).showSnackBar(SnackBar(
                          //     content: Text('Form Validated, No errors'),
                          //   ));
                          // }
                        },
                        textColor: Colors.white,
                        elevation: 2.0,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
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

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            activeColor: Colors.green,
            value: checkBoxValue,
            onChanged: (bool newValue) {
              setState(() {
                //checkbox
                checkBoxValue = newValue;

                /*
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Alert Dialog"),
                          content: Text("Dialog Content"),
                        );
                      }
                  );

                  */
              });
            },
          ),
          FlatButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text(
              'I have reade and accept terms and condition ?',
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 10),
            ),
          )

          //
          // Text(
          //   "I accept all terms and conditions",
          //   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          // ),
        ],
      ),
    );
  }

  // regex method to validate email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Terms of website use :"),
      content: Text(
          "For the purposes of this document, company is defined as Singing for Change."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
