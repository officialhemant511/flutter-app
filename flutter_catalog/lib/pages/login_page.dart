import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButtom = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButtom = true;
      });
      //await means wait for a while(particular duration) then go further page
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButtom = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MY APP"),
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          // is size of device is small so it will be scroll
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hi.png",
                  fit: BoxFit.cover,
                  // height: 300,
                  // color: Colors.yellow,
                ),
                SizedBox(
                  child: Text(
                    "Hellow $name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.lato().fontFamily,
                    ),
                  ),
                  // width: 90.0,
                  height: 21.0,
                ),
                Text(
                  "welcome",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username ",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password ",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 8) {
                            return "password length should be atleast 8";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),

                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeButtom ? 50 : 8),
                        child: InkWell(
                          // ink well always work if material is ansistor
                          onTap: () => moveToHome(
                              context), // we defined move to Home  function above
                          // '=>' arrow operator used when we need to return null in one line
                          // async {

                          // setState(() {
                          //   changeButtom = true;
                          // });
                          // //await means wait for a while(particular duration) then go further page
                          // await Future.delayed(Duration(seconds: 1));
                          // await Navigator.pushNamed(
                          //     context, MyRoutes.homeRoute);
                          // setState(() {
                          //   changeButtom = false;
                          // });

                          // },
                          child: AnimatedContainer(
                            // use to make box like login button without using predefined elevated buttom
                            //
                            duration: Duration(seconds: 1),
                            width: changeButtom ? 50 : 150,
                            height: 40,
                            alignment: Alignment
                                .center, // aling text at particular position like center
                            child: changeButtom
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            // decoration is generally used to decorate or to make our box attractive
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     // shape: changeButtom?BoxShape.circle:BoxShape.rectangle,
                            //     borderRadius:
                            //         BorderRadius.circular(changeButtom ? 20 : 8)
                            //         ),
                          ),
                        ),
                      ),

                      // elevatedButton is predefined function in material lib...

                      // ElevatedButton(
                      //   child: Text("Login"),
                      //   style: TextButton.styleFrom(minimumSize: Size(100, 45)),
                      //   onPressed: () {
                      //     // print("Hello hemant"); this is action done while pressing login buttom
                      //     // we use navigator to go another class part of material lib
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
