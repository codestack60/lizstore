import 'package:flutter/material.dart';
import 'package:liz_store/Screens/homepage.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final secondNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundimage.jpg'),fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                height: 750,
                width: 400,
                decoration:BoxDecoration(
                    color: Color(0XFF385C0F),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        SizedBox(height: 50,),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/dclogo.png',fit: BoxFit.cover,),
                        ),//Ema
                        Text('Register',style: TextStyle(fontSize: 29),),// il
                        SizedBox(height: 20,), // T
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: firstnameController,
                              validator: (val){
                              if(val!.isEmpty){
                                return "FirstName Cannot Be empty";
                              }
                              if(val.length < 3){
                                return 'name mustb be greater than 3';
                              }
                              return null;
                              },
                              autofocus: false,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white54,
                                prefixIcon: Icon(Icons.person,color: Colors.white70,),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Enter FirstName",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                        ),// ex

                        ///LAstname
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: secondNameController,
                              autofocus: false,
                              validator: (val){
                                if(val!.isEmpty){
                                  return "Lastname Cannot Be empty";
                                }
                                if(val.length < 3){
                                  return 'name mustb be greater than 3';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                filled: true,
                                errorStyle: TextStyle(color: Colors.white),
                                fillColor: Colors.white54,
                                prefixIcon: Icon(Icons.person,color: Colors.white70,),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Enter LastName",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                        ),
                        ///PHONE

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: phoneController,
                              autofocus: false,
                              validator: (val){
                                if(val!.isEmpty){
                                  return "phonenumber Cannot Be empty";
                                }
                                if(val.length < 11 || val.length > 11){
                                  return 'please input a valid phone number';
                                }

                                return null;
                              },
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                filled: true,
                                errorStyle: TextStyle(color: Colors.white),
                                fillColor: Colors.white54,
                                prefixIcon: Icon(Icons.phone_android,color: Colors.white70,),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Enter PhoneNumber",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                        ),///
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailController,
                              autofocus: false,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (val){
                              if(val!.isEmpty){
                                return 'email cannot be empty';
                              }
                              return null;
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white54,
                                prefixIcon: Icon(Icons.mail,color: Colors.white70,),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Enter Email",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                        ),
//Password TextField
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: passwordController,
                              autofocus: false,

                              validator: (val){
                                if(val!.isEmpty){
                                  return "password Cannot Be empty";
                                }
                                if(val.length < 6){
                                  return 'name mustb be greater than 3';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white54,
                                prefixIcon: Icon(Icons.vpn_key,color: Colors.white70),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Enter Password",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: cpasswordController,
                              validator: (val){
                                if(val!.isEmpty){
                                  return "password Cannot Be empty";
                                }
                                if(cpasswordController.text != passwordController.text){
                                  return 'oops password do not match';
                                }
                                return null;
                              },
                              autofocus: false,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white54,
                                prefixIcon: Icon(Icons.vpn_key,color: Colors.white70),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                        ),
                        SizedBox(height: 25,),
                        Row(
                          children: [
                            Text('Have an account??',style:TextStyle(color:Colors.white),),TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
                            },child: Text('login'),)
                          ],
                        ),




                        //MaterialButton
                        MaterialButton(
                          color: Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                             // print('its validated');

                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
