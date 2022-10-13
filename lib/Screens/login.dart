import 'package:flutter/material.dart';
import 'package:liz_store/Screens/register.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              height: 450,
              width: 300,
              decoration:BoxDecoration(
                color: Color(0XFF385C0F),
                borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/dclogo.png',fit: BoxFit.cover,),
                    ),//Email
                    Text('Login',style: TextStyle(fontSize: 29,color: Colors.white),),// il
                    SizedBox(height: 20,), // TextField
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
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
                          autofocus: false,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
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
                    Row(
                      children: [
                        const Text('Have an account??',style:TextStyle(color:Colors.white),),TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Register()));
                        },child: Text('SignUp'),)
                      ],
                    ),
                    SizedBox(height: 25,),




                    //MaterialButton
                    MaterialButton(
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (ctx) => Login()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


