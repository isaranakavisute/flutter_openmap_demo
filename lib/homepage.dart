import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:testandroid2/models/user.dart';
import 'package:testandroid2/serviceApi.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  FocusNode focususername = FocusNode();
  FocusNode focuspassword = FocusNode();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {

    usernameController.text =  "Please enter username";
    passwordController.text =  "Please enter password";

    focususername.addListener(() {
      if (focususername.hasFocus)
       {if (usernameController.text == "Please enter username" )
         usernameController.clear();
       }});

    focuspassword.addListener(() {
      if (focuspassword.hasFocus) 
      {
        if (passwordController.text == "Please enter password" )
         passwordController.clear();
      }
    });

    super.initState();
  }

  void reset_textformfield() {
    usernameController.text =  "Please enter username";
    passwordController.text =  "Please enter password";
  }

  Future<void> getLoginStatus() async {

    //log(usernameController.text);
    //log(passwordController.text);
    //print(usernameController.text);
    //print(passwordController.text);

    final login_status = await ServiceApi.getLoginStatus(username: usernameController.text, password: passwordController.text); 
    print(login_status.status);
    if (login_status.status == "success")
     print('success login');
    else
     print('failed login');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
   

    return Scaffold(
       appBar: AppBar
       (
        title : const Center(child: Text('Please login'))
       ),
       body: Form(
        key: _formKey,
        child:
        Center(
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        Container(
         padding: const EdgeInsets.all(12),
         margin: const EdgeInsets.only(),
         width: size.width*0.80,
        child: TextFormField(
        //style: TextStyle(color: Colors.green),
        focusNode: focususername,
        controller: usernameController,
        maxLength: 40,
        decoration: const InputDecoration(
        hintText: "Please enter username",
        labelText: 'Username',
        labelStyle: TextStyle(
        color: Colors.blueGrey,
        ),
        enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
        color: Colors.blueGrey,
        ),
        ),
        ),
        onChanged: (value) {},
        ),
        ),

        Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(),
        width: size.width*0.80,
        child: TextFormField(
        //style: TextStyle(color: Colors.green),
        focusNode: focuspassword,
        controller: passwordController,
        maxLength: 40,
        decoration: const InputDecoration(
        hintText: "Please enter password",
        labelText: 'Password',
        labelStyle: TextStyle(
        color: Colors.blueGrey,
        ),
        enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
        color: Colors.blueGrey,
        ),
        ),
        ),
        onChanged: (value) {},
        ),
        ),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
            ElevatedButton(
             onPressed: ()=> {getLoginStatus()
              //User obj = ServiceApi.getLoginStatus(username: usernameController.text, password: passwordController.text);
             }, 
             child: Text('OK') 
             ),
            ElevatedButton(
             onPressed: ()=>{reset_textformfield()},
             child: Text('CANCEL'),
            ),
            ]
          ),
        



        ]
       ),
       ),
       ),
       );
    
  }
  
 
}