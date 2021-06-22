import 'package:first/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changebutton = false;
  String name = "";
  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if(_formkey.currentState!.validate()){
    setState(() {
      changebutton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeroute);
    setState(() {
      changebutton = false;
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/apple.jpg",
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "apple is red $name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      
                      decoration: InputDecoration(
                        hintText: "Enter your username", 
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Username cannot be empty";
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
                        hintText: "Enter your Password",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value!.isEmpty)
                       {return "Password cannot be empty";} 
                       else if (value.length<8){
                         return "password length should be atleast 8";
                       }
                       return null;
                      },
                      
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => movetohome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        alignment: Alignment.center,
                        height: 50,
                        width: changebutton ? 50 : 150,
                        child: changebutton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius:
                                BorderRadius.circular(changebutton ? 50 : 8)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
